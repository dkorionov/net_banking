module Bills
  class BillBuilderService
    attr_accessor :bill

    def initialize
      @bill = Bill.new
      @bill_request = BillRequestCreator.new
      @bill_request.bill = @bill
    end

    def user=(user)
      @bill.user = user
    end

    def bill_type=(bill_type)
      @bill.bill_type = bill_type
    end

    def regular_replenishment_amount=(amount)
      @bill.regular_replenishment_amount = amount
    end

    def expired_bill_at=(date)
      @bill.expired_bill_at = date
    end

    def amount_limit=(limit)
      @bill.amount_limit = limit
    end

    def percent=(percent)
      @bill.percent = percent
    end

    def close_status=(status)
      @bill.close_status = status
    end

    def close_at=(date)
      @bill.close_at = date
    end

    def create_default_deposit(user, manager)
      @bill.user = user
      @bill_request.manager = manager
      @bill.bill_type = 'deposit'
      @bill.amount_limit = 1000
      @bill_request.message = 'New deposit'
      @bill
    end

    def request_manager=(manager)
      @bill_request.manager = manager
    end

    def request_message=(message)
      @bill_request.message = message
    end
  end
end

