require 'spec_helper'

describe ActivityStreams::Verb::RSVPMaybe do
  its(:verb) { should == :'rsvp-maybe' }
  its(:as_json) { should == 'rsvp-maybe' }
end