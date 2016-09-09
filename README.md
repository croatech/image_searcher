# Image Searcher

A ruby wrapper for the [Ababeen](http://api.ababeen.com) images search API v1.0 - analogue of deprecated Google Images Search API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'images_searcher', git: 'https://github.com/Frylock13/images_searcher.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_searcher

## Usage

```
@result = ImageSearcher.search(query: "New York")
```

And you'll have a nested array with results. By default the array has `10` values. 

**Available options**:
```
query(String)
count(Integer)
preview(Boolean)

For example: `http://api.ababeen.com/api/images.php?q=America&preview=true&count=100`
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frylock13/images_searcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

