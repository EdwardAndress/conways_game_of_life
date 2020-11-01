require_relative './underpopulation_rule.rb'
require_relative './overpopulation_rule.rb'
require_relative './reproduction_rule.rb'
require_relative './preservation_rule.rb'

class Clock

  DEFAULT_RULES = [
    UnderpopulationRule,
    OverpopulationRule,
    ReproductionRule,
    PreservationRule
  ]

  def initialize(rules = DEFAULT_RULES)
    @rules = rules
  end

  def tick(world)
    sleep 0.2
    @rules.each_with_object(world.next_generation) do |rule, next_gen|
      rule.apply_to(world, next_gen)
    end
  end
end