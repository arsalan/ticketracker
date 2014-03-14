require 'spec_helper'

feature "Viewing projects" do
	scenario "Listing all projects" do
		project = FactoryGirl.create(:project, name: "Ticket Tracker")
		visit '/'
		click_link "Ticket Tracker"

		expect(page.current_url).to eql(project_url(project))
	end
end