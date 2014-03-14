class ProjectsController < ApplicationController
	before_filter :assign_project, for: 

	def index
		@projects = Project.all
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

	def edit
		@project = Project.find_by_id(params[:id])
	end

	def update
		@project = Project.find_by_id(params[:id])
		if @project.update(project_params)
			flash[:notice] = "Project has been updated."
			redirect_to @project
		else
			flash[:alert] = "Project has not been updated."
			render :edit
		end
	end


private

	def assign_project
		@project = Project.find_by_id(params[:id])
	end
	def project_params
		params.require(:project).permit(:name, :description)
	end
end
