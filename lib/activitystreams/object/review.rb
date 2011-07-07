module ActivityStreams
  class Object::Review < Object
    attr_optional :_rating_

    def validate_attributes!
      super
      to_float :_rating_, :precision => 1, :range => 1.0..5.0
    end

    def as_json
      hash = super
      hash[:rating] = hash.delete(:_rating_)
    end
  end
end