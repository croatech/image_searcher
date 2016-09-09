# Image Searcher

A ruby wrapper for the [Ababeen](http://api.ababeen.com) Image Search API v1.0 - a modest analogue of deprecated Google Image Search API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_searcher', '~> 0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_searcher

## Usage

```
@result = ImageSearcher.search(query: "New York")
```

And you'll have a nested array with results. By default the result has `10` images. 

**Available options**:
```
query(String)
count(Integer) - maximum 100(10 by default)
preview(Boolean) - show all images in preview(false by default)
```
For example: `ImageSearcher.search(query: "New York", count: 66, preview: true)`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frylock13/images_searcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

