module ActivityStreams
  class Object < Base
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
      :type,
      :published,
      :summary,
      :updated,
      :url
    )

    def initialize(attributes = {})
      _type_ = if self.class.superclass == Object
        self.class.name.demodulize.underscore
      end
      attributes = {:type => _type_}.merge(attributes)
      super attributes
    end

    def validate_attributes!
      super
      [:id, :type, :url].each do |_attr_|
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
  end
end

Dir[File.dirname(__FILE__) + '/object/*.rb'].each do |file| 
  require file
end