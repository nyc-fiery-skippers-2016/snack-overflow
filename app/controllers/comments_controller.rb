
get '/questions/:question_id/comments/new' do 
  @question = Question.find_by(id: params[:question_id])
  erb :'comment/new'
end

get '/anwers/:answer_id/comments/new' do 
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'comment/new'
end


get '/question/:id/comments' do
	@question = Question.find_by(id: params[:question_id])
	@comments = @question.comments
	erb :'comments/index'
end

get '/answers/:answer_id/comments' do
	@answer = Answer.find_by(id: params[:answer_id])
	@comments = @anwer.comments
	erb :'comments/index'
end

post '/questions/:id/comments' do 
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'comment/_new_question_comment_form'
  end
end

post '/answers/:id/comments' do 

  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@comment.commentable.question_id}"
  else
    erb :'comment/_new_answer_comment_form'
  end
end