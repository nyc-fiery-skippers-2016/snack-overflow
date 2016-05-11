get '/login' do
  @user = User.find_by(id: session[:user_id])
  erb :'/sessions/new'
end

post '/login' do
  if @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password]
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      redirect '/'
    end
  else
    redirect '/'
end

delete '/logout' do
  sessions.clear
  redirect '/'
end