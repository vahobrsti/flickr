class SearchController < ApplicationController
  include FlickrGateway
  #caches_page :index
  before_action :authenticate_user!
  before_action :get_query, only: [:index]
  before_action :get_recent, only: [:index]

  def index
    unless @query.nil? || @query.empty?
      # connect to api and conduct search
      flickr_model = API.new 'c8fa5aa1fe4e498417bedeae59c47636', '2db20ef953404fdb'
      per_page = 5
      extras='url_t, url_l'
      page = params[:page] || 1

      @results = flickr_model.search_images @query, per_page, extras, page
      if @results
        @pages = @results.pages.to_i
        @total = @results.total.to_i
        if params[:page].nil?
          current_user.searches.create(phrase: params[:q])
        else
          # got error
          flash[:message]=flickr_model.error.message
        end
      end
    end
  end

  def get_recent
    @recent_searches = current_user.searches.last(10).reverse
  end

  def get_query
    @search = Search.new
    @query = params[:q]
  end
end
