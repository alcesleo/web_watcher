module Web::Views::Users
  class Show
    include Web::View

    def watcher_list
      html.ul do
        watchers.each do |watcher|
          li(link_to(watcher.description, routes.watcher_path(watcher.id)))
        end
      end
    end
  end
end
