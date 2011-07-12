require 'spec_helper'

describe 'Stream Serialization' do
  let(:published) { Time.now.utc }
  let :actor do
    ActivityStreams::Object::Person.new(
      :id => 'example.com/nov',
      :display_name => 'Nov Matake'
    )
  end
  let :stream do
    ActivityStreams::Stream.new(
      :items => [
        ActivityStreams::Activity.new(
          :actor => actor,
          :object => ActivityStreams::Object::Bookmark.new(
            :url => 'http://bookmark.example.com/links/12345',
            :target_url => 'http://example.com/articles/12345'
          ),
          :verb => ActivityStreams::Verb::Post.new,
          :published => published
        ),
        ActivityStreams::Activity.new(
          :actor => actor,
          :object => ActivityStreams::Object::Place.new(
            :display_name => 'Starbacks Coffee Shibuya',
            :position => ActivityStreams::Object::Place::GeoLocation.new(
              :latitude => 35.0,
              :longitude => 140.0,
              :altitude => 100
            )
          ),
          :verb => ActivityStreams::Verb::Checkin.new,
          :published => published
        )
      ],
      :url => 'http://example.com/nov/stream',
      :total_count => 10
    )
  end

  it 'should be well formatted' do
    JSON.parse(stream.to_json).should == {
      'items' => [{
        'actor' => {
          'id' => 'example.com/nov',
          'displayName' => 'Nov Matake',
          'objectType' => 'person'
        },
        'verb' => 'post',
        'published' => published.iso8601,
        'object' => {
          'objectType' => 'bookmark',
          'url' => 'http://bookmark.example.com/links/12345',
          'targetUrl' => 'http://example.com/articles/12345'
        }
      }, {
        'actor' => {
          'id' => 'example.com/nov',
          'displayName' => 'Nov Matake',
          'objectType' => 'person'
        },
        'verb' => 'checkin',
        'published' => published.iso8601,
        'object' => {
          'displayName' => 'Starbacks Coffee Shibuya',
          'objectType' => 'place',
          'position' => '+35.0+140.0+100'
        }
      }],
      'totalCount' => 10,
      'url' => 'http://example.com/nov/stream'
    }
  end
end