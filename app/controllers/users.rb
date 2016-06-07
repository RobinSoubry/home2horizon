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

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/profile' do
  @user = User.find(session[:user_id])
  @projects = Project.find(@user.projects.ids)
  @sponsored_requests = @user.project_requests.select { |request| request.status == 1 }
  @sponsoring_brands = @sponsored_requests.map(&:brand).uniq!
  erb :'users/profile'
end
