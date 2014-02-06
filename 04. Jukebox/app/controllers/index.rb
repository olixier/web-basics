get '/' do
  erb :index
end

get '/new' do
  erb :form
end

post '/' do
	Album.new(params[:album]).save
  erb :index
end

get '/:id' do 
  @album = Album.find(params[:index].to_i)
  erb :show
end
