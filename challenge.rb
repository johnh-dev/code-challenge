require "./lib/county"
require "./lib/money"
require "./lib/product"
require "./lib/sale"

# create collection of counties using hash to ensure unique names
county = {}
{"Broward" => {sales_tax_pct: 7, markup_pct: 30},
 "Miami-Dade" => {sales_tax_pct: 6, markup_pct: 25},
 "Palm Beach" => {sales_tax_pct: 8, markup_pct: 30}}.each { |county_name, value|
    county[county_name] = County.new(county_name, value[:sales_tax_pct], value[:markup_pct])
}

# create test product
product = Product.new("Brand", "Product", Money.new(30))

# create product sales record for each county
sales = []
county.values.each { |sales_county|
    sales << Sale.new(product, 100, sales_county)
}

# sum profits from all sales
total_profit = Money.new(0)
sales.each { |sale|
    total_profit += sale.profit
}

puts "The total profit is #{total_profit}."
