module ActivityStreams
  class Object::Product < Object
    attr_optional :full_image

    def validate_attributes!
      super
      validate_attribute! :full_image, MediaLink
    end
  end
end