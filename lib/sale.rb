class Sale
    attr_reader :product, :county, :quantity, :cost, :sale_price, :sales_tax

    def initialize (product, quantity, county, options = {})
        @product = product
        @county = county
        @quantity = quantity
        # capture cost, price, and tax details at time of sale
        @cost = product.cost * quantity
        @sale_price = (product.cost * quantity) * (1 + (options[:markup_pct] ? options[:markup_pct] / 100.0 : county.markup_rate))
        @sales_tax = @sale_price * county.sales_tax_rate
    end

    def profit
        @sale_price - @cost
    end
end
