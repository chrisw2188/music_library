require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative 'models/artist'

get "/artists" do
#index
@artists = Artist.all
erb(:'artists/index')
end

get "/artists/new" do 
  #new
  erb (:'artists/new')
end

post "/artists" do 
  #create
  @artist = Artist.new(params)
  @artist.save
  erb(:'artists/create')
end

get "/artists/:id" do
  #show
  @artist = Artist.find(params[:id])
  erb(:'artists/show')
end 

get "/artists/:id/edit" do
  #edit
  @artist = Artist.find(params[:id])
  erb(:'artists/edit')
end

put "/artists/:id" do 
  #edit 
  @artist = Artist.update(params)
  redirect to ( "/artists/#{params[:id]}" )
end

delete '/artists/:id' do 
  #delete
  Artist.destroy(params[:id])
  redirect to ('/artists')
end

