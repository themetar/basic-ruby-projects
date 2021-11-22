def bubble_sort(input)
  output = input.dup  # shallow copy

  # you target the n-th, then the (n-1)-th, then (n-2)-th, etc... biggest item
  for j in (output.length-1 .. 1) % -1
    # move from 0 to j-1, swapping if you encounter a bigger item
    for i in 0...j
      # swap [i+1] with [i] if needed
      output[i], output[i+1] = output[i+1], output[i] if output[i] > output[i+1]
    end
  end

  output
end
