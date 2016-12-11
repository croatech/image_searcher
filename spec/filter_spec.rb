require 'spec_helper'

describe "Filter" do
  let!(:results) { ImageSearcher.search(query: 'New York', format: 'jpg', count: 100) }

  it 'checks that the filter by format can delete some records' do
    expect(results.count).to_not eq(100)
  end

  it 'checks that the filter by format filters correctly' do
    results.each do |result|
      expect(result["url"]).to match(/.jpg/i)
    end
  end

  it 'checks that the filter doesn\'t allow wrong format' do
    results.each do |result|
      expect(result["url"]).to_not match(/.png/i)
    end
  end
end