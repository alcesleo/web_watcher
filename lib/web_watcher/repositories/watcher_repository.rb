class WatcherRepository < Hanami::Repository
  def active_watchers
    watchers
      .where(active: true)
      .order(Sequel.asc(:created_at))
  end

  def find_by_email(email)
    watchers
      .where(email: email)
      .order(:description)
  end

  def find(*args)
    super
  rescue Hanami::Model::Error => e
    raise if e.message !~ /invalid input syntax for uuid/
    nil
  end
end
