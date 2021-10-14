class UrlsController < ApplicationController
  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
