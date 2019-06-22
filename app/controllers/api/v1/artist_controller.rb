module Api
    module V1
        class ArtistController < ApplicationController
            def index
                artists = Artist.order('created_at DESC');
                render json: {status: 'OK', message: 'Artists loaded', data: artists}, status: :OK
            end

            def show
                artist = Artist.find(params[:id])
                render json: {status: 'OK', message: 'Artists loaded', data: artist}, status: :OK                
            end

            def create
                artist = Artist.new(artist_params)

                if artist.save
                    render json: {status: 'OK', message: 'Artists loaded', data: artist}, status: :OK
                else
                    render json: {status: 'Error', message: 'Artists not loaded', data: artist}, status: :unprocessable_entity
                end
            end

            def destroy
                artist = Artist.find(params[:id])
                artis.destroy
                render json: {status: 'OK', message: 'Artists deleted', data: artist}, status: :OK
            end     

			def update
				artist = Artist.find(params[:id])
				if artist.update_attibutes(article_params)
					render json: {status: 'OK', message: 'Artist updated', data: artist}, status: :OK
				else
                    render json: {status: 'Error', message: 'Artists not loaded', data: artist}, status: :unprocessable_entity
				end
			end
			
            private 

            def artist_params
                params.permit(:nombre)
            end
        end
    end
end
