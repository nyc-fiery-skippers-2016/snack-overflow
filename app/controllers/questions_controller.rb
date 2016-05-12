
# index

get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all

  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(title: params[:title], body: params[:body], user_id: current_user.id)


  if @question.save
    redirect '/questions'

  else
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])

  @comments = @question.comments

  erb :'questions/show'

end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end


# vote routes

post '/questions/:id/_vote' do
  question = Question.find_by(id: params[:id])

  if params[:up_vote]
  question.votes.create(value: 1, user_id: current_user.id, votable_id: params[:votable_id], votable_type: params[:votable_type])
    if request.xhr?
      content_type :json
      question.votes.sum(:value).to_json
    else
      redirect "/questions"
    end
  else
    question.votes.create(value: -1, user_id: current_user.id, votable_id: params[:votable_id], votable_type: params[:votable_type])
     if request.xhr?
      content_type :json
      question.votes.sum(:value).to_json
    else
      redirect "/questions"
    end
  end
  redirect "/questions/#{question.id}"
end


# edit

put '/questions/:id' do
  @question = Question.find(params[:id])

  @question.assign_attributes(params[:question])

  if @question.save

    redirect '/questions'

  else
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])


  @question.destroy

  redirect '/questions'

end

