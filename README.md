# Web Watcher

A simple web app that lets you set an element on a website to watch, and
receive an email when the contents of that element changes.

## Development

```sh
bundle
bundle exec hanami db prepare
```

### Tests

```sh
HANAMI_ENV=test bundle exec hanami db prepare
bundle exec rake test
```

### Style

RuboCop is being run as part of the default task:

```sh
bundle exec rake
bundle exec rake style # Only run style checks
```

**Remember to run `rubocop --auto-correct` after running generators.** Hanami
code generators don't follow the configured style, most notably they use
_single quotes_.

## Deployment

```sh
brew install heroku
heroku login

# If creating a new Heroku app
heroku create

# If connecting to an existing Heroku app
heroku git:remote -a alcesleo-web-watcher

# Deploy
git push heroku master
```

### Troubleshooting

`<Hanami::Assets::MissingManifestFileError: Can't read manifest: /app/public/assets.json>`

Add the ENV variable `SERVE_STATIC_ASSETS=true` on Heroku.
