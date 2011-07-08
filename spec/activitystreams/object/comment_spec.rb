require 'spec_helper'

describe ActivityStreams::Object::Comment do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:in_reply_to => ['object_a', 'object_b']}
    end

    it do
      expect { ActivityStreams::Object::Comment.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end