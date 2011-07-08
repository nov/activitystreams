require 'spec_helper'

describe ActivityStreams::Object::Image do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:full_image => 'invalid'}
    end

    it do
      expect { ActivityStreams::Object::Image.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end