module ImageSearcher

  require_relative 'filter'
  extend Filter

  def self.search(options = {})
    raise_errors(options)
    url = build_json_url(options)
    result = ImageSearcher::API.get_json(url)
    result = filter_by_format(result, options) if options[:format]
    result
  end

  private

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

  def self.filter_by_format(result, format)
    if format.is_a?(Array)
      format.each do |f|
        filtered_json = result.keep_if { |h| h['url'].match(/.#{f}/i) }
      end
    else
      filtered_json = result.keep_if { |h| h["url"].match(/.#{format}/i) }
    end

    filtered_json
  end
end