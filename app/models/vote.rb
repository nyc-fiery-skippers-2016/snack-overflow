class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  belongs_to :question
  belongs_to :comment
  belongs_to :votable, polymorphic: true

  validates :user_id, presence: true

end
