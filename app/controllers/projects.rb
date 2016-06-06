get '/projects' do
  @projects = Project.all.shuffle
  erb :'projects/explore'
end
