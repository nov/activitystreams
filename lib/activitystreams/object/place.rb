module ActivityStreams
  class Object::Place < Object
    attr_optional :position, :address

    class GeoLocation < Base
      attr_required :latitude, :longitude
      attr_optional :altitude

      def to_s
        "+" + [latitude, longitude, altitude].compact.join('+')
      end
      alias_method :as_json, :to_s
    end

    class Address < Base
      attr_optional :formatted, :street_address, :locality, :region, :postal_code, :country
    end

    def validate_attributes!
      super
      validate_attribute! :position, GeoLocation
      validate_attribute! :address,  Address
    end
  end
end