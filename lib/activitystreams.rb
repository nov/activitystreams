require 'json'
require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'
require 'addressable/uri'

module ActivityStreams
  def self.logger
    @@logger
  end
  def self.logger=(logger)
    @@logger = logger
  end
  @@logger = Logger.new(STDERR)
  @@logger.progname = 'ActivityStreams'
end

require 'activitystreams/validator'
require 'activitystreams/exception'
require 'activitystreams/base'
require 'activitystreams/collection'
require 'activitystreams/stream'
require 'activitystreams/ext_properties'
require 'activitystreams/activity'
require 'activitystreams/object'
require 'activitystreams/verb'
require 'activitystreams/media_link'