require 'spec_helper'

describe ActivityStreams::Object::Place do
  context 'when invalid attributes given' do
    [:position, :address].each do |_attr_|
      context "when #{_attr_} is invalid" do
        let(:invalid_attributes) do
          {_attr_ => 'invalid'}
        end

        it do
          expect { ActivityStreams::Object::Place.new invalid_attributes }.should raise_error ActivityStreams::InvalidAttribute
        end
      end
    end
  end

  describe ActivityStreams::Object::Place::GeoLocation do
    context 'when missing attributes' do
      it do
        expect { ActivityStreams::Object::Place::GeoLocation.new }.should raise_error AttrRequired::AttrMissing
      end
    end

    describe '#as_json' do
      let(:latitude)  { 35.0  }
      let(:longitude) { 140.0 }
      let(:altitude)  { 100   }
      subject { ActivityStreams::Object::Place::GeoLocation.new attributes }
      context 'when altitude given' do
        let(:attributes) do
          {
            :latitude  => latitude,
            :longitude => longitude
          }
        end
        its(:as_json) { should == "+#{latitude}+#{longitude}" }
      end

      context 'otherwise' do
        let(:attributes) do
          {
            :latitude  => latitude,
            :longitude => longitude,
            :altitude  => altitude
          }
        end
        its(:as_json) { should == "+#{latitude}+#{longitude}+#{altitude}" }
      end
    end
  end
end