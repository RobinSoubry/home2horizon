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

