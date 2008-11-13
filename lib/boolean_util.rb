# Add some useful methods to work with booleans in general like: 'true', 1 or true
#
class BooleanUtil
  DEFAULT_BOOLEAN_VALUES = { :positives => [true, "true", 1], :negatives => [false, "false", 0] }

  # Checks if the given argument is positive.
  #
  def self.true?(arg)
    to_b arg
  end

  # Parse an available value to boolean.
  #
  def self.to_b(arg)
    all.include?(prepared(arg)) ? DEFAULT_BOOLEAN_VALUES[:positives].include?(prepared(arg)) : (!!arg)
  end

  # Returns all positive values available.
  #
  def self.positives
    DEFAULT_BOOLEAN_VALUES[:positives]
  end

  # Returns all negative values available.
  #
  def self.negatives
    DEFAULT_BOOLEAN_VALUES[:negatives]
  end

  # Returns all values available.
  #
  def self.all
    a = DEFAULT_BOOLEAN_VALUES.values; return (a[0] + a[1])
  end

  private
    def self.prepared(arg)
      return arg if arg.nil?
      (arg.is_a? String) ? arg.downcase : arg
    end
end

# Add boolean utilities to objects
Object.class_eval do
  def to_b
    BooleanUtil.to_b(self)
  end
end
