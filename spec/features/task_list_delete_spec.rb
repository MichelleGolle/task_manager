require 'rails_helper'

RSpec.describe "Deleting lists" do
    xit "can delete a list" do
      visit root_path

      click_link_or_button "Create a new list"
      fill_in "Title", with: "Dog stuff"
      click_link_or_button "Submit"
      expect(page).to have_content("Dog stuff")

      click_link_or_button "Delete"

      expect(page).to_not have_content("Dog stuff")
    end
end
