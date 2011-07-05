module ActivityStreams
  class Collection < Base
    attr_optional :total_count, :items, :url

    def validate_attributes!
      super
      if items.blank? && url.blank?
        raise AttrMissing.new('Either "items" or "url" is required')
      end
      to_iri :url
      validate_attribute! :items, item_class, :arrayed!
    end

    def item_class
      Object
    end
  end
end