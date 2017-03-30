require "bundler/setup"
require "hanami/setup"
require "hanami/model"
require_relative "../lib/web_watcher"
require_relative "../apps/web/application"

Hanami.configure do
  mount Web::Application, at: "/"

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/web_watcher_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/web_watcher_development'
    #    adapter :sql, 'mysql://localhost/web_watcher_development'
    #
    adapter :sql, ENV["DATABASE_URL"]

    ##
    # Migrations
    #
    migrations "db/migrations"
    schema     "db/schema.sql"
  end

  mailer do
    root "lib/web_watcher/mailers"

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      options = {
        address:              ENV.fetch("SMTP_HOST"),
        port:                 ENV.fetch("SMTP_PORT"),
        user_name:            ENV.fetch("EMAIL_ADDRESS"),
        password:             ENV.fetch("EMAIL_PASSWORD"),
        authentication:       "plain",
        enable_starttls_auto: true,
      }

      delivery :smtp, options
    end
  end
end
