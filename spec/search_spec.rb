require 'spec_helper'

describe "Search" do
  let!(:results) { ImageSearcher::Client.new.search(query: 'New York') }

  it 'checks that result is an array' do
    expect(results).to be_a(Array)
  end

  it 'checks that array result is not empty' do
    expect(results).not_to be_empty
  end

  it 'checks that array result has 100 nested arrays by default' do
    expect(results.count).to eq(100)
  end

  it 'checks count option' do
    fifty_results = ImageSearcher::Client.new.search(query: 'Aleah', count: 50)
    expect(fifty_results.count).to eq(50)
  end

  it 'checks a match in the content or title of 10 records' do
    results = ImageSearcher::Client.new.search(query: 'Aleah')
    results.each do |result|
      content = results.first['content']
      title = results.first['title']
      expect(content || title).to match(/Aleah/)
    end
  end

  it 'checks that a match not in the content or title' do
    results = ImageSearcher::Client.new.search(query: 'Aleah')
    content = results.first['content']
    title = results.first['title']
    expect(content || title).not_to match(/sometrashquery/)
  end

  it 'checks for an empty array if the query is empty' do
    expect { ImageSearcher::Client.new.search(query: '') }.to raise_error(RuntimeError, "Missing query")
  end

  it 'checks for an exception if the query is missed' do
    expect { ImageSearcher::Client.new.search() }.to raise_error(RuntimeError, "Missing params")
  end
end