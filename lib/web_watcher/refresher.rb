# Meant to be called periodically to update all active watchers
class Refresher
  def self.call
    active_watchers = WatcherRepository.new.active_watchers

    active_watchers.each do |watcher|
      MakeRequest.call(watcher)
    end
  end
end
