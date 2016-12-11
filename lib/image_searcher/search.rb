module ImageSearcher
  def self.search(options = {})
    raise "Missing params" if options[:query].nil?
    raise "Missing query" if options[:query].empty?

    base_uri = ImageSearcher::API::BASE_URI
    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]

    ImageSearcher::API.get_json(url)
  end
end