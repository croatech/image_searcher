module ImageSearcher

  require_relative 'filter'
  extend Filter

  def self.search(options = {})
    raise "Missing params" if options[:query].nil?
    raise "Missing query" if options[:query].empty?

    base_uri = ImageSearcher::API::BASE_URI
    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]

    result = ImageSearcher::API.get_json(url)

    if options[:format]
      result = filter_by_format(result, options[:format])
    end

    result
  end
end