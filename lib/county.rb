# Encapsulates county specific values.
class County
    attr_accessor :name, :sales_tax_rate, :markup_rate

    def initialize (name, sales_tax_pct, markup_pct)
        @name = name
        @sales_tax_rate = sales_tax_pct / 100.0
        @markup_rate = markup_pct / 100.0
    end

    def markup_pct
        @markup_rate * 100
    end

    def sales_tax_pct
        @sales_tax_rate * 100
    end

    def to_s
        return "{name: #{@name}, sales_tax_rate: #{@sales_tax_rate}, markup_pct #{markup_pct}}"
    end
end
