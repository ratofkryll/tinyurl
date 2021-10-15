class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    redirect_to @url.long_url
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

  def url_params
    params.require(:url).permit(:long_url)
  end
end
