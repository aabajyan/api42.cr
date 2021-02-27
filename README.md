# api42

42 API wrapper

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     api42:
       github: aabajyan/api42.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "api42"

client = Api42::Client.new(
  YOUR_APP_ID,
  YOUR_SECRET_ID
)

user = client.user("your_username")
puts "Full Name: #{user.first_name} #{user.last_name}"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/aabajyan/api42.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Arsen Abajyan](https://github.com/aabajyan) - creator and maintainer
