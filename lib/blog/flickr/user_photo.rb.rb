module Blog
  module Flickr
    class UserPhoto.rb
      def initialize(options)
        @options = options
      end

      FlickRaw.api_key = "8627c76514e186d5f6045d09b3635d00"
      FlickRaw.shared_secret = "eb3ca2422a8e8296"
      list   = flickr.people.getPublicPhotos(user_id: "8866790@N04")
      id     = list[0].id
      secret     = list[0].secret
      info = flickr.photos.getInfo :photo_id => id, :secret => secret
      FlickRaw.url_b(info)

      private

      attr_reader :options
    end
  end
end
