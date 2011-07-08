require 'spec_helper'

describe ActivityStreams::Object::Review do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:_rating_ => 0}
    end

    it do
      expect { ActivityStreams::Object::Review.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end

  describe '#rating' do
    subject { ActivityStreams::Object::Review.new(:_rating_ => rate) }
    context 'when integer' do
      let(:rate) { 3 }
      its(:_rating_) { should be_a Float }
    end

    context 'when float' do
      let(:rate) { 1.36 }
      its(:_rating_) { should == rate.round(1) }
    end
  end

  describe '#as_json' do
    subject { ActivityStreams::Object::Review.new(:_rating_ => 1).as_json }
    its(:keys) { should include :rating }
    its(:keys) { should_not include :_rating_ }
  end
end