require './mixed_fraction.rb'

describe 'mixed_fraction' do
  it 'returns 4 2/3 for 42/9' do
    expect(mixed_fraction('42/9')).to eq '4 2/3'
  end

  it 'returns 2 for 6/3' do
    expect(mixed_fraction('6/3')).to eq '2'
  end

  it 'returns 2/3 for 2/3' do
    expect(mixed_fraction('2/3')).to eq '2/3'
  end

  it 'returns -2/3 for -2/3' do
    expect(mixed_fraction('-2/3')).to eq '-2/3'
  end

  it 'returns -2/3 for 4/-6' do
    expect(mixed_fraction('4/-6')).to eq '-2/3'
  end

  it 'returns -1 3/7 for 10/-7' do
    expect(mixed_fraction('10/-7')).to eq '-1 3/7'
  end

  it 'returns -1 3/7 for -10/7' do
    expect(mixed_fraction('-10/7')).to eq '-1 3/7'
  end

  it 'returns 3 1/7 for -22/-7' do
    expect(mixed_fraction('-22/-7')).to eq '3 1/7'
  end
end
