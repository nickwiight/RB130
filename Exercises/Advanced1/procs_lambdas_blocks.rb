# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

=begin
Procs are an object. If you do not pass in an expected argument, the proc passes
nil in instead.
=end

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = ->(thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
Lambdas are a specific kind of proc object. there are two ways of defining a
lambda: lambda { block } and ->(arguments) { block }
If the parameters are not met, throws an error.
Lambda is not a class in ruby.
=end

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
yielding to blocks needs to pass an argument or a block's parameter is nil.
if no block is passed to a method expecting one, get a LocalJumpError
=end

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin

=end
