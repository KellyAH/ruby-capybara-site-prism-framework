## Framework Setup
NOTE: Assumes you are on a Mac which comes with Ruby. And chrome browser is already installed.

### Dependences
1. create a Gemfile via `bundle init`
1. add gem dependencies
1. install gems via `bundle install`

Why these gems are needed:
- [RSpec](https://rspec.info/documentation/) is needed for core test framework assertions
- [Capybara](https://github.com/teamcapybara/capybara/blob/master/README.md) - allows prog to send command to a browser
- [Selenium-webdriver](https://www.selenium.dev/documentation/en/webdriver/) - the driver drives the browser
- [Site-prism](https://github.com/site-prism/site_prism) - makes creating page obj easier and faster

See selenium architecture [diagram](https://www.browserstack.com/guide/ui-testing-with-selenium) 
for why selenium webdriver and chrome driver is required. 

### Create Test
1. create simple RSpec test 

```
# wiki_test_spec.rb

describe "wikipedia", type: :feature do
  it "go to page" do
    visit 'https://www.wikipedia.org/'
    sleep 10
  end
end
```

### Configs
1. Set driver configs in the test file (temporarily). Configs in the future should go in a helper file:
```
# set selenium as Capybara's default_driver
Capybara.default_driver = :selenium

# tell selenium to control chrome browser   
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
```
[Ref](https://github.com/teamcapybara/capybara#configuring-and-adding-drivers)

### Install Chromedriver
1. install chromedriver via:

# For Mac 
1. Create directory `${HOME}/bin`
1. Download [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) for Mac and save to `${HOME}/bin`
1. `cd ${HOME}/bin && chmod +x chromedriver` to make it executable
1. Open your shell profile (E.g. `${HOME}/.bash_profile`) in a text editor
1. Add line `export PATH="${PATH}:${HOME}/bin"` then save the file
1. Restart your terminal
1. Verify setup with `chromedriver -v`

NOTE: Learn about `$PATH` [here](https://launchschool.com/books/command_line/read/environment#path)

[Ref](https://zwbetz.com/download-chromedriver-binary-and-add-to-your-path-for-automated-functional-testing/)

### Execute Test
1. execute test via `rspec [path to spec file]` 
E.g. (`rspec tests/wiki_test_spec.rb`) 
1. watch test run in a new chrome browser session.


