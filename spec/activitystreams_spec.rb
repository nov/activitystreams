require 'spec_helper'

describe ActivityStreams do
  its(:logger) { should be_a Logger}

  describe '.logger=' do
    class CustomLogger < Logger; end

    it 'should set custom logger' do
      ActivityStreams.logger = CustomLogger.new(STDERR)
      ActivityStreams.logger.should be_a CustomLogger
    end
  end
end