require "test_helper"

class Problem001Test < Test::Unit::TestCase
  attr_reader :described_class

  context "Gauntlet::Problems::PostfixCalculator" do
    setup do
      @described_class = Gauntlet::Problems::PostfixCalculator
    end

    should "work with an empty string" do
      assert_equal 0, described_class.calc(""), "Expected the calculator to be able to parse an empty string"
    end

    should "be able to parse numbers" do
      assert_equal 3, described_class.calc("1 2 3"), "Expected the calculator to be able to parse numbers"
    end

    should "work with numbers that have more than one digit" do
      assert_equal 10001, described_class.calc("1 2 3 10001"), "Expected the calculator to support numbers that are larger than one digit"
    end

    should "be able to parse floats" do
      assert_equal 3.5, described_class.calc("1 2 3.5"), "Expected the calculator to be able to parse floats"
    end

    should "support addition" do
      assert_equal 9.6, described_class.calc("1 8.6 +"), "Expected the calculator to support addition"
    end

    should "support subtraction" do
      assert_equal -7.6, described_class.calc("1 8.6 -"), "Expected the calculator to support subtraction"
    end

    should "support multiplication" do
      assert_equal 17.2, described_class.calc("2 8.6 *"), "Expected the calculator to support multiplication"
    end

    should "support division" do
      assert_equal 1, described_class.calc("8.6 8.6 /"), "Expected the calculator to support division"
    end

    should "support complex expressions" do
      assert_equal 14, described_class.calc("5 1 2 + 4 * + 3 -"), "Expected the calculator to handle complex expressions"
    end
  end

end
