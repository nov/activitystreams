require 'spec_helper'

describe 'Post a Bookmark' do
  let(:verb) { ActivityStreams::Verb::Post.new }
  let(:published) { Time.now.utc }
  let :actor do
    ActivityStreams::Object::Person.new(
      :id => 'example.com/nov',
      :display_name => 'Nov Matake'
    )
  end
  let :object do
    ActivityStreams::Object::Bookmark.new(
      :target_url => 'http://bookmark.example.com/links/12345'
    )
  end
  let :activity do
    ActivityStreams::Activity.new(
      :actor  => actor,
      :object => object,
      :verb   => verb,
      :published => published
    )
  end

  it 'should be well formatted' do
    JSON.parse(activity.to_json).should == {
      'actor' => {
        'id' => 'example.com/nov',
        'displayName' => 'Nov Matake',
        'objectType' => 'person'
      },
      'verb' => 'post',
      'published' => published.iso8601,
      'object' => {
        'objectType' => 'bookmark',
        'targetUrl' => 'http://bookmark.example.com/links/12345'
      }
    }
  end
end