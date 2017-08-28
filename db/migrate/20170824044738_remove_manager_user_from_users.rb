class RemoveManagerUserFromUsers < ActiveRecord::Migration[5.1]
  def change
    # remove_reference :users, :manager_id, index: true
    #remove_column :users, :id, :integer
    add_reference :comments, :users, index: true
    add_reference :comments, :goals, index: true
    
  end
end
