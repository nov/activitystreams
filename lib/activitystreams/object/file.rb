module ActivityStreams
  class Object::File < Object
    attr_optional :file_url, :mime_type

    def validate_attributes!
      super
      to_iri :file_url
    end
  end
end