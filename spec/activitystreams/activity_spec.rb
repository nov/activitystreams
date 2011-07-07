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

  describe '#recommended_verb?' do
    let(:activity) do
      ActivityStreams::Activity.new valid_attributes.merge(
        :object => object,
        :verb => verb
      )
    end

    context 'when object is Bookmark' do
      let(:object) { ActivityStreams::Object::Bookmark.new }

      context 'when recommended verb used' do
        let(:verb) { ActivityStreams::Verb.new }
        it 'should not warn' do
          ActivityStreams.logger.should_not_receive(:warn)
          activity
        end
      end

      context 'otherwise' do
        let(:verb) { ActivityStreams::Verb::Add.new }
        it 'should warn' do
          ActivityStreams.logger.should_receive(:warn).with(
            "\"#{verb.to_s}\" is not recommended. \"#{object.recommended_verbs.collect(&:to_s).join('", "')}\" are recommended."
          )
          activity
        end
      end
    end
  end
end