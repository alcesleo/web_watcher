require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/show"

describe Web::Controllers::Watchers::Show do
  let(:action) { Web::Controllers::Watchers::Show.new }
  let(:params) { Hash[id: watcher.id] }

  let(:watcher)       { Fabricate.create(:watcher) }
  let(:other_watcher) { Fabricate.create(:watcher) }
  let(:request1)      { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:request2)      { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:other_request) { Fabricate.create(:request, watcher_id: other_watcher.id) }

  before do
    WatcherRepository.new.clear
    RequestRepository.new.clear

    watcher
    other_watcher
    request1
    request2
    other_request
  end

  it "exposes the watcher and its requests" do
    action.call(params)

    action.watcher.must_equal watcher
    action.requests.must_equal [request2, request1]
  end

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end

  it "returns 404 when given an invalid uuid" do
    response = action.call(id: "nonexistent")
    response[0].must_equal 404
  end

  it "returns 404 when given a non existent id" do
    response = action.call(id: "98031dde-03a4-4bdb-8f0f-fbf409d460e5")
    response[0].must_equal 404
  end
end
