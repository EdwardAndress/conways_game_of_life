class Clock
  def initialize(rules)
    @rules = rules
  end

  def tick(world)
    sleep 0.5
    @rules.each_with_object(world.next_generation) do |rule, next_gen|
      rule.apply_to(world, next_gen)
    end
  end
end