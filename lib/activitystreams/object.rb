module ActivityStreams
  class Object < Base
    include ExtProperties

    attr_optional(
      # SHOULD
      :id,
      :downstream_duplicates,
      :upstream_duplicates,
      # MAY
      :attachments,
      :author,
      :content,
      :display_name,
      :image,
      :object_type,
      :published,
      :summary,
      :updated,
      :url
    )

    def initialize(attributes = {})
      _type_ = if self.class.superclass == Object
        self.class.name.demodulize.underscore
      end
      attributes = {:object_type => _type_}.merge(attributes)
      super attributes
    end

    def validate_attributes!
      super
      [:id, :object_type, :url].each do |_attr_|
        to_iri _attr_
      end
      [:published, :updated].each do |_attr_|
        to_time _attr_
      end
      validate_attribute! :author, Object
      validate_attribute! :image, MediaLink
      validate_attribute! :attachments, Object, :arrayed!
      [:downstream_duplicates, :upstream_duplicates].each do |_attr_|
        to_iri _attr_, :arrayed!
      end
      # TODO: display_name MUST NOT include HTML
    end

    def recommended_verbs
      self.class.recommended_verbs
    end

    def self.recommended_verbs(*verbs)
      @recommended_verbs ||= []
      @recommended_verbs += verbs
    end
  end
end

Dir[File.dirname(__FILE__) + '/object/*.rb'].each do |file| 
  require file
end