require 'spec_helper'

describe ActivityStreams::Verb do
  its(:verb) { should == :post }
  its(:as_json) { should == 'post' }
end