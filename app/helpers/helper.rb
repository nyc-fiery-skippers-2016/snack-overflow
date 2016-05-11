helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def loggedin?
    !!current_user
  end

end