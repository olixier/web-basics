get '/' do
  erb :index
end

get '/new' do
  erb :form
end

post '/' do
  
  hash = {}
	params[:album].each_pair do |k, v|
  	hash[k.to_sym] = v
  	hash.delete(k)
	end
	Album.new(hash).save

  erb :index
end

get '/:id' do 
  @album = Album.find(params[:index].to_i)
  erb :show
end
