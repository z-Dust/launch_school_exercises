monthly_payment, loan_amount, monthly_interest_rate, duration_months = ""

def loan_calculator(loan_amount, monthly_interest_rate, duration_months)
  loan_amount * (monthly_interest_rate / (1 -
                                          (1 + monthly_interest_rate) ** (-duration_months)))
end

def number?(obj)
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end

loop do
  loop do
    puts "enter loan amount"
    loan_amount = gets.chomp
    if loan_amount.to_i < 0
      puts "invalid input: loan amount must be positive"
    elsif number? loan_amount
      break
    else
      puts "invalid input: loan amount must be an integer"
    end
  end

  loop do
    puts "enter monthly interest rate, i.e, enter 5% as '5' and 2.5% as 2.5"
    monthly_interest_rate = gets.chomp
    if monthly_interest_rate.to_i < 0
      puts "invalid input: interest rate must be positive"
    elsif number? monthly_interest_rate
      break
    else
      puts "invalid input"
    end
  end

  loop do
    puts "enter the duration of the loan in months"
    duration_months = gets.chomp
    if duration_months.to_i < 0
      puts "invalid input: duration must be positive"
    if number? duration_months
      break
    else
      puts "invalid input: duration must be an integer"
    end
  end

  puts "monthly payment is " +
         "#{loan_calculator(loan_amount.to_i, monthly_interest_rate.to_f,
         duration_months.to_i)}"

  puts "would you like to calculate another loan? y/n"
  continue = gets.chomp
  break unless continue.downcase == "y"
end
