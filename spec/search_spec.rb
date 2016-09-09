require 'spec_helper'

describe "Search" do
  let!(:result) { ImageSearcher.search(query: 'New York') }

  it 'checks that result is Array' do
    expect(result).to be_a(Array)
  end

  it 'checks that array result is not empty' do
    expect(result).not_to be_empty
  end

  it 'checks that array result has 10 nested arrays by default' do
    expect(result.count).to eq(10)
  end

  it 'checks count option' do
    fifty_results = ImageSearcher.search(query: 'Alyssa', count: 50)
    expect(fifty_results.count).to eq(50)
  end

  it 'checks for an empty array if the query is empty' do
    result_with_empty_query = ImageSearcher.search(query: '')
    expect(result_with_empty_query).to be_empty
  end

  it 'checks for an exception if the query is missed' do
     expect { ImageSearcher.search() }.to raise_error(RuntimeError, "Missing query")
  end
end