require 'json'

module Decider
  def self.decide(history)
    tit_for_tat(history)
  end

  # FIXME: This is not tit_for_tat!
  def self.tit_for_tat(history)
    return 'C' if history.empty?

    case history.last
    when 'CC'
      return 'C'
    when 'CD'
      return 'D'
    when 'DD'
      return 'C'
    when 'DC'
      return 'C'
    end
  end
end
