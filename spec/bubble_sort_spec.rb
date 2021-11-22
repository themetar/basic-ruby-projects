require_relative '../bubble_sort'

describe 'bubble_sort' do
  it 'handles empty, 1-element, and 2-=elemnt arrays' do
    expect(bubble_sort([])).to      eql([])
    expect(bubble_sort([10])).to    eql([10])
    expect(bubble_sort([4,8])).to   eql([4,8])
    expect(bubble_sort([10,5])).to  eql([5,10])
  end

  it 'sorts an arbitrary array' do
    expect(bubble_sort([4,3,78,2,0,2])).to eql([0,2,2,3,4,78])
    expect(bubble_sort([5,-8,24,2.365,0,12])).to eql([-8,0,2.365,5,12,24])
  end

  # BONUS
  it 'sorts strings' do
    expect(bubble_sort('wthidto')).to eql('dhiottw')
  end
end
