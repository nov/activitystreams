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
      attributes[:verb] ||= Verb.new
      super
    end

    def validate_attributes!
      super
      [:id, :uri].each do |_attr_|
        to_iri _attr_
      end
      [:published, :updated].each do |_attr_|
        to_time _attr_
      end
      [:actor, :object, :target, :provider, :generator].each do |_attr_|
        validate_attribute! _attr_, Object
      end
      validate_attribute! :verb, Verb
      validate_attribute! :icon, MediaLink
    end
  end
end
