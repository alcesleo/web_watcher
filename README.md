# Web Watcher

A simple web app that lets you set an element on a website to watch, and
receive an email when the contents of that element changes.

## Development

```sh
# Install Postgres
brew cask install postgres

# Install Gem dependencies
gem install bundler
bundle

# Create and migrate the database
bundle exec hanami db prepare

# Run checks
bundle exec rake

# Start the development server
bundle exec hanami server
```

### Tests

```sh
# Create and migrate the test database
HANAMI_ENV=test bundle exec hanami db prepare

# Run the tests
bundle exec rake test
```

### Style

RuboCop is being run as part of the default task:

```sh
bundle exec rake

# Only run style checks
bundle exec rake style

# Try to fix style offenses
bundle exec rake style:auto_correct
```

**Remember to run `bundle exec rake style:auto_correct` after running generators.** Hanami
code generators don't follow the configured style, most notably they use
_single quotes_.

## Deployment

This will deploy the app on Heroku and can be tried here: https://alcesleo-web-watcher.herokuapp.com/watchers/new

```sh
brew install heroku
heroku login

# If creating a new Heroku app
heroku create alcesleo-web-watcher

# If connecting to an existing Heroku app
heroku git:remote -a alcesleo-web-watcher

# Deploy
git push heroku master

# Run database migrations
heroku run hanami db migrate
```

### Environment variables

```
heroku config:set EMAIL_ADDRESS="theemail@gmail.com"
heroku config:set EMAIL_PASSWORD="thepassword"
heroku config:set SMTP_HOST="smtp.gmail.com"
heroku config:set SMTP_PORT=587
heroku config:set HOST_ADDRESS="http://alcesleo-web-watcher.herokuapp.com"
```

### Periodic updates

Configure the Heroku Scheduler Add-on to call `rake refresh_and_notify`.

### Troubleshooting

`<Hanami::Assets::MissingManifestFileError: Can't read manifest: /app/public/assets.json>`

Add the ENV variable `SERVE_STATIC_ASSETS=true` on Heroku.
