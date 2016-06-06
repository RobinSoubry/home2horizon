get '/contribute' do
  erb :'/brands/contribute'
end

get '/brands/new' do
  erb :'brands/new_brand'
end

post 'brands' do
  @brand = Brand.new(params[])
end