module ImageSearcher::Filter

  def filter_by_format(result, format)
    result.keep_if { |h| h["url"].match(/.#{format}/i) }
  end

  def filter_by_formats(result, formats)
    formats.each do |f|
      result = result.keep_if { |h| h['url'].match(/.#{f}/i) }
    end

    result
  end
end