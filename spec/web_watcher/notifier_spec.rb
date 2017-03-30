require "spec_helper"

describe Notifier do
  let(:watcher_with_new_change) { Fabricate.create(:watcher) }
  let(:watcher_with_old_change) { Fabricate.create(:watcher) }
  let(:inactive_watcher)        { Fabricate.create(:watcher, active: false) }

  before do
    WatcherRepository.new.clear
    RequestRepository.new.clear

    # Requests with new change
    Fabricate.create(:request, watcher_id: watcher_with_new_change.id, value: "same")
    @request1 = Fabricate.create(:request, watcher_id: watcher_with_new_change.id, value: "same")
    @request2 = Fabricate.create(:request, watcher_id: watcher_with_new_change.id, value: "different")

    # Requests with old change
    Fabricate.create(:request, watcher_id: watcher_with_old_change.id, value: "different")
    Fabricate.create(:request, watcher_id: watcher_with_old_change.id, value: "same")
    Fabricate.create(:request, watcher_id: watcher_with_old_change.id, value: "same")

    # Requests with inactive watcher
    Fabricate.create(:request, watcher_id: inactive_watcher.id)
    Fabricate.create(:request, watcher_id: inactive_watcher.id)
  end

  it "sends a notification email with the new change" do
    Mailers::Notifier.expects(:deliver).with(
      watcher: watcher_with_new_change,
      request1: @request1,
      request2: @request2,
    )

    Notifier.call
  end
end