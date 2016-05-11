require 'faker'

User.delete_all
Tag.delete_all

users = 10.times.map do
  User.create!( :username 		=> Faker::Superhero,
                :email      	=> Faker::Internet.email,
                :password   	=> 'password')
end

questions = 10.times.map do
	Question.create!(:title      => Faker::Book.title,
                  :body        => Faker::Lorem.paragraph)
                 
end

answers = 10.times.map do
	Answer.create!(:body					=> Faker::Hacker.say_something_smart,
								 :user_id				=> rand(1..10)
								 :question_id		=> rand(1..10)  )
end

tags = [%w(salty sweet savory umami yum gross bleh morning afternoon midnight diet gluten )].map do |tag|
		Tag.create!(:category 			=> tag)



