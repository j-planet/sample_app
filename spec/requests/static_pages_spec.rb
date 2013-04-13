require 'spec_helper'

describe "Static Pages" do
  let(:base_title){"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Oh Herrooooooo~~')
    end

    it "should have the base title" do
      visit root_path
      page.should have_selector('title',
                                :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end

  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end

    it "should have the right title" do
      visit help_path
      page.should have_selector('title',
                                :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have content 'About Us'" do
      visit about_path
      page.should have_content('About Us')
    end

    it "should have the right title" do
      visit about_path
      page.should have_selector('title',
                                :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    it "should have the right h1" do
      visit contact_path
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the right title" do
      visit contact_path
      page.should have_selector('title', text => "#{base_title} | Contact Us")
    end
  end

end
