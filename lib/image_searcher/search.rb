module ImageSearcher
  def self.search(options = {})
    raise "Missing query" unless options[:query]

    base_uri = ImageSearcher::API::BASE_URI
    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]
    url += "&page=#{options[:preview]}" if options[:preview]

    ImageSearcher::API.get_json(url)
  end
end