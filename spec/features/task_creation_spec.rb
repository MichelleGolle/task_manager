require 'rails_helper'

RSpec.describe "Tasks" do
    it "can be added to a list" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Homework"
      click_link_or_button "Submit"

      expect(page).to have_content("Homework")
      click_link_or_button "Homework"
      click_link_or_button "Add Task"

      fill_in "Title", with: "Blogger"
      fill_in "Due date",  with: Date.new(2015, 9, 30)
      fill_in "Start date",  with: Date.new(2015, 8, 11)
      click_link_or_button "Submit"
      # save_and_open_page
      expect(page).to have_content("Blogger")
    end

    it "cannot be created with invalid inputs" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Blogger"
      click_link_or_button "Submit"
      click_link_or_button "Blogger"
      click_link_or_button "Add Task"
      fill_in "Title", with: ""
      click_link_or_button "Submit"
      expect(page).to have_content("can't be blank")
    end

    it "cannot be created with invalid date" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Blogger"
      click_link_or_button "Submit"
      click_link_or_button "Blogger"
      click_link_or_button "Add Task"
      fill_in "Title", with: "blog"
      fill_in "Due date", with: Date.new(2015, 7, 30)

      click_link_or_button "Submit"
      expect(page).to have_content("can't be in the past")
    end


    it "cannot be created with invalid date" do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Blogger"
      click_link_or_button "Submit"
      click_link_or_button "Blogger"
      click_link_or_button "Add Task"
      fill_in "Title", with: "blog"
      fill_in "Start date", with: Date.new(2015, 7, 30)

      click_link_or_button "Submit"
      expect(page).to have_content("can't be in the past")
    end

    it 'does not display unless start date is earlier than today' do
      visit root_path
      click_link_or_button "Create a new list"
      fill_in "Title", with: "Blogger"
      click_link_or_button "Submit"
      click_link_or_button "Blogger"
      click_link_or_button "Add Task"
      fill_in "Title", with: "blog123"
      fill_in "Start date", with: Date.new(2015, 9, 30)

      click_link_or_button "Submit"
      expect(page).to_not have_content("blog123")
    end
end
