module Web::Controllers::Watchers
  class Show
    include Web::Action

    expose :watcher
    expose :requests

    # TODO: Move rescue logic to WatcherRepository
    def call(params)
      @watcher = WatcherRepository.new.find(params[:id])
      not_found if @watcher.nil?

      @requests = RequestRepository.new.find_by_watcher(@watcher)
    rescue Hanami::Model::Error => e
      raise if e.message !~ /invalid input syntax for uuid/
      not_found
    end

    private

    def not_found
      halt 404, "Watcher not found"
    end
  end
end
