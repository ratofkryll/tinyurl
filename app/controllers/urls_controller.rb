class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(id_param)
    # Create a visit on click, adding the request's IP address
    @url.visits.create!(ip_address: request.remote_ip)
    redirect_to @url.long_url
  end

  def info
    @url = Url.find(id_param)
  end

  def new
    @url = Url.new
  end

  def create
    # Using find_or_create_by here upserts the record - creates or updates it, depending on whether or not it already exists. Create_with tells Rails what to use to create a new record if one does not exist.
    @url = Url.create_with(url_params).find_or_create_by(long_url: url_params[:long_url])

    if @url.save!
      redirect_to [:info, @url]
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
