# Storks

We have seed data that is the minimum data required before our app can be used.

We have seed data that is for running end-to-end tests.

We have seed data that is for a specific customer.

We have seed data that is for demos.

**This gem helps apply these different types of seed data in a common way**.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'storks', github: 'workplacesystems/storks'
```

And then execute:

    $ bundle

## Usage

Create dir to place the different flavours of seeds in

    $ mkdir ./db/seed_flavours

Write some ruby code to generate the seeds.

    $ vi ./db/seed_flavours/special.rb

Apply the the seed data.

    $ rake db:seed:with[special]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/storks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
