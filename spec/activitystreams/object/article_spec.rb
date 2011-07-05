require 'spec_helper'

describe ActivityStreams::Object::Article do
  its(:type) { should == Addressable::URI.parse('article') }
end