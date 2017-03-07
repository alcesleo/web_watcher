# Meant to be called periodically to update all active watchers
class Refresh
  def self.call(make_requests: MakeRequest)
    active_watchers = WatcherRepository.new.active_watchers

    active_watchers.each do |watcher|
      make_requests.call(watcher)
    end
  end
end
