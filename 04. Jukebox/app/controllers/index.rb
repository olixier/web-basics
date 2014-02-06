get '/' do
  erb :index
end

get '/new' do
  @album = Album.new
  @post_url = "/"
  erb :form
end

post '/' do
	Album.new(params[:album]).save
  erb :index
end

get '/:id' do 
  @album = Album.find(params[:id].to_i)
  erb :show
end

get '/:id/edit' do 
  @album = Album.find(params[:id].to_i)
  @post_url = "/#{params[:id]}"
  erb :form
end

post '/:id' do
	Album.find(params[:id].to_i).update(params[:album])
  erb :index
end

get '/:id/delete' do 
  Album.find(params[:id].to_i).delete
  erb :index
end