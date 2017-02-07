# this module and this class is used for handling gateway requests
module FlickrGateway
  class API
    require 'flickraw-cached'

    attr_reader :api_key, :secret, :error

    def initialize(api_key, secret)
      @api_key = api_key
      @secret = secret
    end

    def search_images(text, per_page, extras, page)
      FlickRaw.api_key = @api_key
      FlickRaw.shared_secret = @secret
      begin
        flickr.photos.search text: text, per_page: per_page, extras: extras, page: page
      rescue => error
        @error=error
        false
      end
    end
  end
end