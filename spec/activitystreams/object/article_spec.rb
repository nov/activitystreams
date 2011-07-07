require 'spec_helper'

describe ActivityStreams::Object::Article do
  its(:object_type) { should == Addressable::URI.parse('article') }
  its(:recommended_verbs) { should == [] }
end