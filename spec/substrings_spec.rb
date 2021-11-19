require_relative '../substrings'

describe "substrings" do
  it "finds a word" do
    expect(substrings("hello", ["hello"])).to eql({"hello" => 1})
  end

  it "counts multiple occurences" do
    expect(substrings("hello world, hello friend", ["hello"])).to eql({"hello" => 2})
  end

  it "is case-insensitive" do
    expect(substrings("Hello world, hElLo friend", ["hello"])).to eql({"hello" => 2})
  end

  it "correctly processes more complex example" do
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    expected = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
    expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eql(expected)
  end
end
