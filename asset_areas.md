Current Concept on Building the Avatar.
Avatars are SVG objects. They are constructed by combining snippets of code into an svg.
Typically this is done by building a full avatar model in inkscape or illustrator and then breaking down the svg code.

Within the SVG code, we use classes to define areas to be colored via fills.

We then use d3 to manipulate the svg sections.

For example in a database we might have the snippet of svg defining a shirt (top path is the shadow, second path is the shirt):
<path d="m 52.011084,82.831074 c -0.06886,-0.17978 -1.416727,-5.833066 -1.569882,-6.670202 -0.152969,-0.836123 -0.619052,-3.139022 -0.935015,-3.825285 -0.225957,-0.490773 0.848864,-1.226641 1.10038,-1.176463 0.23,-1.56875 2.423749,-2.26125 3.966249,-2.94375 7.486186,2.561409 6.180548,5.942806 12.41,-1.6625 -0.06625,0.185 0.4975,0.3125 0.12875,0.38375 1.1975,0.29875 1.95375,1.525 2.81375,2.175 7.839182,4.111212 4.091185,5.961668 2.175,7.54875 -0.11375,0.09875 -0.2875,0.13875 -0.51125,0.1275 -0.4225,1.305 0.26375,2.91875 0.255,4.2225 -0.32625,-0.0675 -0.49625,-0.2175 -0.51125,0.255 0.12375,-0.0025 0.1,-0.15625 0.1275,-0.255 0.1775,0.49375 0.58375,-0.135 0.64,0.38375 0.02625,0.49 -0.1025,0.04625 -0.38375,0.12875 -0.28125,0.6925 0.3125,1.0625 -0.25625,1.53375 0.34875,0.49125 0.14875,0.1575 -0.1275,0.5125 0.49375,0.1175 -0.08625,0.9925 0.25625,1.4075 -0.085,0.38375 -0.27375,-0.12125 -0.5125,0 0.0575,0.35875 0.27125,0.1525 0.64,0.38375 -0.52875,0.83875 0.01125,0.6825 -0.1275,1.66375 -0.8025,0 0.2025,0.415 -0.38375,0.38375 -0.0075,0.22 0.09625,0.33125 0.255,0.38375 0.1925,-0.11 -0.03375,-0.1925 0.12875,-0.51125 0.38,0.36125 -0.0325,1.8875 -0.38375,1.15125 -0.03875,0.3375 0.1775,0.41875 0.51125,0.38375 -0.05625,1.0975 0.0575,1.7125 0.5125,2.68625 0.3625,-0.135 0.5325,-0.135 0.895,0 0.02875,0.86375 -0.55375,0.3625 -0.64,1.15125 l -0.64,0 c 0.605,0.31375 -0.23,0.93875 -0.895,1.1525 0.11375,-0.225 0.56875,-0.21 0.25625,-0.5125 -0.62125,0.78875 -1.13125,0.83875 -2.43125,1.02375 -5.061242,0.220328 -1.570016,0.02866 -7.217536,0.466753 -0.01106,-0.1535 -4.693479,-0.389781 -8.199913,0.291185 -1.095148,-0.928533 -2.857792,1.683014 -4.060261,0.166093"
  id="path3025"
  style="fill:#231f20;fill-opacity:1;fill-rule:nonzero;stroke:none" />
