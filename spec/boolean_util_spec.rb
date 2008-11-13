require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooleanUtil do
  it "should return true value to an integer" do
    BooleanUtil.to_b(1).should be_true
  end

  it "should return true value to a string" do
    BooleanUtil.to_b('true').should be_true
  end

  it "should return true value to a uppercased string" do
    BooleanUtil.to_b('TRUE').should be_true
  end

  it "should return true value to a capitalized string" do
    BooleanUtil.to_b('True').should be_true
  end

  it "should return true value to a true" do
    BooleanUtil.to_b(true).should be_true
  end

  it "should return false value to an integer" do
    BooleanUtil.to_b(0).should be_false
  end

  it "should return false value to a string" do
    BooleanUtil.to_b('false').should be_false
  end

  it "should return false value to a uppercased string" do
    BooleanUtil.to_b('FALSE').should be_false
  end

  it "should return false value to a capitalized string" do
    BooleanUtil.to_b('False').should be_false
  end

  it "should return false value to a false" do
    BooleanUtil.to_b(false).should be_false
  end

  it "should return a positive ruby boolean to an arg not included into default boolean value list" do
    BooleanUtil.to_b("my name is Tester :P").should be_true
  end

  it "should return a negative ruby boolean to an arg not included into default boolean value list" do
    BooleanUtil.to_b(nil).should be_false
  end

  describe "patch'ed strings" do
    it "should return a positive value to positive strings" do
      "true".to_b.should be_true
    end

    it "should return a negative value to negative strings" do
      "false".to_b.should be_false
    end
  end

  describe "patch'ed integers" do
    it "should return a positive value to positive integers" do
      1.to_b.should be_true
    end

    it "should return a negative value to negative integers" do
      0.to_b.should be_false
    end
  end

  describe "patch'ed nil" do
    it "should return a negative value to nil" do
      nil.to_b.should be_false
    end
  end
end
