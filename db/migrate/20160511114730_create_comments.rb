class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :body, null: false
  		t.references :user, foreign_key: true, null: false
  		t.integer :commentable_id, polymorphic: true
  		t.string :commentable_type, polymorphic: true

  		t.timestamps(null: false)
  	end
  end
end
