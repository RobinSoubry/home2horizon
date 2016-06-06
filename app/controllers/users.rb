post '/login' do
    @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/"
  else
    redirect '/fail'
  end
end

get '/register' do
  erb :'users/register'
end

def create
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
end

post '/users' do
  if create
      # After registration the user automatically gets access his views
    @user = User.find_by_email(params[:user][:email])
    session[:user_id] = @user.id
    redirect "/profile"
  else
    erb :'users/register'
  end
end

