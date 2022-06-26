def lights(num)
  arr = Array.new(num, 'off')

  1.upto(num) do |i|
    arr.each_index do |idx|
      if (idx + 1) % i == 0
        arr[idx] == 'off' ? arr[idx] = i : arr[idx] = 'off'
      end
    end
  end
arr.delete('off')
arr
end

lights(5)
lights(10)
lights(50)
