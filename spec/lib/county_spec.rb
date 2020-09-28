require "./spec/spec_helper.rb"

require "county"

describe County do
    describe "#markup_pct" do
        it "should return corresponding markup rate and percentage" do
            county = County.new("County Name", 6, 30)
            expect(county.markup_pct).to eq(county.markup_rate * 100)
        end
    end
    describe "#sale_tax_pct" do
        it "should return corresponding sales tax rate and percentage" do
            county = County.new("County Name", 6, 30)
            expect(county.sales_tax_pct).to eq(county.sales_tax_rate * 100)
        end
    end
end