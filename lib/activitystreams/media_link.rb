module ActivityStreams
  class MediaLink < Base
    attr_required :url
    attr_optional(
      # MAY
      :duration,
      :height,
      :width
    )
  end
end