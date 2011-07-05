require 'spec_helper'

describe ActivityStreams::Validator do
  class Foo
    include ActivityStreams::Validator
    attr_accessor :foo

    def initialize(foo = nil)
      @foo = foo
    end
  end

  describe '#validate_attribute!' do
    context 'when blank' do
      it do
        expect do
          Foo.new.validate_attribute!(:foo, String)
          Foo.new('').validate_attribute! :foo, String
          Foo.new([]).validate_attribute! :foo, String
        end.should_not raise_error
      end
    end

    context 'when valid' do
      it do
        expect { Foo.new(Time.now).validate_attribute! :foo, Time }.should_not raise_error
      end
    end

    context 'when invalid' do
      it do
        expect { Foo.new('foo').validate_attribute! :foo, Time }.should raise_error(
          ActivityStreams::InvalidAttribute,
          'foo should be a Time'
        )
      end
    end

    context 'when arrayed' do
      context 'when valid' do
        it do
          expect { Foo.new([Time.now]).validate_attribute! :foo, Time, :arrayed }.should_not raise_error
        end
      end

      context 'when invalid' do
        it do
          expect { Foo.new(['foo']).validate_attribute! :foo, Time, :arrayed }.should raise_error(
            ActivityStreams::InvalidAttribute,
            'foo should be an array of Time'
          )
        end
      end
    end
  end

  describe '#to_iri' do
    let(:foo) { Foo.new(iri) }
    let(:to_iri) { foo.to_iri :foo }
    subject { to_iri }

    context 'when nil' do
      let(:iri) { nil }
      it { should be_nil }
    end

    context 'when valid' do
      let(:iri) { 'activitystrea.ms,2011/foo' }
      it { should be_a Addressable::URI }
    end

    context 'when invalid' do
      let(:iri) { 'http:' }
      it do
        expect { to_iri }.should raise_error(
          ActivityStreams::InvalidAttribute,
          'foo should be a valid IRI'
        )
      end
    end

    context 'when arrayed' do
      let(:to_iri) { foo.to_iri :foo, :arrayed! }

      context 'when valid' do
        let(:iri) { ['activitystrea.ms,2011/foo'] }
        it { should be_a Array }
        it 'should be an array of Addressable::URI' do
          to_iri.each do |iri|
            iri.should be_a Addressable::URI
          end
        end
      end

      context 'when valid' do
        let(:iri) { ['http:'] }
        it do
          expect { to_iri }.should raise_error(
            ActivityStreams::InvalidAttribute,
            'foo should be an array of valid IRI'
          )
        end
      end
    end
  end

  describe '#to_time' do
    let(:foo) { Foo.new(time) }
    let(:to_time) { foo.to_time :foo }
    subject { to_time }

    context 'when nil' do
      let(:time) { nil }
      it { should be_nil }
    end

    context 'when valid IRI' do
      let(:time) { '1981-12-13' }
      it { should be_a Time }
    end

    context 'when invalid IRI' do
      let(:time) { 'invalid-date' }
      it do
        expect { to_time }.should raise_error ActivityStreams::InvalidAttribute
      end
    end
  end

  describe '#to_integer' do
    let(:foo) { Foo.new(integer) }
    let(:to_integer) { foo.to_integer :foo }
    subject { to_integer }

    context 'when nil' do
      let(:integer) { nil }
      it { should be_nil }
    end

    context 'when String' do
      let(:integer) { '100' }
      it { should be_a Integer }
    end

    context 'when Float' do
      let(:integer) { 10.5 }
      it { should be_a Integer }
    end
  end
end