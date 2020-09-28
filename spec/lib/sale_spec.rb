require "./spec/spec_helper.rb"

require "county"
require "product"
require "sale"

describe Sale do
    product = Product.new("Brand Name", "Product Name", Money.new(30))
    county = County.new("County Name", 6, 25)
    describe "#initialize" do
        it "sale price = product cost * quantity + the default markup" do
            sale = Sale.new(product, 50, county)
            expect(sale.sale_price.amount).to eq(1875)
        end
        it "sale price = product cost * quantity + the provided markup" do
            sale = Sale.new(product, 50, county, {markup_pct: 40})
            expect(sale.sale_price.amount).to eq(2100)
        end
        it "sales tax = sales price * county tax rate" do
            sale = Sale.new(product, 50, county)
            expect(sale.sales_tax.amount).to eq(112.5)
        end
    end
    describe "#cost" do
        it "cost = product cost * quantity" do
            sale = Sale.new(product, 50, county)
            expect(sale.cost.amount).to eq(1500)
        end
    end
    describe "#profit" do
        it "profit = sale price - cost" do
            sale = Sale.new(product, 50, county)
            expect(sale.profit.amount).to eq(375)
        end
    end
end