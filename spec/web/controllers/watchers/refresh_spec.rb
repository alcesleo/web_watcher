require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/refresh"

describe Web::Controllers::Watchers::Refresh do
  let(:action)        { Web::Controllers::Watchers::Refresh.new }
  let(:watcher)       { Fabricate.create(:watcher) }
  let(:params)        { Hash[id: watcher.id] }
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
    MakeRequest.expects(:call).with(watcher)

    action.call(params)
  end
end
