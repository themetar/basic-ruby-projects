require './caesar_cipher'

describe "caesar_cipher" do
  it "shifts a single letter with a small offset" do
    expect(caesar_cipher('c', 3)).to eql('f')
  end

  it "shifts a single letter with a small negative ofset" do
    expect(caesar_cipher('f', -3)).to eql('c')
  end

  it "encodes a word" do
    expect(caesar_cipher('hello', 10)).to eql('rovvy')
  end

  it "preserves case" do
    expect(caesar_cipher('HeLlo', 10)).to eql('RoVvy')
  end

  it "encodes a whole sentence, preserving case and punctuation" do
    expect(caesar_cipher('Knock, knock. - Who\'s there?', 13)).to eql('Xabpx, xabpx. - Jub\'f gurer?')
    expect(caesar_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
  end

  it "masnages large positive and negative shifts" do
    expect(caesar_cipher('HeLlo', 62)).to eql('RoVvy')
    expect(caesar_cipher('HeLlo', -68)).to eql('RoVvy')
  end
end

describe "caesar_cipher_ruby" do
  it "encodes a whole sentence, preserving case and punctuation" do
    expect(caesar_cipher_ruby('Knock, knock. - Who\'s there?', 13)).to eql('Xabpx, xabpx. - Jub\'f gurer?')
    expect(caesar_cipher_ruby('What a string!', 5)).to eql('Bmfy f xywnsl!')
  end

  it "retunrs the same results as the other implementation" do
    inputs = [
      ['hello', 14],
      ['HeLlo', -6],
      ['Knock, knock. - Who\'s there?', 13],
      ['What a string!', 5],
      ['Knock, knock. - Who\'s there?', -113],
      ['What a string!', 10**4],
      ['Knock, knock. - Who\'s there?', 13],
      ['That\'s all, folks!', 0]
    ]

    for message, offset in inputs do
      expect(caesar_cipher_ruby(message, offset)).to eql(caesar_cipher(message, offset))
    end
  end
end