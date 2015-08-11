require 'rails_helper'

RSpec.describe "On home page" do
    it "I can add a list" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Homework"
      click_link_or_button "Submit"

      expect(page).to have_content("Homework")
    end

    it "cannot be created with invalid inputs" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: ""
      click_link_or_button "Submit"

      expect(page).to have_content("Invalid")
    end
end
