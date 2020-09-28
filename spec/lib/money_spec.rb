require "./spec/spec_helper"

require "money"

describe Money do
    describe "#initialize" do
        it "sets the amount to 0 when no arguments" do
            expect(Money.new.amount).to eq(0)
        end
        it "sets the amount to 0 when absolute value of argument < 0.005" do
            expect(Money.new(0.004).amount).to eq(0)
            expect(Money.new(-0.004).amount).to eq(0)
        end
        it "sets the amount to 0.01 when argument = 0.005" do
            expect(Money.new(0.005).amount).to eq(0.01)
        end
        it "sets the amount to -0.01 when argument = -0.005" do
            expect(Money.new(-0.005).amount).to eq(-0.01)
        end
    end
    describe "#+" do
        it "returns the sum of money amounts" do
            expect((Money.new(2) + Money.new(3)).amount).to eq(5)
        end
    end
    describe "#-" do
        it "returns the difference of money amounts" do
            expect(((Money.new(3) - Money.new(2)).amount)).to eq(1)
        end
    end
    describe "#*" do
        it "returns the money amount multiplied by a factor" do
            expect((Money.new(4) * 0.25).amount).to eq(1)
        end
        it "returns the money amount multiplied by a factor rounded towards zero when < half" do
            expect((Money.new(0.03) * 0.125).amount).to eq(0.0)
            expect((Money.new(-0.03) * 0.125).amount).to eq(0.0)
        end
        it "returns the money amount multiplied by a factor rounded away from zero when half" do
            expect((Money.new(0.04) * 0.125).amount).to eq(0.01)
            expect((Money.new(-0.04) * 0.125).amount).to eq(-0.01)
        end
    end
    describe "#to_s" do
        it "precedes the amount with the currency symbol" do
            expect((Money.new(1.23)).to_s).to eq("$1.23")
        end
        it "places the negative sign before the currency symbol" do
            expect((Money.new(-1.23)).to_s).to eq("-$1.23")
        end
    end
end
