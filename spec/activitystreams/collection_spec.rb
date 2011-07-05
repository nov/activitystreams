require 'spec_helper'

describe ActivityStreams::Collection do
  let(:collection) { ActivityStreams::Collection.new(:items => items) }

  context 'when array of Activity given' do
    let :items do
      [
        ActivityStreams::Activity.new(
          :actor => ActivityStreams::Object.new(:display_name => 'Nov'),
          :published => Time.now
        )
      ]
    end

    it do
      expect { collection }.should raise_error(
        ActivityStreams::InvalidAttribute,
        'items should be an array of ActivityStreams::Object'
      )
    end
  end

  context 'when array of Object given' do
    let :items do
      [
        ActivityStreams::Object.new
      ]
    end

    it do
      expect { collection }.should_not raise_error
    end
  end

  context 'when missing both items and url' do
    it do
      expect { ActivityStreams::Collection.new }.should raise_error(
        AttrRequired::AttrMissing,
        'Either "items" or "url" is required'
      )
    end
  end
end