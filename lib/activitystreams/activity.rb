module ActivityStreams
  class Activity < Base
    include ExtProperties

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
      [:id, :url].each do |_attr_|
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
      unless recommended_verb?
        ActivityStreams.logger.warn "\"#{verb.to_s}\" is not recommended. \"#{recommended_verbs.join('", "')}\" are recommended."
      end
    end

    def recommended_verb?
      recommended_verbs.blank? ||
      recommended_verbs.include?(verb.to_s)
    end

    def recommended_verbs
      (object.try(:recommended_verbs) || []).collect(&:to_s)
    end
  end
end
