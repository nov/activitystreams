require 'spec_helper'

describe ActivityStreams::Verb do
  its(:verb) { should == Addressable::URI.parse('post') }
  its(:as_json) { should == 'post' }
end