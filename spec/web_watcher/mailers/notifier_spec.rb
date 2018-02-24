require "spec_helper"

describe Mailers::Notifier do
  let(:watcher)        { Fabricate.create(:watcher) }
  let(:first_request)  { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:second_request) { Fabricate.create(:request, watcher_id: watcher.id) }
  let(:from_email)     { "web_watcher_test@email.com" }
  let(:email_body)     { subject.body.encoded }

  subject { Mailers::Notifier.deliver(watcher: watcher, request1: first_request, request2: second_request) }

  before do
    ENV.stubs(:fetch).with("EMAIL_ADDRESS").returns(from_email)
    ENV.stubs(:fetch).with("HOST_ADDRESS").returns("testhost.com")
  end

  it "delivers email" do
    subject.to.must_equal      [watcher.email]
    subject.subject.must_equal "Watcher '#{watcher.description}' has detected a change"

    email_body.must_include "\"#{first_request.value}\""
    email_body.must_include "\"#{second_request.value}\""
    email_body.must_include "The change took place between #{first_request.created_at} and #{second_request.created_at}"
    email_body.must_include "testhost.com#{Web.routes.watcher_path(watcher.id)}"
  end

  it "gets the from-addres from an ENV variable" do
    subject.from.must_equal [from_email]
  end
end
