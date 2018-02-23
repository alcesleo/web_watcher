# Responsible for making one web request and saving the results given a Watcher
class MakeRequest
  def self.call(watcher)
    new(watcher).call
  end

  def initialize(watcher)
    @watcher = watcher
  end

  def call
    RequestRepository.new.create(
      value: selected_contents,
      status_code: response.status.code,
      watcher_id: watcher.id,
    )
  end

  private

  attr_reader :watcher

  def selected_contents
    parsed_response.css(watcher.selector).text.strip
  end

  def parsed_response
    Oga.parse_html(response_body)
  end

  def response
    @_response ||= HTTP.get(watcher.url)
  end

  def response_body
    response.body.to_s.force_encoding("UTF-8")
  end
end
