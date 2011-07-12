require 'spec_helper'

describe 'Checkin a Place' do
  let(:verb) { ActivityStreams::Verb::Checkin.new }
  let(:published) { Time.now.utc }
  let :actor do
    ActivityStreams::Object::Person.new(
      :id => 'example.com/nov',
      :display_name => 'Nov Matake'
    )
  end
  let :object do
    ActivityStreams::Object::Place.new(
      :display_name => 'Starbacks Coffee Shibuya',
      :position => ActivityStreams::Object::Place::GeoLocation.new(
        :latitude => 35.0,
        :longitude => 140.0,
        :altitude => 100
      )
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
      'verb' => 'checkin',
      'published' => published.iso8601,
      'object' => {
        'objectType' => 'place',
        'displayName' => 'Starbacks Coffee Shibuya',
        'position' => '+35.0+140.0+100'
      }
    }
  end
end