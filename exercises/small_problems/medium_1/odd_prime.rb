def odd_not_prime(num)
  count = 0
  3.step(num, 2) do |i|
    3.step(i - 1, 2) do |n|
      if i % n == 0
        count += 1
        break
      end
    end
  end
  p count
end

odd_not_prime(50)
