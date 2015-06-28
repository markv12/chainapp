class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.text :name
      t.text :description
      t.date :start_date, :null => false
      t.date :last_check_in
      t.belongs_to :user
      t.timestamps
    end
  end
end
