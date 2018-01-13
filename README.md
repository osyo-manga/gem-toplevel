# Toplevel

Define toplevel method local.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toplevel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toplevel

## Usage

```ruby
# A.rb
require "toplevel"

# private method Object#hoge.
def toplevel_method
	:toplevel_method
end

using Toplevel.local {
	# A.rb only method
	def local_method
		:local_method
	end
}

p toplevel_method  # => :toplevel_method
p local_method     # => :local_method
```

```ruby
# B.rb
require_relative "./B.rb"

p toplevel_method  # => :toplevel_method

# Error: undefined local variable or method `local_method' for main:Object (NameError)
p local_method
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osyo-manga/gem-toplevel.
