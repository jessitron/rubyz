require_relative '../lib/either'

describe Either do

  subject { described_class }

  it 'can hold a left' do
    subject.left("I hate you").left?.should be_true
  end

end
