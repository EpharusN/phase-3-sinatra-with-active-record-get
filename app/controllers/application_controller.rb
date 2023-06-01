class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/games' do
    games = Game.all.order(:title).limit(3)
    games.to_json
  end

  # use the :id syntax to create a dynamic route
  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(include: { reviews: { include: :user } })
  end
end
