require 'rails_helper'
include FlickrGateway

RSpec.describe SearchController, type: :controller do

  describe 'GET #index' do
    context 'search page' do

      it 'blocks unauthenticated access' do
        sign_in ''
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'allows authenticated access' do
        @user = FactoryGirl.create(:user)
        sign_in @user
        get :index
        expect(response).to be_success
      end

      it 'sends query with invalid API key' do
        get :index, params: {q: 'TEST API'}
        flickr_model=API.new '', ''
        per_page = 5
        extras='url_t, url_l'
        page = controller.params[:page] || 1
        results = flickr_model.search_images controller.params[:q], per_page, extras, page
        expect(results).to be false
      end

    end
  end

end