class RemoveReferenceFromComment < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :comments, :users, index: true
  end
end
