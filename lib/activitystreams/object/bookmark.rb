module ActivityStreams
  class Object::Bookmark < Object
    attr_optional :target_url
    recommended_verbs :post, :favorite

    def validate_attributes!
      super
      to_iri :target_url
    end
  end
end