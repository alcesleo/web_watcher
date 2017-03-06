module Web::Controllers::Watchers
  class Show
    include Web::Action

    expose :watcher

    def call(params)
      @watcher = WatcherRepository.new.find(params[:id])
      not_found if @watcher.nil?
    rescue Hanami::Model::Error => e
      raise if e.message !~ /invalid input syntax for uuid/
      not_found
    end

    private

    def not_found
      status 404, "Watcher not found"
    end
  end
end
