class Template < ActiveRecord::Base

	def next
		Template.where("id < ?", self.id).first
	end

	def prev
		Template.where("id > ?", self.id).last
	end

end
