#!env ruby
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

require 'builder'
require 'rmagick'
require 'active_support/all'
require 'traxanos_hd'

# load partial
Dir.glob("./partials/*.rb").each do |file|
  require file
end

dark = true

# 6c0aab
colors = {}
TraxanosHD.colors[:subtitle]          = "\#00dcdcdc"
TraxanosHD.colors[:transparent]       = "\#ff000000"
TraxanosHD.colors[:transpBlack]       = "\#80000000"
TraxanosHD.colors[:transpWhite]       = "\#77ffffff"
TraxanosHD.colors[:white]             = "\#00ffffff"
TraxanosHD.colors[:black]             = "\#00000000"
TraxanosHD.colors[:green]             = "\#00389416"
TraxanosHD.colors[:yellow]            = "\#00e5b243"
TraxanosHD.colors[:red]               = "\#00f23d21"
TraxanosHD.colors[:blue]              = "\#000064c7"
TraxanosHD.colors[:orange]            = "\#00f47d19"
if dark
  TraxanosHD.colors[:background]        = "\#10101010"
  TraxanosHD.colors[:foreground]        = "\#00bbbbbb"
  TraxanosHD.colors[:shadow]            = "\#10202020"
else
  TraxanosHD.colors[:background]        = "\#10bbbbbb"
  TraxanosHD.colors[:foreground]        = "\#00000000"
  TraxanosHD.colors[:shadow]            = "\#10A0A0A0"
end
TraxanosHD.colors[:foregroundAccent]    = "\#00bbbbbb"
TraxanosHD.colors[:backgroundAccent]    = "\#106c0aab"

# TraxanosHD.colors[:foregroundAccent]    = "\#00303030"
# TraxanosHD.colors[:backgroundAccent]    = "\#10747474"

TraxanosHD.colors[:graphepgBGNormal]    = "\#10888888"
TraxanosHD.colors[:graphepgFGNormal]    = "\#00222222"
TraxanosHD.colors[:graphepgBGNow]       = "\#10bbbbbb"
TraxanosHD.colors[:graphepgFGNow]       = "\#00222222"
TraxanosHD.colors[:foregroundAccent2]   = "\#10bbbbbb"
TraxanosHD.colors[:backgroundAccent2]   = "\#006c0aab"
if dark
  TraxanosHD.colors[:channelSelection2]       = TraxanosHD.colors[:white]
  TraxanosHD.colors[:channelSelection2Select] = TraxanosHD.colors[:white]
else
  TraxanosHD.colors[:channelSelection2]       = TraxanosHD.colors[:foreground]
  TraxanosHD.colors[:channelSelection2Select] = TraxanosHD.colors[:background]
end


TraxanosHD.fonts[:LCD]         = { scale: 100, filename: 'lcd.ttf' }
TraxanosHD.fonts[:Console]     = { scale: 100, filename: 'nmsbd.ttf' }
TraxanosHD.fonts[:Bold]        = { scale: 100, filename: 'TraxanosHD/fonts/OpenSans-Bold.ttf' }
TraxanosHD.fonts[:Regular]     = { scale: 100, filename: 'TraxanosHD/fonts/OpenSans-Regular.ttf' }
TraxanosHD.fonts[:Light]       = { scale:  80, filename: 'TraxanosHD/fonts/OpenSans-Light.ttf' }
TraxanosHD.fonts[:Italic]      = { scale:  80, filename: 'TraxanosHD/fonts/OpenSans-Italic.ttf' }
TraxanosHD.fonts[:SegoeUI]     = { scale: 100, filename: 'TraxanosHD/fonts/SegoeUI.ttf' }
TraxanosHD.fonts[:Meteocons]   = { scale: 100, filename: 'TraxanosHD/fonts/Meteocons.ttf' }
TraxanosHD.fonts[:FontAwesome] = { scale: 100, filename: 'TraxanosHD/fonts/FontAwesome.ttf' }


# Generate images
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "images/input_error.png", height: 66, width: 66, size: 50, background: :background, x: 12, y: 8, antialias: true
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "images/input_info.png", height: 66, width: 66, size: 50, background: :background, x: 12, y: 8, antialias: true
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "images/input_question.png", height: 66, width: 66, size: 50, background: :background, x: 12, y: 8, antialias: true
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "extensions/directory.png", height: 20, width: 20, size: 18, background: :background, x: 1, y: 4
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "extensions/movie.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 2
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "extensions/music.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 1
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "extensions/picture.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 3
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/movie_link.png", height: 20, width: 20, size: 18, background: :background, x: 1, y: 4
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/movie_folder.png", height: 20, width: 20, size: 18, background: :background, x: 1, y: 4
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/folder.png", height: 20, width: 20, size: 18, background: :background, x: 1, y: 4
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/marker.png", height: 20, width: 20, size: 18, background: :background, x: 4, y: 3
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/music.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 1
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/movie_new.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 2
TraxanosHD::Images::Icon.new code: '', foreground: :orange, filename: "skin_default/icons/movie_start.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 2
TraxanosHD::Images::Icon.new code: '', foreground: :foreground, filename: "skin_default/icons/movie_select.png", height: 20, width: 20, size: 18, background: :background, x: 1, y: 2
TraxanosHD::Images::Icon.new code: '', foreground: :green, filename: "skin_default/icons/movie_seen.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 2
TraxanosHD::Images::Icon.new code: '', foreground: :red, filename: "skin_default/icons/movie_rec.png", height: 20, width: 20, size: 18, background: :background, x: 0, y: 2
TraxanosHD::Images::Scrollbar.new
TraxanosHD::Images::Progressbar.new(name: :accent, color: :backgroundAccent)
TraxanosHD::Images::Progressbar.new(name: :foreground, color: :foreground)

