require "spec_helper"
require_relative "../../../../apps/web/views/watchers/show"

describe Web::Views::Watchers::Show do
  let(:exposures) { Hash[watcher: "bar"] }
  let(:template)  { Hanami::View::Template.new("apps/web/templates/watchers/show.html.erb") }
  let(:view)      { Web::Views::Watchers::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    skip "This is an auto-generated test. Edit it and add your own tests."

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
