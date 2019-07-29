require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

# renvoie le ficher new_gossips à la page gossips/new
  get '/gossips/new/' do
    erb :new_gossips
  end

  #sauvegarde et affiche les gossips dans la page gossips/news et renvoie à l'index
  post '/gossips/new/' do 
    Gossip.new(params["author"], params["content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
   erb :id, locals: {nb_id: params['id']}
  end

  
end
