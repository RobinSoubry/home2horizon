get '/contribute' do
  erb :'/contribute'
end

get '/brands/new' do
  erb :'/new_brand'
end

post 'brands' do
  @brand = Brand.new(params[])
end