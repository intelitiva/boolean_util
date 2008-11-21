# Add some useful methods to work with booleans in general like: 'true', 1 or true
#
class BooleanUtil
  # Checks if the given argument is positive.
  #
  def self.true?(arg)
    to_b arg
  end

  # Parse an available value to boolean.
  #
  def self.to_b(arg)
    self.all.include?(prepared(arg)) ? self.positives.include?(prepared(arg)) : (!!arg)
  end

  # Returns all positive values available.
  #
  def self.positives
    [true, "true", 1]
  end

  # Returns all negative values available.
  #
  def self.negatives
    [false, "false", 0]
  end

  # Returns all values available.
  #
  def self.all
    self.positives + self.negatives
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

