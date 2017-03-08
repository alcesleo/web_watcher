module Web::Controllers::Watchers
  class Refresh
    include Web::Action

    def call(params)
      watcher = WatcherRepository.new.find(params[:id])
      MakeRequest.call(watcher)
      redirect_to routes.watcher_path(watcher.id)
    end
  end
end
