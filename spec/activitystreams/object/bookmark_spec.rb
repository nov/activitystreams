require 'spec_helper'

describe ActivityStreams::Object::Bookmark do
  its(:recommended_verbs) { should == [:post, :favorite] }

  context 'when invalid attributes given' do
    let(:invalid_attributes) do
      {:target_url => 'http://'}
    end

    it do
      expect { ActivityStreams::Object::Bookmark.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
    end
  end
end