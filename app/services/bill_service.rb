module BillService

  class BillBuilder

    def self.build
      builder = new
      yield(builder)
      builder.bill
    end

    def initialize
      @bill = Bill.new
    end

    def bill_type=(type)
      @bill.bill_type = type
    end

    def amount=(amount)
      @bill.amount = amount
    end

    def percent=(percent)
      @bill.percent = percent
    end

    def amount_limit=(amount_limit)
      @bill.amount_limit = amount_limit
    end

    def regular_replenishment_amount(replenishment)
      @bill.regular_replenishment_amount = replenishment
    end

    attr_reader :bill
  end
end