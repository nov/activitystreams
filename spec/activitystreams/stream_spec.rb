require 'spec_helper'

describe ActivityStreams::Stream do
  let(:stream) { ActivityStreams::Stream.new(:items => items) }

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
      expect { stream }.should_not raise_error
    end
  end

  context 'when array of Object given' do
    let :items do
      [
        ActivityStreams::Object.new
      ]
    end

    it do
      expect { stream }.should raise_error(
        ActivityStreams::InvalidAttribute,
        'items should be an array of ActivityStreams::Activity'
      )
    end
  end
end