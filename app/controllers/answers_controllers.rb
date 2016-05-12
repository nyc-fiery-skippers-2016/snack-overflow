# see an answer
# get '/answers/:id' do
#   @answer = Answer.find_by(id: 1, user_id: 1, question_id: 5)
#   erb :'answers/show'
# end

#1) get a form to submit an answer
get '/answers/new' do
  erb :'answers/new'
end

#2) execute intel received from form
post '/answers/new' do
  if logged_in?
   @answer = Answer.new(body: params[:body], user_id: @current_user.id, question_id: "NO ID -- this needs to be a nested route, coming from a question route")
    if @answer.save
      redirect '/answers/#{@answer.id}'
    else
      erb :'answers/new'
    end
  else
    erb :'sessions/new'
  end
end

#edit answer entry. 2 steps:

#1) get an answer form to edit
get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'/answers/edit'
end

#2) run the intel received from an answer edit form
post '/answers/:id' do
  if logged_in?
   @answer = Answer.find_by(id: params[:id])
    @answer.assign_attributes(body: params[:body])
    if @answer.save
      redirect '/answers'
    else
      erb 'answers/edit'
    end
  else
    erb :'sessions/new'
  end
end

#delete an answer
delete 'answers/:id' do
   @answer = Answer.find_by(id: params[:id])
   @answer.destroy
   redirect :'/answers'
end







