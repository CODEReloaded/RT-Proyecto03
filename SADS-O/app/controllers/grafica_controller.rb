class GraficaController < ApplicationController
	def index
		# Ponemos los tipos de sangre que nosotros propusimos
		@blood_k = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
		# aqui guardaremos los resultados de las consultas de cada tipo de sangre
		@blood_count = []
		@blood_k.each do |blood|
			# metemos los resultados de las consultas para la grafica
			@blood_count.push([blood, Post.where("blood_type like ?", '%'+blood+'%').count,
				Answer.where("blood_group like ?", '%'+blood+'%').count])
		end
	end
end
