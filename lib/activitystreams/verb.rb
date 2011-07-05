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
      to_iri :verb
    end

    def as_json(options = {})
      verb.to_s
    end
  end
end

Dir[File.dirname(__FILE__) + '/verb/*.rb'].each do |file| 
  require file
end