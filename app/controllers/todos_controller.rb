class TodosController < ApplicationController
	def index
		@todos = Todo.all
		@todo = Todo.new
	end

	def create
		description = params.require(:todo).permit(:description)
		Todo.create(description)
		redirect_to todos_path
	end
end
