module ImageSearcher
  def self.search(options = {})
    raise "Missing query" unless options[:query]

    base_uri = ImageSearcher::API::BASE_URI
    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]

    ImageSearcher::API.get_json(url)
  end
end