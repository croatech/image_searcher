module ImageSearcher::Filter

  def filter_by_format(result, format)
    result.keep_if { |h| h["url"].match(/.#{format}/i) }
  end
end