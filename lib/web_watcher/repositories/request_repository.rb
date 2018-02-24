class RequestRepository < Hanami::Repository
  def find_by_watcher(watcher)
    requests
      .where(watcher_id: watcher.id)
      .where(status_code: 200)
      .order(Sequel.desc(:created_at))
  end
end
