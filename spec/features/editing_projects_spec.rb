require 'spec_helper'

feature "Editing Projects" do 
	before do
		FactoryGirl.create(:project, name: "Ticket Tracker")
		visit '/'
		click_link "Ticket Tracker"
	end

	scenario "Updating a project" do 
		click_link "Edit Project"

		fill_in "Name", with: "Ticket Tracker alpha"
		click_button "Update Project"

		expect(page).to have_content("Project has been updated.")
	end

	scenario "Updating a project with invalid attributes is bad" do
		click_link "Edit Project"
		fill_in "Name", with: ""
		click_button "Update Project"

		expect(page).to have_content("Project has not been updated.")
	end
end