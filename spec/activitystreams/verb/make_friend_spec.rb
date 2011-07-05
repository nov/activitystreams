require 'spec_helper'

describe ActivityStreams::Verb::MakeFriend do
  its(:verb) { should == Addressable::URI.parse('make-friend') }
  its(:as_json) { should == 'make-friend' }
end