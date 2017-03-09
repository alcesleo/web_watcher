module Web::Controllers::Watchers
  class Show
    include Web::Action

    expose :watcher
    expose :requests

    def call(params)
      @watcher = WatcherRepository.new.find(params[:id])
      halt 404, "Watcher not found" if @watcher.nil?

      @requests = RequestRepository.new.find_by_watcher(@watcher).to_a
    end
  end
end
