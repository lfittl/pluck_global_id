# pluck_global_id

Helper method to easily get GlobalIDs from an ActiveRecord scope without instantiating AR objects.

Useful for mass-creating ActiveJob jobs from a specific subset of your records.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pluck_global_id'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pluck_global_id

## Usage

Use ```pluck_global_id``` when you want to instantiate ActiveJob from a scope:

```ruby
user_gids = User.where(active: true).pluck_global_id
user_gids.each do |user_gid|
  UserWorker.perform_later(user_gid)
end
```

This avoids costly AR objects which often consume 2x memory (or more) in such cases, even when using ```select(:id)```.

## Contributing

1. Fork it ( https://github.com/lfittl/pluck_global_id/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
