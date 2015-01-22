# activerecord-pluck-globalid

Helper method to easily get GlobalIDs from an ActiveRecord scope without instantiating AR objects.

Useful for mass-creating ActiveJob jobs from a specific subset of your records.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-pluck-globalid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-pluck-globalid

## Usage

Use ```pluck_globalid``` when you want to instantiate ActiveJob from a scope:

```ruby
user_gids = User.where(active: true).pluck_globalid
user_gids.each do |user_gid|
  UserWorker.perform_later(user_gid)
end
```

This avoids costly AR objects which can consume significant memory in such cases.

## Contributing

1. Fork it ( https://github.com/lfittl/activerecord-pluck-globalid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
