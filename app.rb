require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'



get '/pokemons' do
    @pokemons = Pokemon.all
    erb :'pokemons/index'
end

get '/pokemons/new' do
  erb :'pokemons/new'
end

get '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  erb :'pokemons/show'
end

post '/pokemons' do
 @pokemon = Pokemon.create(params[:pokemon])
  redirect ('/pokemons/' + @pokemon.id.to_s)
end
get 'pokemons/:id/edit' do
  @pokemons = Pokemon.find(params[:id])
  erb :'pokemons/edit'
end
post '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  @pokemons.update(params[:pokemon])
  redirect ('/pokemons/' + @pokemon.id.to_s)
end

get '/' do
  redirect 'pokemons'
end
