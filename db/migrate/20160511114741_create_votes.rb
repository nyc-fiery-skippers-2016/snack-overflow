class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :value, :default => 0
  		t.references :user, foreign_key: true, null: false
  		t.integer :votable_id, polymorphic: true, null: false
  		t.string :votable_type, polymorphic: true, null: false

  		t.timestamps(null: false)
  	end
  end
end
