require 'spec_helper'

describe ActivityStreams::MediaLink do
  let :required_attributes do
    {
      :url => 'http://example.com/images/icon.png'
    }
  end
  let :optional_attributes do
    {
      :duration => 100.0,
      :height   => '200',
      :width    => '300.0'
    }
  end

  context 'when missing attributes' do
    it do
      expect { ActivityStreams::MediaLink.new }.should raise_error AttrRequired::AttrMissing
    end
  end

  context 'otherwise' do
    subject { ActivityStreams::MediaLink.new required_attributes }
    its(:url) { should be_a Addressable::URI }

    context 'when optional attributes given' do
      subject { ActivityStreams::MediaLink.new required_attributes.merge(optional_attributes) }
      its(:duration) { should be_a Integer }
      its(:height)   { should be_a Integer }
      its(:width)    { should be_a Integer }
    end

    context 'otherwise' do
      its(:duration) { should be_nil }
      its(:height)   { should be_nil }
      its(:width)    { should be_nil }
    end
  end

  describe '#as_json' do
    let(:attributes) { required_attributes.merge(optional_attributes) }
    subject { ActivityStreams::MediaLink.new required_attributes.merge(optional_attributes) }
    its(:as_json) do
      should == {
        :url      => required_attributes[:url],
        :duration => optional_attributes[:duration].to_i,
        :height   => optional_attributes[:height].to_i,
        :width    => optional_attributes[:width].to_i
      }
    end
  end
end