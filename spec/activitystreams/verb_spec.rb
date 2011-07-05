require 'spec_helper'

describe ActivityStreams::Verb do
  context 'when missing attributes' do
    subject { ActivityStreams::Verb.new }
    its(:verb) { should == :post }
  end

  context 'otherwise' do
    subject { ActivityStreams::Verb.new(:verb => :my_verb) }
    its(:verb) { should == :my_verb }
  end

  describe '#as_json' do
    subject { ActivityStreams::Verb.new(:verb => :my_verb) }
    its(:as_json) { should == 'my_verb' }
  end
end