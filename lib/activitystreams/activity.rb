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
        @id  = to_iri @id
        @url = to_iri @url
        @published = to_time @published
        @updated   = to_time @updated
      end
    end

    def validate_attributes!
      super
      [:actor, :object, :target, :provider, :generator].each do |_attr_|
        validate_attribute! _attr_, Object
      end
      validate_attribute! :verb, Verb
      validate_attribute! :icon, MediaLink
    end
  end
end
