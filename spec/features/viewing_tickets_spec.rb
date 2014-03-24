require 'spec_helper'

feature "Viewing tickets" do
	before do
		user = FactoryGirl.create(:user)
		first_proj = FactoryGirl.create(:project, name: "First Project")
		ticket = FactoryGirl.create(
			:ticket,
			project: first_proj,
			title: "Make it shiny!",
			description: "Some description")
			
		ticket.update(user: user)

=begin
		second_proj = FactoryGirl.create(
			:ticket,
			project: second_proj,
			title: "Standards compliance",
			description: "Isn't a joke.")
=end
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