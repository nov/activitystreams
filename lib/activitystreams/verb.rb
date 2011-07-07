module ActivityStreams
  class Verb < Base
    attr_required :verb

    def initialize
      _verb_ = if self.class.superclass == Verb
        self.class.name.demodulize.underscore.dasherize
      else
        'post'
      end
      super :verb => _verb_
    end

    def validate_attributes!
      super
      to_iri :verb
    end

    def to_s(options = {})
      verb.to_s
    end
    alias_method :as_json, :to_s
  end
end

Dir[File.dirname(__FILE__) + '/verb/*.rb'].each do |file| 
  require file
end