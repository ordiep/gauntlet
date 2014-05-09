require "spec_helper"

describe Gauntlet::Problems::PostfixCalculator, ".calc" do
  it "should evaluate an empty string to 0" do
    expect(described_class.calc("")).to eq(0)
  end

  it "should evaluate a set of numbers as the last number" do
    expect(described_class.calc("1 2 3")).to eq(3)
  end

  it "should evaluate numbers with more than one digit" do
    expect(described_class.calc("1 2 3 10001")).to eq(10001)
  end

  it "should evaluate floats" do
    expect(described_class.calc("1 2 3.5")).to eq(3.5)
  end

  it "should add" do
    expect(described_class.calc("1 8.6 +")).to eq(9.6)
  end

  it "should subtract" do
    expect(described_class.calc("1 8.6 -")).to eq(-7.6)
  end

  it "should multiply" do
    expect(described_class.calc("2 8.6 *")).to eq(17.2)
  end

  it "should divide" do
    expect(described_class.calc("8.6 8.6 /")).to eq(1)
  end

  it "should do complex expressions" do
    expect(described_class.calc("5 1 2 + 4 * + 3 -")).to eq(14)
  end
end
