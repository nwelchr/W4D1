class ArtworksController < ApplicationController

  def index
    # debugger
    owned_artworks = User.find(params[:user_id]).artworks
    shared_artworks = User.find(params[:user_id]).shared_artworks
    artworks = owned_artworks + shared_artworks
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    #your code here...
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end


  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
