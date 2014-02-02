# HCast [![Build Status](https://travis-ci.org/AlbertGazizov/hcast.png)](https://travis-ci.org/AlbertGazizov/hcast) [![Code Climate](https://codeclimate.com/github/AlbertGazizov/hcast.png)](https://codeclimate.com/github/AlbertGazizov/hcast)



HCast is a library for casting and validing hash attributes

## Usage


Create caster and declare hash attributes:
```ruby
class ContactCaster
  include HCast::Caster

  rules do
    hash :contact do
      string   :name
      integer  :age, optional: true
      float    :weight
      date     :birthday
      datetime :last_logged_in
      time     :last_visited_at
      hash :company do
        string :name
      end
      array :emails, each: :string
      array :social_accounts, each: :hash do
        string :name
        symbol :type
      end
    end
  end
end
```

Instanticate caster and give you hash for casting:
```ruby
ContactCaster.new.cast({
  contact: {
    name: "John Smith",
    age: 22,
    weight: 65.5,
    birthday: Date.today,
    last_logged_in: DateTime.now,
    last_visited_at: Time.now,
    company: {
      name: "MyCo",
    },
    emails: ["test@example.com", "test2@example.com"],
    social_accounts: [
      {
        name: "john_smith",
        type: :twitter,
      },
      {
        name: "John",
        type: :facebook,
      },
    ]
  }
})

```

## Installation

Add this line to your application's Gemfile:

    gem 'hcast'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hcast

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
