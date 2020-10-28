class Clock
  def initialize(rules)
    @rules = rules
  end

  def tick(world)
    sleep 0.5
    @rules.each do |rule|
      rule.apply_to(world)
    end
  end
end