module ImageSearcher

  require_relative 'filter'
  extend Filter

  def self.search(options = {})
    raise_errors(options)
    url = build_json_url(options)
    result = ImageSearcher::API.get_json(url)
    perform_filter_params(result, options)
    result
  end

  def self.raise_errors(options)
    raise "Missing params" if options[:query].nil?
    raise "Missing query" if options[:query].empty?
  end

  def self.build_json_url(options)
    base_uri = ImageSearcher::API::BASE_URI
    url = "#{base_uri}?q=#{options[:query]}"
    url += "&count=#{options[:count]}" if options[:count]
    url
  end

  def self.perform_filter_params(result, options)
    if options[:format]
      result = filter_by_format(result, options[:format])
    end

    if options[:formats]
      result = filter_by_formats(result, options[:formats])
    end
  end
end