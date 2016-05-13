
get '/questions/:question_id/comments/new' do 
  @question = Question.find_by(id: params[:question_id])
  
  if request.xhr?
    erb :'comments/_new_question_comment_form', layout: false, locals: {question: @question}
  else  
    erb :'comments/_new_question_comment_form'
  end
end

get '/answers/:answer_id/comments/new' do 
  @answer = Answer.find_by(id: params[:answer_id])

  if request.xhr?  
    erb :'comments/_new_answers_comment_form', layout: false, locals: {answer: @answer}
  else
    erb :'comments/_new_answers_comment_form'
  end
end


get '/questions/:id/comments' do
	@question = Question.find_by(id: params[:id])
	@comments = @question.comments
	erb :'comments/index'
end

get '/answers/:answer_id/comments' do
	@answer = Answer.find_by(id: params[:answer_id])
	@comments = @answer.comments
	erb :'comments/index'
end

post '/questions/:id/comments' do 
  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :"/comments/_comment_partial", layout: false, locals: {comment: @comment}
    else
      erb :'comments/_new_question_comment_form'
    end
  end
end

post '/answers/:id/comments' do 

  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'comments/_comment_partial', layout: false, locals: {comment: @comment}
    else
      erb :'comments/_new_answer_comment_form'
    end
  end
end