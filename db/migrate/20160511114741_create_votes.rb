class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :value || 0
  		t.references :user
  		t.integer :votable_id, polymorphic: true
  		t.string :votable_type, polymorphic: true

  		t.timestamps(null: false)
  	end
  end
end
