class Comment < ApplicationRecord
	belongs_to :goal
	belongs_to :user, optional: true
	belongs_to :managers, class_name: 'User', foreign_key: 'manager_id', optional: true
	belongs_to :super_manager, class_name: 'User', foreign_key: 'super_manager_id', optional: true
end

