class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand)
    distance = 0
    strand.split('').each_with_index do |base, index|
      break if index == @strand.length
      distance += 1 unless base == @strand[index]
    end if !strand.empty? && strand != @strand
    distance
  end
end
