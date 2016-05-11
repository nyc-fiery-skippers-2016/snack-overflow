class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.string :body, null: false
  		t.references :user, foreign_key: true, null: false
  		t.references :question, foreign_key: true, null: false

  		t.timestamps(null: false)
  	end
  end
end
