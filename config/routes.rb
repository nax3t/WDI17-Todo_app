Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes" 
  # or visit http://localhost:3000/rails/info with your server running

  # You can have the root of your site routed with "root"
  root 'todos#index'

  # Example of regular routes:
  # This tells us that any time we navigate to localhost:3000/todos
  # we will be directed to the index action inside of the todos_controller
  # once that code has been executed then the browser will render the
  # corresponding view, in this case it's index.html.erb
  get '/todos' => 'todos#index'
  # When we click submit on our index page's create form, this route is triggered
  # it will send us to the create action inside the todos_controller, execute that
  # code then redirect us to wherever we tell it to, 
  # see line 28 in our todos_controller
  post '/todos' => 'todos#create'
  # When we click the "Edit" link on the index.html.erb page, the browser looks
  # to the edit action of the todos_controller, after that code is executed the
  # corresponding edit.html.erb page is rendered
  # We use :id here to indicate that an id will be required as an argument when
  # using this route. Otherwise, how would we know which Todo item to edit?
  # We use as: :edit_todos at the end of line 26 to define a url helper
  get '/todos/:id/edit' => 'todos#edit', as: :edit_todos
  # PATCH is an HTTP verb, similar to POST, but allowing us to update existing
  # data in our database
  patch '/todos/:id' => 'todos#update', as: :todo

  # The 4 routes above can be written in one line using the resources keyword 
  # as seen on line 39, a resource route maps HTTP verbs to controller actions
  # automatically. You'll notice that Rails gives both a PUT and a PATCH for
  # updating resources. You can replicate this by putting:
  # put '/todos/:id' => 'todos#update'
  # beneath line 29 - a quick google search will explain the similarities
  # and differences between PUT and PATCH
  
  # resources :todos, only: [:index, :create, :edit, :update]

end
