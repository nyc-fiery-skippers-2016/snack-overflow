class CreateTags < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  		t.string :category, null: false

  		t.timestamps(null: false)
  	end
  	add_index :tags, :category, unique: true
  end
end
