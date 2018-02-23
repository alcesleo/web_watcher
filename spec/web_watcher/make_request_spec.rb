require "spec_helper"

describe MakeRequest do
  let(:watcher)       { Fabricate.create(:watcher, selector: "#message") }
  let(:response_body) { %(<div><br><br /><span id="message">\n\ntest target\n\n</span></div>) }

  let(:invalid_utf8_response_body) { <<-HTML }
    <div class="entry-content">
      <p>&nbsp;å</p>
    </div>
  HTML

  before do
    RequestRepository.new.clear

    stub_request(:get, watcher.url).to_return(status: 200, body: response_body)
  end

  it "makes a web request given a Watcher" do
    MakeRequest.call(watcher)

    assert_requested(:get, watcher.url)
  end

  it "saves the request in the database" do
    request = MakeRequest.call(watcher)

    request.id.wont_be_nil
    request.status_code.must_equal 200
    request.watcher_id.must_equal watcher.id
  end

  it "parses the response according to the given selector" do
    request = MakeRequest.call(watcher)

    request.value.must_equal "test target"
  end

  it "parses the tricky encoded response according to the given selector" do
    watcher = Fabricate.create(:watcher, selector: ".entry-content")
    stub_request(:get, watcher.url).to_return(status: 200, body: invalid_utf8_response_body)

    request = MakeRequest.call(watcher)

    request.value.must_equal " å"
  end
end
