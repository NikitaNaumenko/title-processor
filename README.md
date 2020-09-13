# Title processor CLI

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/title/processor`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'title-processor'
```
Or:
```ruby
source "https://rubygems.pkg.github.com/nikitanaumenko" do
  gem "title-processor", "0.1.3"
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install title-processor
Or from github registry:

    $ gem install title-processor --version "0.1.3" --source "https://rubygems.pkg.github.com/nikitanaumenko"

## Usage

From STDIN:

    $  cat links.txt | title-processor

From File:

    $ title-processor ./links.txt
