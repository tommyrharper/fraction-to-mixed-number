require './mixed_fraction.rb'

describe 'mixed_fraction' do
  it 'returns 4 2/3 for 42/9' do
    expect(mixed_fraction('42/9')).to eq '4 2/3'
  end
end