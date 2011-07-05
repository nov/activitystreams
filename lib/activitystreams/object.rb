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
      super do
        # TODO:
      end
    end
  end
end
