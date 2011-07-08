require 'spec_helper'

describe ActivityStreams::Object::Audio do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:stream => 'invalid'}
    end

    it do
      expect { ActivityStreams::Object::Audio.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end