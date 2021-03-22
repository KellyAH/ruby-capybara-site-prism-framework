require 'capybara/rspec'
require 'selenium-webdriver'
require "site_prism"

# NOTE: all tests require this setup
Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# @wiki_page = WikiPage.new
describe "wikipedia", type: :feature do

  it "can search for keywords" do
    # @wiki_page.load

    visit 'https://www.wikipedia.org/'
    sleep 10
    # fill_in 'Email', with: 'user@example.com'
    # end
    # click_button 'Sign in'
    # expect(page).to have_content 'Success'
  end
end