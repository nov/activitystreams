module ActivityStreams
  class Object::Comment < Object
    attr_optional :in_reply_to

    def validate_attributes!
      super
      validate_attribute! :in_reply_to, Object, :arrayed!
    end
  end
end