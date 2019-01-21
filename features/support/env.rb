require 'watir'
require 'page-object'
require 'page-object/page_factory'
require File.dirname(__FILE__) + '/pages/login'

World(PageObject::PageFactory)

username = ENV['USER']
password = ENV['PASS']



browser = Watir::Browser.new :chrome, { args: ['--disable-notifications'] }

Before do 
  @username = username
  @password = password
  @browser = browser
end
