class RequestRepository < Hanami::Repository
  def find_by_watcher(watcher)
    requests
      .where(watcher_id: watcher.id)
      .order(Sequel.desc(:created_at))
  end
end
