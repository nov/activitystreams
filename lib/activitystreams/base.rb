module ActivityStreams
  class Base
    include AttrRequired, AttrOptional, Util

    def initialize(attributes = {}, &block)
      (required_attributes + optional_attributes).each do |_attr_|
        self.send :"#{_attr_}=", attributes[_attr_]
      end
      yield if block_given?
      validate_attributes!
    end

    def validate_attributes!
      attr_missing!
    end

    def as_json(options = {})
      (required_attributes + optional_attributes).inject({}) do |hash, _attr_|
        _value_ = self.send _attr_
        hash.merge!(
          _attr_ => case _value_
          when Symbol, Addressable::URI
            _value_.to_s
          when Time
            _value_.iso8601
          else
            _value_
          end
        )
      end
    end
  end
end