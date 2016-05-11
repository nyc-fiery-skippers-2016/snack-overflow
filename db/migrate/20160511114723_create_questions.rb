class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :title, null: false
  		t.string :body, null: false
  		t.integer :views, default: 0
  		t.references :user, foreign_key: true, null: false

  		t.timestamps(null: false)
  	end
  end
end
