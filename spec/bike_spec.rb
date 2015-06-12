require 'bike'

<<<<<<< HEAD
describe Bike do

  it { is_expected.to respond_to :working? }

  it 'report_broken changes broken? to true' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
=======
describe Bike do 
	it {is_expected.to respond_to :working?}

	it 'can be reported broken' do 
		subject.report_broken
		expect(subject).to be_broken
	end

	it {is_expected.to respond_to :broken?}
end
>>>>>>> c3c184d7c85b316ac14b6ed69cbbc9a31b290227