<path
  d="m 52.397567,82.545624 c -1.01,-0.5075 -2.265,-1.36875 -3.5825,-1.15125 -2.246249,-1.51 -0.927499,-5.29125 1.79125,-4.99 0.501251,0.82125 0.220001,2.42375 1.15125,2.81375 1.161249,-0.4575 2.146249,-1.09375 2.814999,-2.04625 0.50125,0.3875 -0.6825,0.83875 -0.25625,1.15125 -0.8775,1.09125 -1.39,2.7475 -1.918749,4.2225"
  id="path3117"
  style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
  d="m 73.764191,72.438249 c -0.84625,1.145 -0.665,2.97125 -2.815,2.81375 0.16375,0.30625 0.245,0.69375 0.64,0.76875 -0.2875,0.61125 -0.4525,0.45375 -0.5125,0.89625 -0.96625,-1.87 -1.24,-5.05875 -4.22125,-5.7575 3.365,2.32375 4.005,6.90375 4.22125,10.74625 -0.7425,1.01 0.07875,4.29375 -0.1275,5.375 0.0325,-0.175 -0.40875,0.7025 0.1275,0.76625 -0.52125,1.19125 0.05375,2.9225 0.64,3.96625 -3.51125,3.14875 -10.63375,1.45 -15.60875,1.92 -1.2225,0.1175 -2.6475,0.5475 -3.454998,0.51125 0.362498,0.01875 -0.700001,-0.295 -1.02375,-0.51125 0.1,0.07125 -0.553751,0.6 0,0.64 -0.3125,0.36875 -0.935001,0.42875 -1.535001,0.51125 -0.0275,-0.4025 0.085,-0.93875 0.38375,-0.64 -0.44,-1.05875 0.601251,-3.35875 0.383751,-4.60625 0.0575,-0.185 0.114999,0.015 0.256249,0 0.29125,-3.34 1.847499,-6.39375 2.814999,-9.97875 0.7675,-0.175 0.8525,-2.0125 1.91875,-2.30375 -0.10375,-0.28 -0.25625,-0.51125 -0.64,-0.51125 1.13375,-1.12625 2.42375,-2.0975 3.71,-3.07125 -2.605,0.04625 -4.2,2.64125 -6.0125,3.19875 -0.206249,0.02125 0.20875,0.6075 -0.383749,0.5125 0.3275,-0.5375 -0.5725,0.02375 -0.64,0.255 -0.42625,-0.2975 -0.42625,-1.0225 -0.7675,-1.4075 0.9275,-0.68875 -0.845,-1.94 -0.25625,-3.07 -0.30875,-0.28875 -0.5475,-0.6475 -0.7675,-1.02375 0.113751,-0.49125 1.04125,-0.8325 0.7675,-1.27875 1.29,-0.595 2.577499,-1.905 4.349999,-2.17625 -0.05625,-0.1125 -0.11375,-0.2275 -0.255,-0.255 0.76375,-0.23125 1.8475,0.39 2.68625,0.38375 -0.50875,0.0025 1.42625,0.06375 0.895,0.51125 0.5475,-0.11 0.0825,-0.48625 0.64125,-0.64 0.16625,0.4375 2.55125,0.13125 2.5575,0.89625 1.71375,-0.84625 3.15625,-1.9625 4.735,-2.9425 1.7725,2.1075 4.28625,4.1575 6.78,5.1175 0.1575,0.07125 -0.095,0.49375 0.5125,0.38375"
  id="shirt"
  class="maincolor"
  style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" />

This image asset would have a one-to-many relationship with an area such as shirt

in the svg it would be put in a group programatically
<g id="g_shirt">
  ...svg code from above...
</g>

Then we can remove entire groups via d3.selectAll("#g_shirt").remove() or d3.selectAll("#g_shirt").transition().duration(2000).style("display","none") first.
in general we would be removing the paths below the group not the group itself.
We can color the shirt via d3.selectAll("#g_shirt path.maincolor").transition().duration(2000).style("fill","#FF0000")

which would turn the shirt red. using classes would allow for things like striped shirts, etc.

color classes might be maincolor highlight secondarycolor etc.

Asset Areas
 - Headress
   - baseball cap
   - fedora
   - cowboy hat
   - motorcycle helmut
   - tiara
   - mullet
   - tricorner
 - Suit
   - tshirt and jeans
   - tracksuit
   - chainmail
   - tux with tails
   - business power skirt-suit
   - cafe racer motorcycle suit
   - anime battle suit
   - princess peach dress
   - racoon suit from mario
 - Shoes
   - converse
   - motorcycle boots
   - cowboy boots
   - sandles, leather roman style
   - moon boots
   - heels
   - dress shoes
 - Hand-items
   - orb of destiny
   - wand
   - the book of wisdom/spells
   - ring
   - corsage
   - kitchen sink
   - saxaphone
 - Pet (pet threshold upon outline approval)
   - Types of Pet
     - canary
	   - eagle
     - cat
	   - tiger
	 - dog
	   - wolf
	 - snake
	   - anaconda
	 - ferret
	   - dragon
	 - kangaroo
       - boxing kangaroo
	   
 375 points
  - 5 to 100 points each
  