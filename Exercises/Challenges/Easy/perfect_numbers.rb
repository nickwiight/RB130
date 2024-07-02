class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    sum = divisors(num).sum

    if sum == num
      'perfect'
    elsif sum > num
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def divisors(num)
      result = []
      1.upto(Math.sqrt(num)).each do |div|
        if num % div == 0
          result << div
          remainder = num / div
          result << remainder if remainder != num
        end
      end
      result.uniq
    end
  end
end
