require 'spec_helper'

describe ActivityStreams::Object::File do
  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:file_url => 'http://'}
    end

    it do
      expect { ActivityStreams::Object::File.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end