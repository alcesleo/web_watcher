module Web::Controllers::Watchers
  class Destroy
    include Web::Action

    def call(params)
      repo = WatcherRepository.new
      watcher = repo.find(params[:id])

      repo.delete(watcher.id)

      if repo.find_by_email(watcher.email).to_a.empty?
        redirect_to routes.new_watcher_path
      else
        redirect_to routes.user_path(watcher.email)
      end
    end
  end
end
