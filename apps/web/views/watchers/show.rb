module Web::Views::Watchers
  class Show
    include Web::View

    def refresh_button
      form_for :watcher, routes.refresh_watcher_path(watcher.id) do
        submit "Refresh"
      end
    end

    def delete_button
      form_for :watcher, routes.watcher_path(id: watcher.id), method: :delete do
        submit "Delete"
      end
    end
  end
end
