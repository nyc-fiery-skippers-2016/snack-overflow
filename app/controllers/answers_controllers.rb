# list of answers to a question
get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  erb :'answers/index'
end

#display a specific answer to a question
get '/questions/:question_id/answers/:id' do
   @question = Question.find(params[:question_id])
   @answer = Answer.find(params[:id])
   erb :'answers/show'
end

#submit a new answer. 2 steps:

#1) get a form to submit an answer
get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

#2) execute intel received from new-answer form
post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
   @answer = Answer.new(body: params[:body], user_id: current_user.id, question_id: params[:question_id])

    if @answer.save
      if request.xhr?
        binding.pry
      erb :"questions/show"
      else
        erb :'answers/new'
      end
    else
      erb :'answers/new'
    end

end

#edit answer entry. 2 steps:

#1) get an answer form to edit
get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find(params[:id])
  erb :'/answers/edit'
end

#2) run the intel received from an answer edit form
put '/questions/:question_id/answers/:id/edit' do
   @answer = Answer.find_by(id: params[:answer][:id])
    @answer.assign_attributes(body: params[:answer][:body])
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
    else
      erb :'/answers/edit'
    end
end

#delete an answer
delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
   @answer = Answer.find_by(id: params[:id])
   @answer.destroy
   redirect "/questions/#{@question.id}"
end







