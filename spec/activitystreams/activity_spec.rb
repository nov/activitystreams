require 'spec_helper'

describe ActivityStreams::Activity do
  let :required_attributes do
    {
      :actor => ActivityStreams::Object.new(:display_name => 'Nov Matake'),
      :published => Time.now
    }
  end
  let :optional_attributes do
    {
      :id => 'activitystrea.ms/activity/foo',
      :object => ActivityStreams::Object.new,
      :target => ActivityStreams::Object.new,
      :title => '<b>Title</b>',
      :content => '<b>Content</b>',
      :provider => ActivityStreams::Object.new,
      :generator => ActivityStreams::Object.new,
      :icon => ActivityStreams::MediaLink.new(:url => 'http://example.com/images/icon.png'),
      :updated => Time.now,
      :url => 'activitystrea.ms/activity/bar'
    }
  end
  let(:valid_attributes) { required_attributes.merge(optional_attributes) }

  context 'when missing attributes' do
    it do
      expect { ActivityStreams::Activity.new }.should raise_error AttrRequired::AttrMissing
    end
  end

  context 'otherwise' do
    it do
      expect { ActivityStreams::Activity.new required_attributes }.should_not raise_error AttrRequired::AttrMissing
    end
  end

  context 'when invalid attributes given' do
    it do
      expect do
        ActivityStreams::Activity.new valid_attributes.merge(:icon => 'http://example.com/images/icon.png')
      end.should raise_error ActivityStreams::InvalidAttribute
    end
  end

  context 'otherwise' do
    it do
      expect { ActivityStreams::Activity.new valid_attributes }.should_not raise_error AttrRequired::AttrMissing
    end
  end
end