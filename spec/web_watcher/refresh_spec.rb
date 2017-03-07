require "spec_helper"

describe Refresh do
  let(:watcher1) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test1.com",
      selector: "#message",
      email: "test@email.com",
    )
  }
  let(:watcher2) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test2.com",
      selector: "#message2",
      email: "test@email.com",
    )
  }
  let(:inactive_watcher) {
    WatcherRepository.new.create(
      description: "Test description",
      url: "http://www.test3.com",
      selector: "#message",
      email: "test@email.com",
      active: false,
    )
  }
  # let(:response_body) { '<div><br><br /><span id="message">test target</span></div>' }

  before do
    WatcherRepository.new.clear
    watcher1
    watcher2
    inactive_watcher
  end

  it "makes requests to all active watcher URLs" do
    called_with = []
    make_requests = ->(args) { called_with << args }

    Refresh.call(make_requests: make_requests)

    called_with.must_equal [watcher1, watcher2]
  end
end
