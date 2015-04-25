class Todo < ActiveRecord::Base
	before_save :default_values
	def default_values
	  self.complete ||= true
	end
end
