get '/projects' do
  @projects = Project.all.shuffle
  erb :'projects/explore', layout: :map_layout
end

get '/projects/new' do
  erb :'projects/new_project'
end

post '/projects' do
  @project = Project.new(params[:project])
  @project.set_default_user(session[:user_id])
  @project.set_tags(params[:tags])

  filename = params[:coverphoto][:filename]
  tempfile = params[:coverphoto][:tempfile]
  @project.set_cover_img(filename, tempfile)
  @project.status = 1
  @project.save
  redirect "/projects/#{@project.id}"
end

get '/projects/:id' do
  @project = Project.find(params[:id])
  @members = User.find(@project.users.ids)
  erb :'projects/detail'
end

get '/locations' do
  if request.xhr?
    @projects = Project.all
    @locations = @projects.map(&:location)
    p @locations
    content_type :json
      { :locations => @locations }.to_json
  else
    redirect '/projects'
  end
end
