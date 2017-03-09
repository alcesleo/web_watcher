require "spec_helper"

describe RequestRepository do
  subject       { RequestRepository.new }
  let(:email)   { Faker::Internet.email }
  let(:watcher) { Fabricate.create(:watcher) }

  before do
    subject.clear

    @request1 = Fabricate.create(:request, watcher_id: watcher.id)
    @request2 = Fabricate.create(:request)
    @request3 = Fabricate.create(:request, watcher_id: watcher.id)
  end

  it "finds requests by watcher" do
    subject.find_by_watcher(watcher).to_a.must_equal [@request3, @request1]
  end
end
