get '/' do
  erb :index
end

get '/new' do
  erb :form
end

post '/' do
  # Create a new album and add it to the $albums array 
  # You should use only one parameter of the params hash named :album
  # You should use only Album#new and Album#save
  erb :index
end

get '/:id' do 
  # Find the album with index :id and transmit it to the show view
  erb :show
end
