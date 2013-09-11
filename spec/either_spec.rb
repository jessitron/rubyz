require_relative '../lib/either'

describe Either do

  subject { described_class }

  it 'can hold a left' do
    subject.left("I hate you").left?.should be_true
  end

  it 'left is not a right' do
    subject.left("I hate you").right?.should be_false
  end

  it 'can hold a right' do
    subject.right("I love you").right?.should be_true
  end

  it 'right is not a left' do
    subject.right("I love you").left?.should be_false
  end

  it 'is enumerable, with left being empty' do
    expect(subject.left(4).to_a).to eq([])
  end

end
