require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.default_driver = :selenium_chrome

url = 'https://demo.hitobito.com'

Capybara.app_host = url

class ScreenshotCapture
  include Capybara::DSL

  def capture_screenshot
    # Set the browser window size (width, height)
    page.driver.browser.manage.window.resize_to(1200, 800)

    visit('/de/users/sign_in')
    save_screenshot('screenshots/screenshot.png', full: true)
    fill_in 'Haupt-E-Mail', with: 'admin@hitobito.ch'
    fill_in 'Passwort', with: 'demo'
    click_button 'Anmelden'
    save_screenshot('screenshots/screenshot1.png', full: true)
    visit('/de/list_courses')
    save_screenshot('screenshots/screenshot2.png', full: true)
  end
end

screenshot_capture = ScreenshotCapture.new
screenshot_capture.capture_screenshot
