# #
# Classic approach:
# Go throug the message, calculating for each character its offseted pair as you go

ABC_SIZE = 'z'.ord - 'a'.ord + 1

def caesar_cipher(message, offset)
  message.each_char.map do |char|
    # check if char is a letter; while at it, check uppercase or lower
    base = 'a' if char.between?('a', 'z') # lower
    base = 'A' if char.between?('A', 'Z') # upper
    base = base && base.ord               # if defined, get ordinal number
    
    if base
      # calculate new char
      # the second increment and modulo is for negative offsets
      (((char.ord - base + offset) % ABC_SIZE + ABC_SIZE) % ABC_SIZE + base).chr
    else
      # not a letter, return as is
      char
    end
  end.join
end
# # #



# #
# Since Ruby has the String#tr method, which translates characters form source to target,
# you can just remap the whole alphabet once. Since Ruby has character ranges and Array#rotate,
# you can easily build and shift the alphabet. 
def caesar_cipher_ruby(message, offset)
  # build alphabet
  abc = ('a'..'z').to_a.join
  # map each letter by shifting by offset
  mapped = ('a'..'z').to_a.rotate(offset).join
  # translate
  message.tr(abc + abc.upcase, mapped + mapped.upcase)
end
