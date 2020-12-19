class UrlsController < ApplicationController
    def new
        @url = Url.new
    end
    def create        
        @url = Url.new(url_params)

        if @url.save
        redirect_to urls_path
        else
            flash[:error] = @url.errors.full_messages_for(:original)
            redirect_to new_url_path
        end
    end
    def index
        @urls = Url.all
    end

    def edit
        @url = Url.find(params[:id])
    end
    def update
        @url = Url.find(params[:id])

        if @url.save
            flash[:error] = "A new short-url was created for #{@url.original}"
            redirect_to urls_path
        else
            flash[:error] = @url.errors.full_messages_for(:original)
            redirect_to edit_url_path
        end
    end

    private
    def url_params
      params.require(:url).permit(:original)
    end
  end