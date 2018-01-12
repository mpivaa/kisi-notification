class Rule
  attr_accessor :subscribers

  def initialize(subscribers: [], filters: {})
    @subscribers = subscribers
    @filters = filters
  end

  def match?(event)
    @filters.all? do |(key, value)|
      if value.kind_of?(Range)
        value.cover?(event.fetch(key))
      elsif value.kind_of?(Array)
        value.include?(event.fetch(key))
      else
        value === event.fetch(key)
      end
    end
  end
end
