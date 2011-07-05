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
    end
  end
end
