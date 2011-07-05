module ActivityStreams
  class MediaLink < Base
    attr_required :url
    attr_optional(
      # MAY
      :duration,
      :height,
      :width
    )

    def initialize(attributes = {})
      super do
        # TODO: validate format
      end
    end
  end
end