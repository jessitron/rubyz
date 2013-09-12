require_relative '../lib/either'

describe Either do

  what_shall_we_call_map = :transform

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

  it 'can be converted to enumerable, with left being empty' do
    expect(subject.left(4).to_a).to eq([])
  end

  it 'can be converted to enumerable, with right having one item' do
    expect(subject.right(4).to_a).to eq([4])
  end

  it 'maps on a right' do
     expect(subject.right(4).send(what_shall_we_call_map, ->(a) { a + 1})).to eq(subject.right(5))
  end

  it 'can also map a left' do
    expect(subject.left("boo)")).to eq(subject.left("boo"))
  end

end
