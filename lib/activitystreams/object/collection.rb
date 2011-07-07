module ActivityStreams
  class Object::Collection < Object
    attr_optional :object_types

    def validate_attributes!
      super
      validate_attribute! :object_types, Array
    end
  end
end