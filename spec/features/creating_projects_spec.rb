require 'spec_helper'

feature 'Creating Projects' do
	scenario "can create a project" do
		visit '/'

		click_link 'New Project'

		fill_in 'Name', with: 'Ticket Tracker'
		fill_in 'Description', with: 'Ticket tracking'
		click_button 'Create Project'

		expect(page).to have_content('Project has been created.')

		project = Project.where(name: "Ticket Tracker").first
		expect(page.current_url).to eql(project_url(project))
		expect(page).to have_title("Ticket Tracker - Projects - Ticketracker")
	end
end