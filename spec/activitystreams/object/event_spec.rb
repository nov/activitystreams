require 'spec_helper'

describe ActivityStreams::Object::Event do
  context 'when invalid attributes given' do
    [:attending, :maybe_attending, :not_attending, :start_time, :end_time].each do |_attr_|
      context "when #{_attr_} is invalid" do
        let(:invalid_attributes) do
          {_attr_ => 'invalid'}
        end

        it do
          expect { ActivityStreams::Object::Event.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
        end
      end
    end
  end
end