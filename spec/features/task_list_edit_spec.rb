require 'rails_helper'

RSpec.describe "Editing lists" do
  context "with valid input" do
    it "can edit a list" do
      visit root_path

      click_link_or_button "Create a new list"
      fill_in "Title", with: "Dog stuff"
      click_link_or_button "Submit"
      expect(page).to have_content("Dog stuff")

      click_link_or_button "Edit"

      fill_in "Title", with: "Shopping"


      click_link_or_button "Submit"
      expect(page).to have_content("Shopping")
      expect(page).to_not have_content("Dog stuff")
    end
  end

  context "with invalid input" do
    it "cannot edit a list" do
      visit root_path

      click_link_or_button "Create a new list"
      fill_in "Title", with: "Dog stuff"
      click_link_or_button "Submit"
      expect(page).to have_content("Dog stuff")

      click_link_or_button "Edit"

      fill_in "Title", with: ""


      click_link_or_button "Submit"
      expect(page).to have_content("Invalid")
    end
  end
end
