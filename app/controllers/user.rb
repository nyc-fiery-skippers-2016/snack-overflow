#show page

get '/users/:id' do 
	@user = User.find_by(username: params[:username])
	erb :'users/show'
end 

