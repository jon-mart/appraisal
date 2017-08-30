class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :name
    	t.integer :salary
    	t.string :contact
    	t.string :role
    	t.references :manager, index: true
      t.references :member, index: true

      t.timestamps
    end
  end
end
