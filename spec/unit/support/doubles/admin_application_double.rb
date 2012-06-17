module Admin
  class ApplicationController
    def self.before_filter *args
      @@before_filter = args
    end

    def self.before_filter_collection
      @@before_filter
    end

    def redirect_to(*args); end
    def render(*args); end
    def params; {}; end
  end
end
