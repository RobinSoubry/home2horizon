get '/projects' do
  @projects = Project.all.shuffle
  erb :'projects/explore', layout: :map_layout
end

get '/projects/new' do
  erb :'projects/new_project'
end

post '/projects' do
  @project = Project.new(params[:project])
  # Add default user
  @project.users << User.find(session[:user_id])

  # Set tags
  tags = params[:tags]
  @project.tags = tags.split(" ")

  # Set cover image url
  params[:coverphoto][:filename] = "hh_#{@project.project_name}".filename.split(" ").join("_")
  File.open(File.join(APP_ROOT, 'public', 'assets', 'projects' , params[:coverphoto][:filename]), "w") do |f|
    f.write(params[:coverphoto][:tempfile].read)
  end
  base_path = "/assets/projects"
  filename = params[:coverphoto][:filename]
  path = [base_path, filename]
  @project.cover_img_url = path.join('/')

  # Set project status
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
