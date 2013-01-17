class LtiController < ApplicationController
  require 'ims/lti'
  require 'oauth/request_proxy/rack_request'
  OAUTH_10_SUPPORT = true
  
  @@oauth_creds = {"test" => "secret", "lti_dashboard" => "adjf324n19addfn0128ac34m", "testing" => 'supersecret', "eastsideprep" => "battlepet"}

  skip_before_filter :verify_authenticity_token, :only => [:connect]
  
  def connect
    message = ''
    if key = params['oauth_consumer_key']
      if secret = @@oauth_creds[key]
        @tool_provider = IMS::LTI::ToolProvider.new(key,secret,params)
        message += "correct key found"
      else
        @tool_provider = IMS::LTI::ToopProvider.new(nil,nil,params)
        @tool_provider.lti_msg = "Your consumer didn't use a recognized key."
        @tool_rovider.lti_errorlog = "Key, missmatch"
        message += "Consumer key wasn't recognized"
      end
    else
      message += "No consumer key"
    end

    if OAuth::Signature.build(request, :consumer_secret => secret).verify()
      message += "OAuth signature valid"
    else
      message += "OAuth signature invalid"
    end

    if Time.now.utc.to_i - @tool_provider.oauth_timestamp.to_i > 60*60
      message +=  "Your request is too old"
      message += " " + (Time.now.utc.to_i - @tool_provider.oauth_timestamp.to_i).to_s
      message += " Time.now.to_i " + Time.now.to_i.to_s + " " + @tool_provider.request_oauth_timestamp.to_i.to_s

    end

    if false #was_nonce_used_in_last_x_minutes?(@tool_provider.oauth_nonce,60)
      message += "Why are you reusing the nonce?"
    end
    #session["lti_params"] = params
    if params["lis_person_sourcedid"]
      message += "Successfully gathered info"
      message += "Next steps are to auto create users based on canvas info on load"
      if params["custom_canvas_user_id"]
        @individual = Individual.find_by_canvas_id params["custom_canvas_user_id"]
        message += " found by canvas key "  
        unless @individual
          @individual = Individual.find_by_email params["lis_person_contact_email_primary"]
          @individual.canvas_id = params["custom_canvas_user_id"]
          @individual.save
          message += " found by email and added canvas_id "
        end
      end
      unless @individual
        Individual.create(:firstname => params["lis_person_name_given"],
                          :lastname => params["lis_person_name_family"],
                          :canvas_id => params["custom_canvas_user_id"],
                          :sisid => params["lis_person_sourcedid"],
                          :email => params["lis_person_contact_email_primary"])  #also type, gradyear
        message += " Created a new individual " 
      else
        message += " found individual " + @individual.firstname
      end
    end
    session["current_user_id"] = @individual.id
    if @individual
      redirect_to :controller => "dashboard", :action => "index"
    else
      render :text => message + "<br />" + @tool_provider.inspect  + "<br />" +  params.inspect
    end
  end

  def cookie
  end

  def dashboard
  end

  def was_nonce_used_in_last_x_minutes?(nonce,minutes = 60)
    false #needs to cache access and keep people from reusing nonces - look up
  end

  def tool_config
    host = request.scheme + "://" + request.host_with_port
    url = host + "/connect"
    tc = IMS::LTI::ToolConfig.new(:title => "Avatari by Eastside Preparatory School Kirkland, WA", :launch_url => url)
    tc.description = "Avatari is a gamification add on for your school. Distribute runes to students and let them build an avatar."
    tc.set_ext_params("canvas.instructure.com", 
                         {"privacy_level" => "public", 
                          "tool_id" => "avatari",
                          "user_navigation" => {
                             "url" => "http://four11.eastsideprep.org:3000/lti/connect", "text" => "Avatari"}
                              
                         })
    response.headers['Content-Type'] = 'text/xml'
    render :text => tc.to_xml(:indent => 2)
  end



#  private
  def show_error(message)
    @message = message
  end

end
