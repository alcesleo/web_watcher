require "spec_helper"
require_relative "../../../../apps/web/controllers/watchers/new"

describe Web::Controllers::Watchers::New do
  let(:action) { Web::Controllers::Watchers::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
