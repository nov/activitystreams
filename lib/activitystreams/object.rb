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
  end
end
