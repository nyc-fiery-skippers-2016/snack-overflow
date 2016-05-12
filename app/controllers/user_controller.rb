get '/users' do
	@users = User.all
	erb :'users/index'
end

#make new user
get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect '/questions'
	else
		@errors = user.errors.full_messages
		erb :'users/new'
	end
end

#edit
get '/users/:id/edit' do
	@user = User.find_by(id: params[:id])
	erb :'users/edit'
end

put '/users/edit' do
	@user = User.find_by(id: params[:id])
	@user.assign_attributes(user: params[:user])

	if @user.save
		redirect "/users/#{user.id}"
	else
		erb :"/users/edit"
	end
end
#show page

get '/users/:id' do
	@user = User.find_by(id: params[:id])
	
	erb :'users/show'
end

#delete
delete '/users/:id' do
	@user = User.find_by(id: params[:id])
	@user.destroy

	redirect '/'
end


