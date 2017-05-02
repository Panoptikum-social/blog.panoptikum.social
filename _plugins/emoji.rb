module Jekyll
  module EmojiFilters

    # Returns a big emoji
    #
    #   {{ "1f474" | emoji }} => "audio/mp4a-latm"
    def emoji(character)
      out =       %Q{<span style="width: 3em; height: 3em;">}
      out = out + %Q{  <svg style="padding: 0; margin: 0; width:100%; height:100%;">}
      out = out + %Q{    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#emoji-#{character}"></use>}
      out = out + %Q{  </svg>}
      out = out + %Q{</span>}
    end
  end
end

Liquid::Template.register_filter(Jekyll::EmojiFilters)