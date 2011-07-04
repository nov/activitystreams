module ActivityStreams
  class Verb < Base
    attr_required :verb

    def initialize(attributes = {})
      super do
        @verb ||= :post
      end
    end

    def as_json(options = {})
      verb.to_s
    end
  end
end
