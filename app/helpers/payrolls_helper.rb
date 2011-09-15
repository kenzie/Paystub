module PayrollsHelper

  def employee_amount(employee, type, key, period)
    total = 0.0
    employee[type][key].each do |amount|
      total += amount[period].to_f
    end
    total
  end

end
