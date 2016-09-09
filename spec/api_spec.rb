require 'spec_helper'

describe "API specs" do
  let!(:result) { ImageSearcher.search(query: 'New York') }

  it 'checks that result is Array' do
    expect(result).to be_a(Array)
  end

  it 'checks that hash inside an array is not empty' do
    expect(result).not_to be_empty
  end

  it 'checks count option' do
    fifty_results = ImageSearcher.search(query: 'Alyssa', count: 50)
    expect(fifty_results.count).to eq(50)
  end
end