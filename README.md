# class-callbacks

Class callbacks allow creation of ruby class methods that can capture and execute blocks, considering class ancestors.

## Installation

to install

`gem install class-callbacks`

or in Gemfile

`gem 'class-callbacks'`

and to use

`require 'class-callbacks'`

## How to use

Common usage is to use it to define before and after filters in non-rails environments.

```ruby
require 'class-callbacks'

class ComeClass
  include ClassCallbacks

  define_callback :before
end

class SomeOtherClass < ComeClass
  before do
    @var = [:foo]
  end
end

class EvenOtherClass < SomeOtherClass
  before :add_more, :add_even_more

  def test
    run_callback :before # @var = [:foo, :bar, :baz]
  end

  private

  def add_more
    @var.push :bar
  end

  def add_even_more
    @var.push :baz
  end
end

```


## Dependency

none

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dux/view-cell.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
