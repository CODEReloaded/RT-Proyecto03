class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	validates :post_name, :blood_type, :message, presence: true
	validates :slug, uniqueness: true
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers

	def slug_candidates
		[:post_name, [:post_name, :id_for_slug]]
	end

	def id_for_slug
		generated_slug = normalize_friendly_id(post_name)
	    things = self.class.where('slug LIKE :pattern', pattern: "#{generated_slug}(-[0-9]+)?$")
	    things = things.where.not(id: id) unless new_record?
	    things.count + 1
	end

	def should_generate_new_friendly_id?
		post_name_changed? || super
	end

end
