# Yage

A ruby gem to calculate age by some format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yage'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yage

## Usage

Default

```sh
$ yage '2018/01/01' '2018/01/02'
0 year

$ yage '2018/01/01' '2019/01/01'
1 year

$ yage '2018/01/01' '2020/01/01'
2 years
```

semver format

```sh
$ yage --semver '2018/01/01' '2018/01/02'
v0.0.1

$ yage --semver '2018/01/01' '2019/01/01'
v1.0.1

$ yage --semver '2018/01/01' '2020/02/03'
v2.1.2
```

year and yday (day of year) format

```sh
$ yage --age_yday '2018/01/01' '2018/01/02'
v0.1

$ yage --age_yday '2018/01/01' '2019/01/01'
v1.0

$ yage --age_yday '2018/01/01' '2019/02/03'
v1.33
```

custom format (support %year, %month, %mday and %yday)

```sh
$ yage --format "%year years %month month %mday days" '2018/01/01' '2023/04/15'
5 years 3 month 14 days
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yasuhiroki/yage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yage project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yasuhiroki/yage/blob/master/CODE_OF_CONDUCT.md).
