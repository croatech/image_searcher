require 'spec_helper'

describe "API specs" do
  let!(:response) { ImageSearcher.search(query: 'Banana') }

  it 'checks correct status of response' do
    expect(:response).to eq(22)
  end
end