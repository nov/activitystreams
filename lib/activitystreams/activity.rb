module ActivityStreams
  class Activity < Base
    attr_required :actor, :verb, :published
    attr_optional(
      # SHOULD
      :id,
      :object,
      # MAY
      :target,
      :title,
      :content,
      :provider,
      :generator,
      :icon,
      :updated,
      :url
    )

    def initialize(attributes = {})
      super do
        @verb ||= Verb::Post.new
      end

      # TODO:
      # Validate class of each attributes.
      # ActiveModel might help, but make sure it works with Rails 2.3.

      # TODO: Force date-time attributes follow RFC3339
    end

    def as_json(options = {})
      {
        :actor  => actor,
        :verb   => verb,
        :object => object,
        :target => target
      }
    end
  end
end
