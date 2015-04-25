class TodosController < ApplicationController
	def index
		# Call all of our Todo(s) that we've created and point to them with
		# an instance variable named @todos
		# *Remember, anything that we put an @ sign in front of will then be
		# made available to us in the action's corresponding view page, in this
		# instance it would be index.html.erb because we are inside of the index
		# action
		@todos = Todo.all
		# instantiate a new instance of Todo and point
		# to it with the @todo instance variable
		# This allows us to use the create form on the index page
		@todo = Todo.new
	end

	def create
		# When we press submit on the index page's create form, the values from
		# the input fields will be packaged up into our params hash and sent to
		# this controller. We've whitelisted the param values in the privte method
		# named todo_params on lines 27-33, now we can simply create a new instance
		# of Todo by calling create on the Todo model (this should remind you of classes
		# in ruby!) and passing in the todo_params as an argument
		Todo.create(todo_params)
		# Now that we've created our Todo item, let's redirect to the home page
		# *Remember if you can't remember your path helpers, type: 'rake routes'
		# into your terminal, or simply visit http://localhost:3000/rails/info
		# with your server running
		redirect_to todos_path
	end

	def edit
		# How can we edit a Todo item without first figuring out which item
		# we are editing?

		# The code below uses the Todo model's find method paired with the id
		# of the particular Todo item in question to find that item and make it
		# available to us on the edit page via an instance variable named @todo
		# As you can see, we're using the id that was given to us in the params
		# when we clicked the "Edit" link on our Todos index page

		# See line 13 on index.html.erb to see how we passed the item's id
		# to the params via an argument inside of a path helper that points to this
		# edit method ( i.e., link_to 'Edit', edit_todos_path(todo.id) )
		@todo = Todo.find(params[:id])
	end

	def update
		# The form on our edit.html.erb page passes the instance of Todo to
		# this update action which then allows us to find the item in the
		# database and update it
	  @todo = Todo.find(params[:id])
	 	# if the update is succesful (no errors) then redirect us back to
	 	# the Todos index page, otherwise render the edit page
	  if @todo.update(todo_params)
	    redirect_to todos_path
	  else
	    render 'edit'
	  end
	end


private
# refer to http://guides.rubyonrails.org/getting_started.html#creating-articles
# and http://guides.rubyonrails.org/getting_started.html#saving-data-in-the-controller
# to better understand why we "whitelist" our params
	def todo_params
		params.require(:todo).permit(:description)
	end
end
