module ActivityStreams
  class Object::Event < Object
    attr_optional :attending, :maybe_attending, :not_attending, :start_time, :end_time

    def validate_attributes!
      super
      [:attending, :maybe_attending, :not_attending].each do |_attr_|
        validate_attribute! _attr_, Object::Collection
      end
      [:start_time, :end_time].each do |_attr_|
        to_time _attr_
      end
    end
  end
end