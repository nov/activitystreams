require 'spec_helper'

describe ActivityStreams::Base do
  class SubClass < ActivityStreams::Base
    attr_required :required
    attr_optional :optional
  end

  context 'when missing attributes' do
    it do
      expect { SubClass.new }.should raise_error AttrRequired::AttrMissing
    end
  end

  context 'otherwise' do
    it 'should setup attributes' do
      obj = SubClass.new(
        :required => 'REQ',
        :optional => 'OPT'
      )
      obj.required.should == 'REQ'
      obj.optional.should == 'OPT'
    end
  end

  describe '#as_json' do
    let(:time) { Time.parse('1981-12-13') }
    let(:iri)  { Addressable::URI.parse('activitystrea.ms') }
    subject do
      SubClass.new(
        :required => time,
        :optional => iri
      ).as_json
    end
    it do
      should == {
        :required => time.iso8601,
        :optional => iri.to_s
      }
    end
  end
end