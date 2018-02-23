# Responsible for making one web request and saving the results given a Watcher
class MakeRequest
  def self.call(watcher)
    new(watcher).call
  end

  def initialize(watcher)
    @watcher = watcher
  end

  def call
    response = HTTP.get(watcher.url)

    selected_contents = Oga.parse_html(response.body.to_s).css(watcher.selector).text.strip

    RequestRepository.new.create(
      value: selected_contents,
      status_code: response.status.code,
      watcher_id: watcher.id,
    )
  end

  private

  attr_reader :watcher
end
