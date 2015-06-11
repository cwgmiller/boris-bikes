require 'docking_station'

describe DockingStation do 
	it { is_expected.to respond_to :release_bike }

	it 'releases a working bike' do
		bike = double :bike, broken?: false
		subject.dock bike
		expect(subject.release_bike).to be bike
	end

	it 'does not release broken bikes' do
		bike = double :bike, broken?: true
		subject.dock bike
		expect{subject.release_bike}.to raise_error 'Broken bikes cannot be released'
	end

	it { is_expected.to respond_to(:dock).with(1).argument }

	describe 'release_bike' do
		it 'raises an error when there are no bikes available' do 
			expect {subject.release_bike}.to raise_error 'No bikes available'
		end
	end

	describe 'dock' do 
		it 'raises an error when at capacity' do 
			subject.capacity.times {subject.dock double :bike}
			expect {subject.dock double :bike}.to raise_error 'Docking station full'
		end
	end

	it 'has a default capacity' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'can change capacity to 30' do
		subject.capacity = 30
		expect(subject.capacity).to eq 30
	end
end
