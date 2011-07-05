module ActivityStreams
  class Collection < Base
    attr_optional :total_count, :items, :url

    def initialize(attributes = {})
      super do
        # TODO:
      end
    end
  end
end