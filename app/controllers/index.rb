get '/' do
  @featured_projects = Project.limit(3).order("RANDOM()")
  erb :index
end
