module ImageSearcher
  module API
    include HTTParty

    BASE_URI = "http://api.ababeen.com/api/images.php"

    def self.get_json(url)
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end
  end
end