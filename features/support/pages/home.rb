class Home
  include PageObject

  def my_profile
    sleep 10
    browser.a(title: 'Profile').wait_until(&:present?).click
    sleep 10
  end
end
