require 'gossip'

class ApplicationController < Sinatra::Base
  #hérita de la clase Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    #enregistre un gossip en fonction de params
    redirect '/'
  end

  get '/gossips/:id/' do
  	erb :show, locals: {gossip: Gossip.find(params['id'])}
  end

  get '/gossips/:id/edit' do
  	erb :edit, locals: {gossip: Gossip.find(params['id'])}
  end

  post '/gossips/:id/edit/' do
    #modifie un gossip en fonction de params
    Gossip.update(params["modified_author"], params["modified_content"], params['id'])	
		redirect '/'
	end


end