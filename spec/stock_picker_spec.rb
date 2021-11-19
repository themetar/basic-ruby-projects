require_relative '../stock_picker'

describe 'stock_picker' do
  it 'finds a simple case solution' do
    expect(stock_picker([10,11,5,8,9,22,16])).to eql([2,5])
  end

  it 'returns first day for no solution' do
    expect(stock_picker([10,9,8,7,6,5])).to eql([0,0])
  end

  it 'solves a non min-max case' do
    expect(stock_picker([7,11,5,8,9,22,1,16])).to eql([2,5])
    expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eql([1,4])
  end
end
