module ActivityStreams
  class MediaLink < Base
    attr_required :url
    attr_optional(
      # MAY
      :duration,
      :height,
      :width
    )

    def validate_attributes!
      super
      to_iri :url
      [:duration, :height, :width].each do |_attr_|
        to_integer _attr_
      end
    end
  end
end