require "spec_helper"
require_relative "../../../../apps/web/controllers/users/show"

describe Web::Controllers::Users::Show do
  let(:action) { Web::Controllers::Users::Show.new }
  let(:params) { Hash[email: email] }

  let(:email) { "test@email.com" }
  let(:watchers) {
    [
      Fabricate.create(:watcher, email: email),
      Fabricate.create(:watcher, email: email),
    ]
  }
  let(:other_watcher) { Fabricate.create(:watcher) }

  before do
    WatcherRepository.new.clear

    watchers
    other_watcher
  end

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end

  it "exposes the watchers of the selected user" do
    action.call(params)

    action.watchers.must_equal watchers
  end

  it "exposes the email of the selected user" do
    action.call(params)

    action.email.must_equal email
  end

  it "returns 404 if no watchers exist for that email" do
    response = action.call(email: "not_present@email.com")
    response[0].must_equal 404
  end
end
