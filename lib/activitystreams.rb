require 'json'
require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'

module ActivityStreams
  class Base
    include AttrRequired, AttrOptional

    def initialize(attributes = {}, &block)
      (required_attributes + optional_attributes).each do |key|
        self.send :"#{key}=", attributes[:key]
      end
      yield if block_given?
      attr_missing!
    end
  end
end

require 'activitystreams/activity'
require 'activitystreams/object'
require 'activitystreams/verb'