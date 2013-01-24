require 'sinatra'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def imglink(name)
    fullurl = "/images/#{name}.jpg"
    thumburl = "/images/#{name}.jpg.thumb"
    %%<a href="#{fullurl}" class="fancybox" rel="fancygroup"><img src="#{thumburl}" height="150" width="150"></a>%
  end

  def swflink(name, filename)
    swfurl = "/flash/#{filename}.swf"
    thumburl = "/images/flash/#{filename}.swf.thumb"
    %%<a href="#{swfurl}" class="various fancybox.iframe" rel="fancygroup"><img src="#{thumburl}" height="150" width="150"></a>%
  end

  def vidlink(name, thumb, videoid)
    youtubeurl = "http://www.youtube-nocookie.com/embed/#{videoid}?autoplay=1&rel=0"
    thumburl = "http://img.youtube.com/vi/#{videoid}/3.jpg"
    %%<a href="#{youtubeurl}" class="various fancybox.iframe" rel="fancygroup"><img src="#{thumburl}" height="150" width="150"></a>%
  end
end

Pages = [
  { url:  "/",                   view: :homepage },
  { name: "Ads",                 view: :ads },
  { name: "Animation",           view: :animation },
  { name: "Brochures/Covers",    view: :brochures },
  { name: "CD Label Art",        view: :cdlabels },
  { name: "CGI Models",          view: :cgimodels },
  { name: "Flyers/Posters",      view: :flyers },
  { name: "Logos",               view: :logos },
  { name: "Photo FX",            view: :photofx },
  { name: "Product Branding",    view: :brandingphotofx },
  { name: "Shirt Art",           view: :shirtart },
  { name: "Web Design",          view: :webdesign }
]

Pages.each do |page|
  page[:url] ||= "/#{page[:view].to_s.sub(/^_/,'')}"
  get(page[:url]) { 
    @page_title = page[:name]
    @pages = Pages
    erb page[:view]
  }
end
