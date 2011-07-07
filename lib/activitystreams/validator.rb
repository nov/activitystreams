module ActivityStreams
  module Validator
    def validate_attribute!(attribute, klass, arrayed = false)
      _value_ = self.send attribute
      return if _value_.blank?
      if arrayed
        _value_.all? do |_v_|
          _v_.is_a?(klass)
        end or
        raise InvalidAttribute.new("#{attribute} should be an array of #{klass}")
      else
        _value_.is_a?(klass) or
        raise InvalidAttribute.new("#{attribute} should be a #{klass}")
      end
    end

    def to_iri(attribute, arrayed = false)
      _value_ = self.send attribute
      _value_ = if arrayed
        Array(_value_).collect do |_v_|
          Addressable::URI.parse(_v_)
        end
      else
        Addressable::URI.parse(_value_)
      end
      self.send :"#{attribute}=", _value_
    rescue Addressable::URI::InvalidURIError => e
      message = if arrayed
        "#{attribute} should be an array of valid IRI"
      else
        "#{attribute} should be a valid IRI"
      end
      raise InvalidAttribute.new(message)
    end

    def to_time(attribute)
      _value_ = self.send attribute
      _value_ = case _value_
      when String
        Time.parse _value_, :raise_me
      else
        _value_
      end
      self.send :"#{attribute}=", _value_
    rescue ArgumentError, NoMethodError => e
      raise InvalidAttribute.new("#{attribute} should be a valid date-time")
    end

    def to_integer(attribute)
      _value_ = self.send attribute
      self.send :"#{attribute}=", _value_.try(:to_i)
    end

    def to_float(attribute, options = {})
      _value_ = self.send attribute
      return unless _value_
      _value_ = BigDecimal.new(_value_.to_s).round(options[:precision]) if options[:precision]
      if options[:range] && !options[:range].include?(_value_)
        raise InvalidAttribute.new("#{attribute} should be within #{options[:range]}")
      end
      self.send :"#{attribute}=", _value_.to_f
    end
  end
end