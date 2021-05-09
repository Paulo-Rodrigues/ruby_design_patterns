# The problem
def net_salary(amount, country)
  taxes = case country
          when 'Ukraine'
            (amount * 0.05) + 313
          when 'U.S'
            (amount * 0.2) + 100
          when 'Poland'
            amount * 0.3
          else
            0
          end

  amount - taxes
end

class UkraineTaxes
  def self.taxes(amount)
    (amount * 0.05) + 313
  end
end

class UsTaxes
  def self.taxes(amount)
    (amount * 0.2) + 100
  end
end

class PolandTaxes
  def self.taxes(amount)
    amount * 0.3
  end
end

class Taxes
  def initialize
    @strategies = {}
    @strategies['Ukraine'] = UkraineTaxes
    @strategies['Poland'] = PolandTaxes
    @strategies['US'] = UsTaxes
  end

  def net_salary(amount, country)
    strategy = @strategies[country]

    strategy ? amount - strategy.taxes(amount) : amount
  end
end

# another example
#
# the problem
def show
  response = api.get(params[:id])

  return handle_error if response.status == 'error'
  return handle_fail if response.status == 'fail'

  if response.status == 'success'
    "Successfull response #{response.data}"
  end
end

def handle_error
  puts "Error #{response.error_message}"
end

def handle_fail
  puts "Request failed"
end

# solution using lambda instead of classes
class ResponseHandler
  def self.handle(response, strategies)
    strategies[response.status.to_sym].call
  end
end

def show
  response = api.get(params[:id])

  on_success = -> {"Success ..."}
  on_error = -> {"Error ..."}
  on_fail = -> {'Fail ...'}

  ResponseHandler.handle(response, success: on_success, error: on_error, fail: on_fail)
end
