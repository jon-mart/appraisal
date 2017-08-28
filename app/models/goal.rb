class Goal < ApplicationRecord
    validates :name, uniqueness: true
	before_save :before_save_goal#, message: "Super Manager don't need goal"

	belongs_to :user
	has_many :comments, dependent: :destroy

	delegate :current_user_role, to: :user

    
    # Getting the current user role of this object
    # by using the delegate return.
	def before_save_goal
		# 
		if self.current_user_role == 'sm'
			raise "Super Manager don't need goal"
	    end
	end

end
