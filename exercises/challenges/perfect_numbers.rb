class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    sum = (1..(num - 1)).select do |divisor|
            num % divisor == 0
          end.sum

    case sum <=> num
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end
end
