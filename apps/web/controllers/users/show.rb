module Web::Controllers::Users
  class Show
    include Web::Action

    expose :watchers, :email

    def call(params)
      @email = params[:email]
      @watchers = WatcherRepository.new.find_by_email(@email).to_a

      redirect_to routes.new_watcher_path if @watchers.empty?
    end
  end
end
