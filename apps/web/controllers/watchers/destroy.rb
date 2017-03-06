module Web::Controllers::Watchers
  class Destroy
    include Web::Action

    def call(params)
      WatcherRepository.new.delete(id: params[:id])

      redirect_to routes.new_watcher_path
    end
  end
end
