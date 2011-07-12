require 'spec_helper'

# NOTE:
#  I'm not sure this is proper object type usage,
#  but the official document uses 'blog' as a object type in 'Example Activities' Section (3.1).
#  ref) http://activitystrea.ms/specs/json/1.0/

describe 'Post an Article on a Blog' do
  let(:verb) { ActivityStreams::Verb::Post.new }
  let(:published) { Time.now.utc }
  let :actor do
    ActivityStreams::Object::Person.new(
      :id => 'tag:example.org,2011:martin',
      :display_name => 'Nov Matake',
      :url => 'http://example.org/martin',
      :image => ActivityStreams::MediaLink.new(
        :url => 'http://example.org/martin/image',
        :width => 250,
        :height => 250
      )
    )
  end
  let :object do
    ActivityStreams::Object.new(
      :id => 'tag:example.org,2011:abc123/xyz',
      :url => 'http://example.org/blog/2011/02/entry'
    )
  end
  let :target do
    ActivityStreams::Object.new(
      :object_type => 'blog',
      :id => 'tag:example.org,2011:abc123',
      :display_name => 'Martin\'s Blog',
      :url => 'http://blog.example.com'
    )
  end
  let :activity do
    ActivityStreams::Activity.new(
      :actor  => actor,
      :object => object,
      :target => target,
      :verb   => verb,
      :published => published
    )
  end

  it 'should be well formatted' do
    JSON.parse(activity.to_json).should == {
      'published' => published.iso8601,
      'actor' => {
        'url' => 'http://example.org/martin',
        'objectType' => 'person',
        'id' => 'tag:example.org,2011:martin',
        'image' => {
          'url' => 'http://example.org/martin/image',
          'width' => 250,
          'height' => 250
        },
        'displayName' => 'Nov Matake'
      },
      'verb' => 'post',
      'object' => {
        'url' => 'http://example.org/blog/2011/02/entry',
        'id' => 'tag:example.org,2011:abc123/xyz'
      },
      'target' => {
        'url' => 'http://blog.example.com',
        'objectType' => 'blog',
        'id' => 'tag:example.org,2011:abc123',
        'displayName' => 'Martin\'s Blog'
      }
    }
  end
end