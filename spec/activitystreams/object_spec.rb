require 'spec_helper'

describe ActivityStreams::Object do
  let :valid_attributes do
    {
      :id => 'activitystrea.ms/activity/foo',
      :url => 'activitystrea.ms/activity/bar',
      :type => 'activitystrea.ms/activity/custom',
      :downstream_duplicates => [
        'activitystrea.ms/activity/123',
        'activitystrea.ms/activity/234'
      ],
      :upstream_duplicates => [
        'activitystrea.ms/activity/987',
        'activitystrea.ms/activity/876'
      ],
      :attachments => [
        ActivityStreams::Object.new
      ],
      :author => ActivityStreams::Object.new(:display_name => 'Nov Matake'),
      :content => '<b>NOTE:</b> Foo bar',
      :display_name => 'Nov',
      :image => ActivityStreams::MediaLink.new(:url => 'http://example.com/images/icon.png'),
      :published => Time.now,
      :summary => '<b>NOTE:</b> Foo bar',
      :updated => Time.now
    }
  end

  it 'should not any attributes' do
    expect { ActivityStreams::Object.new }.should_not raise_error AttrRequired::AttrMissing
  end

  context 'when invalid attributes given' do
    it do
      expect do
        ActivityStreams::Object.new valid_attributes.merge(:image => 'http://example.com/images/icon.png')
      end.should raise_error ActivityStreams::InvalidAttribute
    end
  end

  context 'otherwise' do
    it do
      expect { ActivityStreams::Object.new valid_attributes }.should_not raise_error AttrRequired::AttrMissing
    end
  end
end