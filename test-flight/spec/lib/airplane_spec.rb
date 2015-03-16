require_relative "../../lib/airplane"
require 'pry'

describe Airplane do

  let (:my_plane) {Airplane.new('cesna', 10, 150)}

  describe "#initialization" do
    it 'initializes airplane and has getter for fuel, engine_on and flying' do
      expect(my_plane.type).to eq('cesna')
      expect(my_plane.wingloading).to eq(10)
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe '#start' do
    context 'if engine_on is false (eg after initialization)' do
      it 'set engine_on to "true" when started and return "airplane started"' do
        expect(my_plane.start).to eq('airplane started')
      end
    end
    context 'if engine_on is true' do
      it 'return "airplane already started"' do
        my_plane.start
        expect(my_plane.start).to eq('airplane already started')
      end
    end
  end

  describe '#take_off' do
    context 'if engine_on is false' do
      it 'return "airplane not started, please start"' do
        expect(my_plane.take_off).to eq('airplane not started, please start')
      end
    end
    context 'if engine_on is true' do
      it 'set flying to "true" and return "airplane launched"' do
        my_plane.start
        expect(my_plane.take_off).to eq('airplane launched')
      end
    end
  end

  describe '#landing'
    context 'if engine_on is false and flying is false' do
      it 'returns "airplane not started, please start"' do
        expect(my_plane.landing).to eq('airplane not started, please start')
      end
    end
    context 'if engine_on is true and flying is false' do
      it 'return "airplane already on the ground"' do
        my_plane.start
        expect(my_plane.landing).to eq('airplane already on the ground')
      end
    end
    context 'if engine_on is true and flying is true' do
      it 'return "airplane landed"' do
        my_plane.start
        my_plane.take_off
        expect(my_plane.landing).to eq('airplane landed')
      end
    end
  end
