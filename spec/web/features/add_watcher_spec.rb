require "features_helper"

describe "Add a watcher" do
  before do
    WatcherRepository.new.clear
  end

  it "can create a new watcher" do
    visit "/watchers/new"

    assert page.has_content?("Add watcher")

    within "form#watcher-form" do
      fill_in "Description", with: "Notify me when GitHub status changes"
      fill_in "URL",         with: "https://status.github.com/graphs/past_month"
      fill_in "Selector",    with: "#message"
      fill_in "Email",       with: "test@email.com"

      click_button "Create"
    end

    created_watcher = WatcherRepository.new.last
    current_path.must_equal("/watchers/#{created_watcher.id}")
  end
end
