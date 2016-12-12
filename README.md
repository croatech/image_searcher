# Image Searcher

A ruby wrapper for the [Ababeen](http://api.ababeen.com) Image Search API v1.0 - the modest alternative to deprecated Google Image Search API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_searcher', '~> 0.1.4'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_searcher

## Usage

```
images = ImageSearcher.search(query: "New York")
```

And you've got an array of objects. By default the result has `100` nested arrays. 

**Available options**:
```
query(String)
count(Integer) - maximum 100(10 by default)
format(String) - if you need a certain format of images(jpg, png, etc.)
formats(Array) - array of allow formats
```
Examples:

`ImageSearcher.search(query: 'New York', count: 66)`
`ImageSearcher.search(query: 'New York', format: 'jpg')`
`ImageSearcher.search(query: 'New York', formats: ['jpg', 'png'])`

Also you can see a nice preview of a result: 
http://api.ababeen.com/api/images.php?q=New%York&preview=true&count=100

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frylock13/images_searcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

