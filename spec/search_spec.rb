require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  context "GET new" do

    it "assigns a blank api key and secret to Flickr" do
      get :index
    end

  end


end
