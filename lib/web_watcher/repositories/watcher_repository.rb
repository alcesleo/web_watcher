class WatcherRepository < Hanami::Repository
  def active_watchers
    watchers
      .where(active: true)
      .order(Sequel.asc(:created_at))
  end
end
