# hay dos tipos de acciones en una ruta: en grupo o en solitario

module Api
    module V1
        class AlbumController < ApplicationController
            def index
                artists = Album.where(artistum_id: params[:artistum_id]).order('created_at DESC');
                #albums = Artistum.join(:album)
                render json: {status: 'OK', message: 'Artists loaded', data: artists}, status: :OK
            end

            def show
                artist = Album.find(params[:id])
                render json: {status: 'OK', message: 'Artists loaded', data: artist}, status: :OK                
            end

            def create
                artist = Album.new(artist_params)

                if artist.save
                    render json: {status: 'OK', message: 'Artists loaded', data: artist}, status: :OK
                else
                    render json: {status: 'Error', message: 'Artists not loaded', data: artist}, status: :OK
                end
            end

            def destroy
                artist = Album.find(params[:id])
                artis.destroy
                render json: {status: 'OK', message: 'Artists deleted', data: artist}, status: :OK
            end     

            private 

            def artist_params
                params.permit(:nombre)
            end
        end
    end
end
