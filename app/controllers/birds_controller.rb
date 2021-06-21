class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at] # is equal to render json: birds.to_json(except: [:created_at, :updated_at])
    # render json: birds, only: [:id, :name, :species]
    # render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id]) # is equal to render json: birds.to_json(only: [:id, :name, :species])
    if bird
       render json: bird, only: [:id, :name, :species]
      
      # render json: bird.slice(:id, :name, :species)
      # render json: {id: bird.id, name: bird.name, species: bird.species}
      # render json: {id: bird["id"], name: bird["name"], species: bird["species"]}
      # render json: bird
    else
      render json: {message: "Bird not found"}
    end
    
  end

end