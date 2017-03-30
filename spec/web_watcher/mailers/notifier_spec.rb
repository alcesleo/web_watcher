require "spec_helper"

describe Mailers::Notifier do
  let(:watcher)        { Fabricate.create(:watcher) }
  let(:first_request)  { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:second_request) { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:from_email)     { "web_watcher_test@email.com" }

  subject { Mailers::Notifier.deliver(watcher: watcher, request1: first_request, request2: second_request) }

  before do
    ENV.stubs(:fetch).with("EMAIL_ADDRESS").returns(from_email)
  end

  it "delivers email" do
    subject.to.must_equal      [watcher.email]
    subject.subject.must_equal "Watcher '#{watcher.description}' has detected a change"

    subject.body.encoded.must_include "Value changed from #{first_request.value} to #{second_request.value}"
    subject.body.encoded.must_include "
      The change took place between #{first_request.created_at} and #{second_request.created_at}".strip
    subject.body.encoded.must_include Web.routes.watcher_path(watcher.id)
  end

  it "gets the from-addres from an ENV variable" do
    subject.from.must_equal [from_email]
  end
end
