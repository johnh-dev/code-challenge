# Encapsulates product details.
class Product
    attr_accessor :brand_name, :name, :cost

    def initialize (brand_name, name, cost)
        @brand_name = brand_name
        @name = name
        @cost = cost
    end

    def to_s
        return "{brand_name: #{@brand_name}, name: #{@name}, cost: #{@cost}}"
    end
end
