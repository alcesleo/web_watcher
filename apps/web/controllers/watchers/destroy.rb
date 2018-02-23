module Web::Controllers::Watchers
  class Destroy
    include Web::Action

    def call(params)
      repo = WatcherRepository.new
      watcher = repo.find(params[:id])

      repo.delete(watcher.id)

      redirect_to routes.user_path(watcher.email)
    end
  end
end
