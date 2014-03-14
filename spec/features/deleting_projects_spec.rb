require 'spec_helper'

feature "Deleting projects" do
	before do
		FactoryGirl.create(:project, name: "Ticket Tracker")
		visit '/'
		click_link "Ticket Tracker"
	end

	scenario "Deleting a project" do
		click_link "Delete"

		expect(page).to have_content("Project has been deleted.")

		visit '/'
		expect(page).to have_no_content("Ticket Tracker")
	end
end