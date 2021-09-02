require 'rails_helper'

RSpec.describe "As a guest user" do
  describe "I visit the stations index page" do
    it "displays each station with corresponding attributes" do
      visit "/stations?location=denver,co"
      
      expect(page).to have_content("Nearest Stations")
    end
  end
end