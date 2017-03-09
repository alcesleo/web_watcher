require "spec_helper"

describe WatcherRepository do
  subject { WatcherRepository.new }
  let(:email) { Faker::Internet.email }

  before do
    subject.clear

    @watcher1 = Fabricate.create(:watcher, description: "ZZZ", email: email)
    @watcher2 = Fabricate.create(:watcher, description: "AAA")
    @watcher3 = Fabricate.create(:watcher, description: "BBB", active: false, email: email)
  end

  it "finds active watchers" do
    subject.active_watchers.to_a.must_equal [@watcher1, @watcher2]
  end

  it "finds watchers by email" do
    subject.find_by_email(email).to_a.must_equal [@watcher3, @watcher1]
  end

  it "returns nil when given an invalid UUID" do
    subject.find("nonexistent").must_be_nil
  end
end
