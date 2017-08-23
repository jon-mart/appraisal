class AddReferenceToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :super_manager, index: true
    add_reference :users, :super_manager, index: true
    add_reference :comments, :manager, index: true
  end
end
