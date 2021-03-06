class User < ApplicationRecord
	# To have a relationship between the user and member(base) model
	# one to one model is used
	belongs_to :member, dependent: :destroy

	before_save :super_user_to_nil

	mount_uploader :avatar, AvatarUploader

	belongs_to :super_manager, class_name: 'User', optional: true
	has_many :managers, class_name: 'User', foreign_key: 'super_manager_id', dependent: :nullify

	belongs_to :manager, class_name: 'User', optional: true
	has_many :engineers, class_name: 'User', foreign_key: 'manager_id', dependent: :nullify

	# has_many :engineers, through: :manager, source: :super_manager

	has_many :goals, dependent: :destroy
	
	# has_many :comment, dependent: :destroy

	def current_user_role
		return self.role 
	end

	def current_user_id
		return self.id
	end

	private
	def super_user_to_nil
		if current_user_role == 'e'
			self.super_manager_id = nil
		end
	end
end
