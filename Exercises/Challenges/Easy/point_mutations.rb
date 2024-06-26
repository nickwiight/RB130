class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    zipped = @strand.chars.zip(other_strand.chars).select do |arr|
      !arr.include?(nil)
    end
    zipped.count { |strand, other| strand != other }
  end
end
