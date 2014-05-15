# OmniAuth Shine 

This gem contains an oauth2 Shine strategy for OmniAuth.

As of May 2014, the Misfit API is available by request. Contact Misfit for information.  

http://misfitwearables.com 


## How To Use It

Usage is as per any other OmniAuth 1.0 strategy. So let's say you're using Rails, you need to add the strategy to your `Gemfile` along side omniauth:

```ruby
gem 'omniauth'
gem 'omniauth-shine'
```

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shine, "consumer_key", "consumer_secret"
end
```

You will obviously have to put in your key and secret, which you get when you register your app with Misfit.

Now just follow the README at: https://github.com/intridea/omniauth


## User ID

Some omniauth strategies are able to grab the user ID during the
authenticatino process. This one does not. If you want the user ID then
you will need to make a call to for the profile once you get a valid
token.


## Note on Patches/Pull Requests

- Fork the project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so I don’t break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send me a pull request. Bonus points for topic branches.


## License

MIT

