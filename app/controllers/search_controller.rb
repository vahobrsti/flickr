class SearchController < ApplicationController
  include FlickrGateway
  caches_page :index
  before_action :authenticate_user!
  before_action :api_result, only: [:index]
  before_action :recent_searches, only: [:index]

  def index
    return unless @results
    @pages = @results.pages.to_i
    @total = @results.total.to_i
    if params[:page].nil?
      current_user.searches.create(phrase: params[:q])
    end
  end

  def recent_searches
    @recent_searches = current_user.searches.last(10).reverse
  end

  def api_result
    @search = Search.new
    @query = params[:q]
    return if @query.nil? || @query.empty?
      # connect to api and conduct search
      flickr_model = API.new 'c8fa5aa1fe4e498417bedeae59c47636', '2db20ef953404fdb'
      per_page = 5
      extras='url_t, url_l'
      page = params[:page] || 1
      @results = flickr_model.search_images @query, per_page, extras, page
      unless @results
        # got error
        flash[:message] = flickr_model.error.message
        false
      end
  end
end
