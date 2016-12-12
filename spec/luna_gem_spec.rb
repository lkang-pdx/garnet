require 'spec_helper'

describe LunaGem, type: :request do
  describe '#initialize' do
    it 'authenticates the user', vcr: {cassette_name: :initialize} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      expect(luna.instance_variable_get(:@auth_token)).to be_a String
    end
  end

  describe '#get_me' do
    it 'returns the user data in an object', vcr: {cassette_name: :get_me} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = luna.get_me
      expect(response.instance_variable_get(:@user)).to be_a Object
    end
  end

  describe '#get_mentor_availability' do
    it 'returns the mentor availability in an object', vcr: {cassette_name: :get_mentor_availability} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = luna.get_mentor_availability(ENV['MENTOR_ID'])
      expect(response.instance_variable_get(:@mentor)).to be_a Object
    end
  end

  describe '#get_messages' do
    it 'returns the messages in an object', vcr: {cassette_name: :get_messages} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = luna.get_messages
      expect(response.instance_variable_get(:@messages)).to be_a Object
    end
  end

  describe '#get_roadmap' do
    it 'returns the roadmap in an object', vcr: {cassette_name: :get_roadmap} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = luna.get_roadmap(ENV['ROADMAP_ID'])
      expect(response.instance_variable_get(:@roadmap)).to be_a Object
    end
  end

  describe '#get_checkpoint' do
    it 'returns the checkpoint in an object', vcr: {cassette_name: :get_checkpoint} do
      luna = LunaGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = luna.get_checkpoint(ENV['CHECKPOINT_ID'])
      expect(response.instance_variable_get(:@checkpoint)).to be_a Object
    end
  end
end
