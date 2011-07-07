module ActivityStreams
  module ExtProperties
    class Mood < Base
      attr_optional :display_name, :image
    end

    def self.included(klass)
      klass.attr_optional(
        :location,
        :mood,
        :rating,
        :source,
        :tags
      ) 
    end

    def validate_attributes!
      super
      validate_attribute! :location, Object::Place
      validate_attribute! :mood,     Mood
      validate_attribute! :rating,   Object::Review
      validate_attribute! :source,   Object
      validate_attribute! :tags,     Object, :arrayed!
    end
  end
end