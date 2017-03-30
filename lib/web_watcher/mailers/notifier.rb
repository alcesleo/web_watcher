class Mailers::Notifier
  include Hanami::Mailer

  from    :from
  to      :to
  subject :subject

  private

  def to
    watcher.email
  end

  def from
    ENV.fetch("EMAIL_ADDRESS")
  end

  def subject
    "Watcher '#{watcher.description}' has detected a change"
  end
end
