module Web::Controllers::Watchers
  class Create
    include Web::Action

    expose :watcher

    def call(params)
      @watcher = WatcherRepository.new.create(params[:watcher])

      redirect_to "/watchers/#{@watcher.id}"
    end
  end
end
