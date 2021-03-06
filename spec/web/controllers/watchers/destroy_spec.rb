require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/destroy"

describe Web::Controllers::Watchers::Destroy do
  let(:action)  { Web::Controllers::Watchers::Destroy.new }
  let(:watcher) { Fabricate.create(:watcher) }
  let(:other_watcher) { Fabricate.create(:watcher) }
  let(:params)  { Hash[id: watcher.id] }

  before do
    WatcherRepository.new.clear

    watcher
    other_watcher
  end

  it "redirects to the /users path" do
    response = action.call(params)

    response[0].must_equal 302
    response[1]["Location"].must_equal "/users/#{watcher.email}"
  end

  it "deletes the watcher" do
    WatcherRepository.new.watchers.count.must_equal 2

    action.call(params)

    WatcherRepository.new.watchers.count.must_equal 1
  end
end
