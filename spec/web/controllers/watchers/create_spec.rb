require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/create"

describe Web::Controllers::Watchers::Create do
  let(:action) { Web::Controllers::Watchers::Create.new }
  let(:params) {
    Hash[
      watcher: {
        description: "Test description",
        url: "http://www.test.com",
        selector: "#message",
        email: "test@email.com",
      }
    ]
  }

  before do
    WatcherRepository.new.clear
  end

  it "creates a new watcher" do
    action.call(params)

    action.watcher.id.wont_be_nil
    action.watcher.description.must_equal params[:watcher][:description]
  end

  it "redirects the user to the created watcher" do
    response = action.call(params)

    created_watcher_id = WatcherRepository.new.last.id

    response[0].must_equal 302
    response[1]["Location"].must_equal "/watchers/#{created_watcher_id}"
  end
end
