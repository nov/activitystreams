module ActivityStreams
  class Object::Video < Object
    attr_optional :embed_code, :stream

    def validate_attributes!
      super
      validate_attribute! :stream, MediaLink
    end
  end
end