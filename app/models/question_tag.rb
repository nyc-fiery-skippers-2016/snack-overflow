class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag

  validates :question_id, :tag_id, presence :true
end
