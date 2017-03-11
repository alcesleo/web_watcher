# Meant to be called periodically to update all active watchers
class Notifier
  def self.call
    active_watchers    = WatcherRepository.new.active_watchers
    request_repository = RequestRepository.new

    # TODO: Optimise this 1+n query
    active_watchers.each do |watcher|
      request2, request1 = request_repository.find_by_watcher(watcher).limit(2)
      next if request1.value == request2.value

      Mailers::Notifier.deliver(watcher: watcher, request1: request1, request2: request2)
    end
  end
end
