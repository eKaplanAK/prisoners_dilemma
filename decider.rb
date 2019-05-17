module Decider
  def decide(history)
    'C' if history.blank?
    case history.last
    when ['C', 'C']
      'C'
    when ['C', 'D']
      'D'
    when ['D', 'D']
      'C'
    when ['D', 'C']
      'C'
    end
  end
end