# Gernerate screens
xml = Builder::XmlMarkup.new indent: 2
xml.instruct! :xml, encoding: "ASCII"
xml.comment! "TraxanosHD by traxanos | optimized for VTI"
xml.comment! "inspired by MetrixHD (by iMaxxx) and AtileHD"
xml.comment! "recommended to use with XPicons in picon folder"

xml.skin do

  xml.output(id: 0) do
    xml.resolution bpp: 32, xres: 1280, yres: 720
  end

  xml.colors do
    TraxanosHD.colors.each do |name, value|
      xml.color value: value, name: name
    end
  end

  xml.fonts do
    TraxanosHD.fonts.each do |name, options|
      xml.font name: name, filename: options[:filename], scale: options[:scale]
    end
  end

  xml.subtitles do
    xml.sub name: "Subtitle_TTX",     font: "Regular;30", foregroundColor: :subtitle, shadowColor: :shadow, shadowOffset: "3,3"
    xml.sub name: "Subtitle_Regular", font: "Regular;30", foregroundColor: :subtitle, shadowColor: :shadow, shadowOffset: "3,3"
    xml.sub name: "Subtitle_Bold",    font: "Bold;30",    foregroundColor: :subtitle, shadowColor: :shadow, shadowOffset: "3,3"
    xml.sub name: "Subtitle_Italic",  font: "Italic;30",  foregroundColor: :subtitle, shadowColor: :shadow, shadowOffset: "3,3"
  end

  xml.windowstyle(id: 0, type: :skinned) do
    xml.color name: :Background, color: :background
    xml.color name: :LabelForeground, color: :foreground
    xml.color name: :ListboxBackground, color: :background
    xml.color name: :ListboxForeground, color: :foreground
    xml.color name: :ListboxSelectedBackground, color: :backgroundAccent2
    xml.color name: :ListboxSelectedForeground, color: :foregroundAccent2
    xml.color name: :ListboxMarkedBackground, color: :backgroundAccent2
    xml.color name: :ListboxMarkedForeground, color: :foregroundAccent2
    xml.color name: :ListboxMarkedAndSelectedBackground, color: :backgroundAccent2
    xml.color name: :ListboxMarkedAndSelectedForeground, color: :foregroundAccent2
    xml.color name: :WindowTitleForeground, color: :foreground
  end

  xml.windowstyle(id: 1, type: :skinned) do
    xml.color name: :Background, color: :background
    xml.color name: :LabelForeground, color: :foreground
    xml.color name: :ListboxBackground, color: :background
    xml.color name: :ListboxForeground, color: :foreground
    xml.color name: :ListboxSelectedBackground, color: :backgroundAccent2
    xml.color name: :ListboxSelectedForeground, color: :foregroundAccent2
    xml.color name: :ListboxMarkedBackground, color: :backgroundAccent2
    xml.color name: :ListboxMarkedForeground, color: :foregroundAccent2
    xml.color name: :ListboxMarkedAndSelectedBackground, color: :backgroundAccent2
    xml.color name: :ListboxMarkedAndSelectedForeground, color: :foregroundAccent2
    xml.color name: :WindowTitleForeground, color: :foreground
  end

  xml.windowstylescrollbar do
    xml.value name: "ScrollbarWidth", value: "5"
    xml.value name: "ScrollbarBorderWidth", value: "0"
    #xml.pixmap name: "BackgroundPixmap", filename: "TraxanosHD/scrollbar_bg.png"
    #xml.pixmap name: "ValuePixmap", filename: "TraxanosHD/scrollbar.png"
  end

  # load screens
  # eval File.read("./screens/Mute.rb")
  Dir.glob("./screens/*.rb").each do |file|
    puts "render screen #{file}"
    instance_eval File.read(file), file
  end

  # specials
  xml.screen position: "0,0", size: "#{TraxanosHD.width},#{TraxanosHD.height}", backgroundColor: :transparent, flags: :wfNoBorder, name: "SubtitleDisplay", zPosition: -10
  xml.screen position: "0,0", size: "0,0", backgroundColor: :transparent, flags: :wfNoBorder, name: "Standby", title: "Standby", zPosition: -90
  xml.screen position: "0,0", size: "0,0", backgroundColor: :transparent, flags: :wfNoBorder, name: "Scart", title: "Scart", zPosition: -90

end

File.open("skin.xml", "w") do |file|
  skin = xml.target!
  file << skin
  #puts skin
end





