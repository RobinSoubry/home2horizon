get '/projects' do
  @projects = Project.all.shuffle
  erb :'projects/explore'
end

get '/projects/:id' do
  @project = Project.find(paramd[:id])
  erb :'projects/detail'
end
