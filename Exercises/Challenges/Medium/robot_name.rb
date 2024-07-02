class Robot
  @@names = []

  def initialize
    @name = nil
  end

  def name
    @name = generate_name if @name.nil?
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = random_name
    name = random_name while @@names.include? name

    @@names << name
    name
  end

  def random_name
    alphs = ('A'..'Z').to_a
    nums = (0..9).to_a
    "#{alphs.sample}#{alphs.sample}#{nums.sample}#{nums.sample}#{nums.sample}"
  end
end
