class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # with Rails magic:
    render json: birds, except: [:created_at, :updated_at]
    # without:
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end
end