require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/show"

describe Web::Controllers::Watchers::Show do
  let(:action) { Web::Controllers::Watchers::Show.new }
  let(:watcher) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test.com",
      selector: "#message",
      email: "test@email.com",
    )
  }
  let(:params) { Hash[id: watcher.id] }

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
