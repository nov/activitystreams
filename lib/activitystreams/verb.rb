module ActivityStreams
  class Verb < Base
    attr_required :verb

    def initialize(attributes = {})
      attributes[:verb] ||= :post
      super
    end

    def as_json(options = {})
      verb.to_s
    end
  end
end
