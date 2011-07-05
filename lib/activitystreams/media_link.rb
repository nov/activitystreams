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
        @url      = to_iri @url
        @duration = to_integer @duration
        @height   = to_integer @height
        @width    = to_integer @width
      end
    end
  end
end