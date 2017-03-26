require "spec_helper"

describe Refresher do
  let(:watcher1)         { Fabricate.create(:watcher) }
  let(:watcher2)         { Fabricate.create(:watcher) }
  let(:inactive_watcher) { Fabricate.create(:watcher, active: false) }

  before do
    WatcherRepository.new.clear
    watcher1
    watcher2
    inactive_watcher
  end

  it "makes requests to all active watcher URLs" do
    MakeRequest.expects(:call).with(watcher1)
    MakeRequest.expects(:call).with(watcher2)

    Refresher.call
  end
end
