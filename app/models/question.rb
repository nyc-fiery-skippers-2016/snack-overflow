class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  has_many :votes, as: :votable

  has_many :comments, as: :commentable
  has_many :tags, through: :question_tags

  def totalVotes
    self.votes.sum(:value)
  end

  def question_owner
    current_user.id == self.user_id
  end

end

