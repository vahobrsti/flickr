class SearchController < ApplicationController
  include FlickrGateway
  #caches_page :index
  before_action :authenticate_user!
  def index
    @search = Search.new

    @query = params[:q]
    @page = params[:page]
    unless (@query.nil? || @query.empty?)
      # connect to api and conduct search
      flickr_model = API.new 'c8fa5aa1fe4e498417bedeae59c47636' , '2db20ef953404fdb'
      per_page = 5
      extras='url_t, url_z , url_l'
      page = @page || 1

      @results = flickr_model.search_images @query, per_page,extras, page
      unless @results
        #got error
        flash[:message]=flickr_model.error.message
      else
        @pages = @results.pages.to_i
        @total = @results.total.to_i
        current_user.searches.create(phrase: params[:q])
      end
    end
  end
end
