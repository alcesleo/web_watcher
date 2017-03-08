require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/refresh"

describe Web::Controllers::Watchers::Refresh do
  let(:action) { Web::Controllers::Watchers::Refresh.new }
  let(:watcher) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test.com",
      selector: "#message",
      email: "test@email.com",
    )
  }
  let(:params) { Hash[id: watcher.id] }
  let(:response_body) { %(<div><br><br /><span id="message">\n\ntest target\n\n</span></div>) }

  before do
    WatcherRepository.new.clear
    RequestRepository.new.clear

    stub_request(:get, watcher.url).to_return(status: 200, body: response_body)
  end

  it "redirects to the show action" do
    response = action.call(params)

    response[0].must_equal 302
    response[1]["Location"].must_equal "/watchers/#{watcher.id}"
  end

  it "makes a new request" do
    RequestRepository.new.requests.count.must_equal 0

    action.call(params)

    RequestRepository.new.requests.count.must_equal 1
  end
end
