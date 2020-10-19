require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # get '/gossips/:id' do 
  #   "Voici le numéro du potin que tu veux :#{params['id']} !"
  #   erb :index, locals: {gossips: Gossip.find(params['id'])}
  # end

  get '/gossips/:id' do 
    erb :show, locals: {id: params['id'], gossip: Gossip.find(params['id']), id: params['id']}
  end

  get '/gossips/:id/edit' do 
    erb :edit, locals: {gossips: Gossip.all}
  end

  post '/gossips/:id/edit' do 
    Gossip.update(params["gossip_author"], params["gossip_content"], params["id"].to_i)
    redirect '/'
  end

end