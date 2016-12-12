module ImageSearcher
  class Client
    attr_reader :options, :result

    def search(opts = {})
      @options = opts 
      raise_errors
      @result = ImageSearcher::API.get_json(build_json_url)
      filter_by_format if options[:format]
      result
    end


    private

    def raise_errors
      raise "Missing params" if options[:query].nil?
      raise "Missing query" if options[:query].empty?
    end

    def build_json_url
      base_uri = ImageSearcher::API::BASE_URI
      url = "#{base_uri}?q=#{options[:query]}"
      url += "&count=#{options[:count]}" if options[:count]
      url
    end

    def filter_by_format
      format = options[:format]
      if format.is_a?(Array)
        format.each do |f|
          @result = result.keep_if { |h| h['url'].match(/.#{f}/i) }
        end
      else
        @result = result.keep_if { |h| h["url"].match(/.#{format}/i) }
      end

      @result
    end
  end
end