module ApplicationHelper
  def avatari_svg(opts = {}, &block)
   css_class = opts[:class] || ""
   css_id = opts[:id] || "svg" + rand(1000).to_s
   concat(raw('<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="150"
   height="150"
   id="' + css_id + '"
   class="' + css_class + '"
   xml:space="preserve"><metadata
     id="metadata2991"><rdf:RDF><cc:Work
         rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
     id="defs2989"><clipPath
       id="clipPath2999"><path
         d="M 0,792 612,792 612,0 0,0 0,792 z"
         id="path3001" /></clipPath></defs>' + capture(&block) + '</svg>'))
  end
  
  def nav_links
    begin
      id = @current_user.id
      link_string = link_to("Wardrobe", :controller => "individuals", :action => "show", :id => (@current_user ? @current_user.id : ""))
    rescue
      link_string = "-"
    end

    content_tag(:ul) do 
      content_tag(:li,
        link_to("Home", :controller => "dashboard", :action => "index")) + 
      content_tag(:li,
        link_to("Shop", :controller => "shop", :action => "index")) + 
      content_tag(:li,link_string)
    end
  end
end
