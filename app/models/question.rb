class Question < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :tags, through: :question_tags

end
=======
  # Remember to create a migration!
end
>>>>>>> master
