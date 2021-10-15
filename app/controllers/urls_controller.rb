class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(id_param)
    redirect_to @url.long_url
  end

  def info
    @url = Url.find(id_param)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = @url.generate_short_url_token

    if @url.save!
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path
    end
  end

  private

  def id_param
    # Convert the base 36 string back to a base 10 integer so that ActiveRecord can find the record by its ID
    params[:id]&.to_i(36)
  end

  def url_params
    params.require(:url).permit(:long_url)
  end
end
