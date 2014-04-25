module Qwubble
  module Searches
    class GoogleImageSearch

      def self.grab_random_image_url(query)
        search = new(query)
        result = search.execute
        result["responseData"]["results"][0]["url"]
      end

      def initialize(query)
        @query = query
      end

      def execute
        request = EM::HttpRequest.new(url).get
        MultiJson.load(request.response)
      end

      private

      def url
        URI.escape(
          "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{@query}")
      end
    end
  end
end