require 'sinatra'
require 'sinatra/contib/all' if development?
require_relative 'models/album'

get "/albums" do
  @album = Album.all
  erb(:'albums/index')
end

get "albums/new" do
  erb(:'albums/new')
end 

post "/albums" do 
  @album = Album.new(params)
  @album.save
  erb(:'albums/create')
end

get "/albums/:id" do
 @album = Album.find(params[:id])
 erb(:'albums/show')
end

get "/albums/:id/edit" do 
  @album = Album.find(params[:id])
  erb(:'albums/edit')
end

put "/album/:id" do
  @album = Album.update(params)
  redirect to ("/albums/#{params[:id]}")
end

delete '/artists/:id' do
  Album.destroy(params[:id])
end