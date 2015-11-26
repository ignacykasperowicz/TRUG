module Trug
  # This is our main layout context that we inject into view
  #
  # Methods available in this object will be available in the main layout
  class Page
    class Assets
      attr_reader :root

      def initialize(root)
        @root = root.join("public")
      end

      def stylesheets
        Dir[root.join("css/**/*.css")].map(&File.method(:basename))
      end

      def javascripts
        Dir[root.join("js/**/*.js")].map(&File.method(:basename))
      end
    end

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def assets
      Assets.new(config.root)
    end
  end
end