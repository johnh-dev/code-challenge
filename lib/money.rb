# Encapsulate operations involving money. This implementation is specific
# to US dollars, but could be expanded to handle additional currencies.
# Handles values internally as integers to mitigate issues related to floats.
class Money
    attr_reader :subunits

    # details specific to the US dollar
    @@ISO_CODE = "USD"
    @@PRECISION = 2
    @@SUBUNITS_PER_UNIT = 100
    @@SYMBOL = "$"

    protected def subunits= (new_value)
        @subunits = new_value
    end

    def initialize(amount = 0)
       @subunits = (amount * @@SUBUNITS_PER_UNIT).round
    end

    def amount
        @subunits.to_f / @@SUBUNITS_PER_UNIT
    end

    # helper method to facilitate operations that result in a new value
    def dup_with_options (options = {})
        result = self.class.new()
        result.subunits = options[:subunits] || @subunits
        return result
    end

    def + (money)
        dup_with_options({subunits: @subunits + money.subunits})
    end

    def - (money)
        dup_with_options({subunits: @subunits - money.subunits})
    end

    def * (factor)
        dup_with_options({subunits: (@subunits * factor).round})
    end

    def to_s
        "#{@subunits < 0 ? "-" : ""}#{@@SYMBOL}%.#{@@PRECISION}f" % amount.abs
    end
end
