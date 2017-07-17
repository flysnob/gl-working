# When ajax calls get made inside a cucumber test, you probably have to wait for the call to come back before testing.
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

end

World(WaitForAjax)
