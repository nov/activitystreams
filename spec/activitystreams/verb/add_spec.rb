require 'spec_helper'

describe ActivityStreams::Verb::Add do
  its(:verb) { should == :add }
  its(:as_json) { should == 'add' }
end