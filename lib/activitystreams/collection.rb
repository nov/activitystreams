module ActivityStreams
  class Collection < Base
    attr_optional :total_count, :items, :url

    def validate_attributes!
      super
      if items.blank? && url.blank?
        raise AttrMissing.new('Either "items" or "url" is required')
      end
      to_iri :url
      validate_attribute! :items, Object, :arrayed!
    end
  end
end