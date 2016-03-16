class GraficaController < ApplicationController
	def index
		@blood_k = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
		@blood_count = []
		@blood_k.each do |blood|
			@blood_count.push([blood, Post.where("blood_type like ?", '%'+blood+'%').count,
				Answer.where("blood_group like ?", '%'+blood+'%').count])
		end
	end
end
