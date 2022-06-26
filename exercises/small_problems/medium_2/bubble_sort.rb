def bubble_sort!(arr)
  optimize = 0
  loop do
    bool = true
    optimize += 1
    arr.each_index do |i|
      if i + optimize >= arr.size
        next
      elsif arr[i] > arr[i + 1]
        swap = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = swap
        bool = false
      end
    end

    break if bool == true
  end

  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
