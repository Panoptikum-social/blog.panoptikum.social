module Jekyll
  module EmojiFilters

    # Returns a big emoji
    #
    #   {{ "1f474" | emoji }} => "audio/mp4a-latm"
    def emoji(character)
      out =       %Q{  <svg style="display: inline; padding: 0; margin: 0; width:100%; height:2em;">}
      out = out + %Q{    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#emoji-#{character}"></use>}
      out = out + %Q{  </svg>}
    end
  end
end

Liquid::Template.register_filter(Jekyll::EmojiFilters)