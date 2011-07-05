module ActivityStreams
  module Util
    def validate_attribute!(attribute, klass)
      _value_ = self.send attribute
      _value_.blank? or
      _value_.is_a?(klass) or
      raise InvalidAttribute.new("#{attribute} should be a #{klass}")
    end

    def to_iri(input)
      Addressable::URI.parse input
    rescue Addressable::URI::InvalidURIError => e
      raise InvalidAttribute.new(e.message)
    end

    def to_time(input)
      case input
      when String
        Time.parse input, :raise_me
      else
        input
      end
    rescue ArgumentError, NoMethodError => e
      raise InvalidAttribute.new(e.message)
    end

    def to_integer(input)
      input.try(:to_i)
    end
  end
end