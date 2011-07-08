require 'spec_helper'

describe ActivityStreams::Object::Question do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:options => ['invalid']}
    end

    it do
      expect { ActivityStreams::Object::Question.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end