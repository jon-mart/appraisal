class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
    	t.references :user
    	t.string :details
    	t.string :status

      t.timestamps
    end
  end
end
