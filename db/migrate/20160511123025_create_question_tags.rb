class CreateQuestionTags < ActiveRecord::Migration
  def change
  	create_table :questiontags do |t|
  		t.references :tag, foreign_key: true, null: false
  		t.references :question, foreign_key: true, null: false

  		t.timestamps(null: false)
  	end
  end
end
