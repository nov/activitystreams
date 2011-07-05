module ActivityStreams
  class Verb < Base
    def verb
      if self.class.superclass == Verb
        self.class.name.split('::').last.underscore.dasherize.to_sym
      else
        :post
      end
    end

    def as_json(options = {})
      verb.to_s
    end
  end
end

Dir[File.dirname(__FILE__) + '/verb/*.rb'].each do |file| 
  require file
end