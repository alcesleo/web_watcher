module Web::Views::Watchers
  class Show
    include Web::View

    def delete_button
      form_for :watcher, routes.watcher_path(id: watcher.id), method: :delete do
        submit "Delete"
      end
    end
  end
end
