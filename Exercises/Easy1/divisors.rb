# brute force
# def divisors(num)
#   (1..num).select { |n| num % n == 0 }
# end

def divisors(num)
  result = []

  (1..Integer.sqrt(num)).each { |i| result << i << (num / i) if num % i == 0 }

  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
