require 'spec_helper'

describe ActivityStreams::Object::Collection do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:object_types => 'bookmark,person'}
    end

    it do
      expect { ActivityStreams::Object::Collection.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end