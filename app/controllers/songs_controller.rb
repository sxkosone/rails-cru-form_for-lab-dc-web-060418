class SongsController < ApplicationController
    def index
        @songs = Song.all
        @genres = Genre.all
        @artists = Artist.all
    end

    def show
        @song = Song.find(params[:id])
        @artist = Artist.find(@song.artist_id)
        @genre = Genre.find(@song.genre_id)
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def update
        @song = Song.find(params[:id])
        @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
end
