require 'spec_helper'

feature "Viewing tickets" do
	before do
		first_proj = FactoryGirl.create(:project, name: "First Project")
		FactoryGirl.create(
			:ticket, 
			project: first_proj,
			title: "Make it shiny!",
			description: "Some description")
		second_proj = FactoryGirl.create(
			:ticket,
			project: second_proj,
			title: "Standards compliance",
			description: "Isn't a joke.")
		visit '/'
	end

	scenario "Viewing tickets for a given project" do
		click_link "First Project"
		expect(page).to have_content("Make it shiny!")
		expect(page).to_not have_content("Standards compliance")

		click_link "Make it shiny!"
		within("#ticket h2") do
			expect(page).to have_content("Make it shiny!")
		end

		expect(page).to have_content("Some description")
	end
end