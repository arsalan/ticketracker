require 'spec_helper'

feature 'Creating Projects' do
	before do
		sign_in_as!(FactoryGirl.create(:admin_user))
		visit '/'
		click_link 'New Project'
	end

	scenario "can create a project" do
		fill_in 'Name', with: 'Ticket Tracker'
		fill_in 'Description', with: 'Ticket tracking'
		click_button 'Create Project'

		expect(page).to have_content('Project has been created.')

		project = Project.where(name: "Ticket Tracker").first
		expect(page.current_url).to eql(project_url(project))
		expect(page).to have_title("Ticket Tracker - Projects - Ticketracker")
	end

	scenario "cannot create a project without a name" do
		fill_in 'Description', with: 'Ticket tracking'
		click_button 'Create Project'
 
 		expect(page).to have_content('Project has not been created')
 		expect(page).to have_content("Name can't be blank")
	end
end