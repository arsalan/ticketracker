class ProjectsController < ApplicationController
	def index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to @project, notice: "Project has been created."
		else
			flash[:alert] = "Project has not been created."
			render :new
		end
	end

	def show
		@project = Project.find_by_id(params[:id])
	end


private

	def project_params
		params.require(:project).permit(:name, :description)
	end
end
