# Web Watcher

A simple web app that lets you set an element on a website to watch, and
receive an email when the contents of that element changes.

## Development

```sh
bundle
bundle exec hanami db prepare
```

### Tests

```
HANAMI_ENV=test bundle exec hanami db prepare
bundle exec rake test
```
