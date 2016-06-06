get '/projects' do
  @projects = Project.all.shuffle
  erb :'projects/explore'
end

get '/projects/new' do
  erb :'projects/new_project'
end

post '/projects' do
  @project = Project.new(params[:project])
  @project.users << User.find(session[:user_id])
  tags = params[:tags]
  @project.tags = tags.split(" ")
  @project.save
  redirect "/projects/#{@project.id}"
end

get '/projects/:id' do
  @project = Project.find(params[:id])
  @members = User.find(@project.users.ids)
  erb :'projects/detail'
end
