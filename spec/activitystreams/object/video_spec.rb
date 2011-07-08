require 'spec_helper'

describe ActivityStreams::Object::Video do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:stream => 'invalid'}
    end

    it do
      expect { ActivityStreams::Object::Video.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end