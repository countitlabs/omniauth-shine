# OmniAuth Shine

This gem contains an oauth2 Shine strategy for OmniAuth to allow access to the Misfit Cloud API

For documentation on accessing devices made by Misfit Wearables go to the
[CloudAPI docs](https://build.misfit.com/docs/cloudapi/get_started).

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

Many people put these values into environment variables to keep them out of source control. If you do that, your `config/initializers/omniauth.rb` will look like:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shine, ENV["MISFIT_CONSUMER_KEY"], ENV["MISFIT_CONSUMER_SECRET"] end
```

and you'll put the values for MISFIT_CONSUMER_KEY & MISFIT_CONSUMER_SECRET in a `.env` file

Now just follow the README at: https://github.com/intridea/omniauth


## User ID

In order to get the User ID, this strategy makes an extra call to `/move/resource/v1/user/me/profile`. That also picks up name, email, avatar, birthday, and gender, so those are put into `auth_hash.info` also.

## Note on Patches/Pull Requests

- Fork the project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so I don’t break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send me a pull request. Bonus points for topic branches.


## License

MIT

## Credits
bsoule (https://github.com/bsoule)
hungtd9 (https://github.com/hungtd9)
