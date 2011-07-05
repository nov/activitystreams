module ActivityStreams
  class Collection < Base
    attr_optional :total_count, :items, :url

    def initialize(attributes = {})
      super do
        @url = to_iri @url
      end
    end

    def validate_attributes!
      super
      if items.blank? && url.blank?
        raise AttrMissing.new('Either "items" or "url" is required')
      end
    end
  end
end