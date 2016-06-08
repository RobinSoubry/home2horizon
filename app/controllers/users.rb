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

    # Set cover image url
    filename = "hh_#{@user.username.split(" ").join("_")}"
    p '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
    params[:profilepic][:filename] = filename
    File.open(File.join(APP_ROOT, 'public', 'assets', 'users' , params[:profilepic][:filename]), "w") do |f|
      f.write(params[:profilepic][:tempfile].read)
    end
    base_path = "/assets/users"
    filename = params[:profilepic][:filename]
    path = [base_path, filename]
    @user.profile_pic_url = path.join('/')
    @user.save

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
  @projects = @projects.group_by {|project| project.status}
  @sponsored_requests = @user.project_requests.select { |request| request.status == 1 }
  @sponsoring_brands = @sponsored_requests.map(&:brand).uniq
  erb :'users/profile'
end

get '/users/:username' do
  @user = User.find_by(username: params[:username])
  @projects = Project.find(@user.projects.ids)
  @projects = @projects.group_by {|project| project.status}
  @sponsored_requests = @user.project_requests.select { |request| request.status == 1 }
  @sponsoring_brands = @sponsored_requests.map(&:brand).uniq
  erb :'users/profile'
end






