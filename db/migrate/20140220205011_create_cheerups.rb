class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.text :characters
      t.integer :cheerpoints
      t.references :user

      t.timestamps
    end
    add_index :cheerups, :user_id
  end
end
