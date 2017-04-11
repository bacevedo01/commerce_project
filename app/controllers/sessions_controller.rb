get '/sessions/new' do
	erb :'sessions/new'
end  

post '/sessions' do
 	@user = User.find_by(email: params[:user][:email])

	if @user && @user.authenticate(params[:user][:password])
		login
		redirect "/users/#{@user.id}"
	else 
		@errors = ["Invalid email	or password"]
		erb :'sessions/new'
	end 

end 


get '/sessions/logout' do
  logout
  redirect '/'
end