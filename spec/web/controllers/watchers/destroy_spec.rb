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
  end

  it "redirects to the user_path if other watchers exist" do
    other_watcher

    response = action.call(params)

    response[0].must_equal 302
    response[1]["Location"].must_equal "/users/#{watcher.email}"
  end

  it "redirects to the new_path if no other watchers exist" do
    response = action.call(params)

    response[0].must_equal 302
    response[1]["Location"].must_equal "/watchers/new"
  end

  it "deletes the watcher" do
    other_watcher

    WatcherRepository.new.watchers.count.must_equal 2

    action.call(params)

    WatcherRepository.new.watchers.count.must_equal 1
  end
end
