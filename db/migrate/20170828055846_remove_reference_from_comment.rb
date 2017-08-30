class RemoveReferenceFromComment < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :comments, :users, index: true
  	add_column :users, :gender, :string, default: 'M'
  	 
  end
end
