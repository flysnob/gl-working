# Helper to facilitate capybara in an actual JS environment
module CustomJavascriptHelpers
  def click_js_and_validate(selector)
    find(selector).trigger('click')
    begin
      Timeout.timeout(Capybara.default_max_wait_time) do
        sleep(0.1) until yield
      end
    rescue
      find(selector).trigger('click')
    end
  end

  def check_checkbox(selector, value = true)
    sleep(1)
    find(selector).set(value)
  end
end

World(CustomJavascriptHelpers)
