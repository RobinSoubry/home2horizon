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
  if params[:location] != nil
    @project.set_location(params[:location])
  end

  if params[:coverphoto] != nil
    filename = params[:coverphoto][:filename]
    tempfile = params[:coverphoto][:tempfile]
    @project.set_cover_img(filename, tempfile)
  else
    @project.cover_img_url = "/assets/projects/hh_default.jpg"
  end
  @project.status = 1
  @project.save
  p @project
  redirect "/projects/#{@project.id}"
end

get '/projects/:id' do
  @project = Project.find(params[:id])
  @members = User.find(@project.users.ids)
  @sponsored_requests = @project.requests { |request| request.status == 1 }
  @sponsoring_brands = @sponsored_requests.map(&:brand).uniq
  @open_requests = @project.requests { |request| request.status == 0 }
  @brands_open_requests = @open_requests.map(&:brand).uniq
  erb :'projects/detail'
end

get '/locations' do
  if request.xhr?
    @projects = Project.all
    @locations = @projects.map { |project| {lat: project.lat, lng: project.lng, title: project.project_name, id: project.id} }
    content_type :json
      { :projects => @locations }.to_json
  else
    redirect '/projects'
  end
end

get '/projects/:id/requests/new' do
  @project = Project.find(params[:id])
  @brands = Brand.all
  @brands_requests = @brands.map { |brand| {id: brand.id, name: brand.brand_name, requests: brand.requests.find_by_project_id(@project.id) } }
  p @brands_requests
  erb :'requests/new'
end
