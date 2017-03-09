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
end
