# list of answers to a question
get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find_by(question_id: :question_id)
  erb :'answers/index'
end

#1) get a form to submit an answer
get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

#2) execute intel received from form
post '/questions/:question_id/answers/new' do
  @question = Question.find(params[:id])
  if logged_in?
   @answer = Answer.new(body: params[:body], user_id: @question.user_id, question_id: @question.id)
    if @answer.save
      redirect '/questions/#{@question.id}/answers}'
    else
      erb :'answers/new'
    end
  else
    erb :'sessions/new'
    ## error telling them to sign in
  end
end

#edit answer entry. 2 steps:

#1) get an answer form to edit
get '/questions/:question_id_/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'/answers/edit'
end

#2) run the intel received from an answer edit form
post '/questions/:question_id_/answers/:id/edit' do
  if logged_in?
   @answer = Answer.find_by(id: params[:id])
    @answer.assign_attributes(body: params[:body])
    if @answer.save
      redirect "/questions/#{@question.id}/answers"
    else
      erb 'answers/edit'
    end
  else
    erb :'sessions/new'
    #throws error telling them to sign in
  end
end

#delete an answer
delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
   @answer = Answer.find_by(id: params[:id])
   @answer.destroy
   redirect "/questions/#{@question.id}/answers"
end







