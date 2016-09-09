module ImageSearcher
  def self.search(options = {})
    base_uri = ImageSearcher::API::BASE_URI

    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]
    #url += "&page=#{options[:page]}" if options[:page]
    #url += "&sort=#{options[:sort]}" if options[:sort]
    #url += "&begin_date=#{options[:begin_date]}" if options[:begin_date]
    #url += "&end_date=#{options[:end_date]}" if options[:end_date]

    ImageSearcher::API.get_json(url)
  end
end