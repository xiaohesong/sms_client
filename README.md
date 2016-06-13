# SmsClient

发送短信客户端

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms_client', git: 'git@github.com:xiaohesong/sms_client.git', tag: 'v0.0.5'
```

And then execute:

    $ bundle

## Usage

1. install config files and edit them

```ruby
rails g sms_client:install
```

2. send message like this

```ruby
SmsClient.publish(mobile, message)
```
mobile can be a array of phones.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sms_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
