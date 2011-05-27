#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'pp'

keyword_tool_url = "https://adwords.google.com/o/Targeting/Explorer?__c=7527874566&__u=2150167566&__o=kt&ideaRequestType=KEYWORD_IDEAS#search.none"
url = 'http://welcome.the3skills.com/a.html'

def load_or_default_profile name
  name += '.json'
  begin
    profile_data = File.read name
    profile = Selenium::WebDriver::Firefox::Profile.from_json profile_data
  rescue 
    profile = Selenium::WebDriver::Firefox::Profile.new
    #proxy = Selenium::WebDrier::Proxy.new(:http => url)
    #profile.proxy = proxy
    profile['browser.download.dir'] = Dir.pwd
    profile['browser.helperApps.neverAsk.saveToDisk'] = '*/*'

    File.open(name, 'w') do |f|
      f.puts profile.to_json
    end
  end
  profile
end

profile = load_or_default_profile 'sid137'
# Basic Driver instance methods
# http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/Driver.html
driver = Selenium::WebDriver.for :firefox, :profile => profile

# http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/Timeouts.html
driver.manage.timeouts.implicit_wait = 25 # seconds
driver.manage.timeouts.script_timeout = 25 # seconds


# http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/Navigation.html
driver.navigate.to keyword_tool_url


driver["Email"].send_keys "sid137"
driver["Passwd"].send_keys "ambo1378963H8s541"
driver["signIn"].submit

driver.navigate.to keyword_tool_url

# http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/Element.html

# When using find_element or find_elements
# http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/SearchContext.html

#//*[(@id = "gwt-debug-searchInput-websiteTextbox")] # sebsite textbox
driver["gwt-debug-searchInput-websiteTextbox"].send_keys url

#gwt-debug-searchInput-keywordTextbox
#//*[(@id = "gwt-debug-searchInput-keywordTextbox")] #keyword list tetbox

#//*[(@id = "gwt-debug-searchPanel-searchButton")]  #search buttom
driver["gwt-debug-searchPanel-searchButton"].click


#gwt-debug-tableHeader-downloadDropSelection-content
#//*[(@id = "gwt-debug-tableHeader-downloadDropSelection-content")]



