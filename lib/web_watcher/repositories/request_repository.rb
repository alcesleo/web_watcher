class RequestRepository < Hanami::Repository
  def find_by_watcher(watcher)
    requests.where(watcher_id: watcher.id).to_a
  end
end
