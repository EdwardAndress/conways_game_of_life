class Clock
  def initialize(rules)
    @rules = rules
  end

  def tick(world)
    @rules.each do |rule|
      rule.apply_to(world)
    end
  end
end