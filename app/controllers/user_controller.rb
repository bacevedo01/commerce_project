get '/users/new' do
	erb :'users/new'
end  

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login
    redirect "/users/show"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

get '/users/:id' do
		@user = current_user
		@user_channels = @user.channels
		erb :'users/show'
end