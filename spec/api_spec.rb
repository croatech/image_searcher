require 'spec_helper'

describe "API specs" do
  let!(:result) { ImageSearcher.search(query: 'New York') }

  it 'checks that result is Array' do
    expect(result).to be_a(Array)
  end

  it 'checks that hash inside an array is not empty' do
    expect(result).not_to be_empty
  end
end