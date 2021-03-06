module ActivityStreams
  class Object::Question < Object
    attr_optional :options

    def validate_attributes!
      super
      validate_attribute! :options, Object, :arrayed!
    end
  end
end