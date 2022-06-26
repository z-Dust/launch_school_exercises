require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def number?(obj)
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end

def valid_operation(input)
  input == "1" || input == "2" || input == "3" || input == "4"
end

def operation_to_message(operation)
  word = case operation
         when "1"
           "adding"
         when "2"
           "subtracting"
         when "3"
           "multiplying"
         when "4"
           "dividing"
         end

  word
end

prompt MESSAGES['welcome']

name = ""

loop do
  name = gets.chomp

  if name.empty?
    prompt MESSAGES['name']
  else
    break
  end
end

prompt MESSAGES['hello'] + " #{name}"

loop do
  first_num, second_num, operation_choice = ""

  loop do
    prompt MESSAGES['prompt_number']

    first_num = gets.chomp

    if number? first_num
      break
    else
      prompt MESSAGES['invalid']
    end
  end

  loop do
    prompt MESSAGES['prompt_second']

    second_num = gets.chomp

    if number? second_num
      break
    else
      prompt MESSAGES['invalid']
    end
  end

  operator_prompt = <<-MSG
  choose an operation to perform:
        1) addition
        2) subtraction
        3) multiplication
        4) division
  MSG

  prompt operator_prompt

  loop do
    operation_choice = gets.chomp

    if %w(1 2 3 4).include? operation_choice
      break
    else
      prompt MESSAGES['invalid']
    end
  end

  prompt "#{operation_to_message(operation_choice)} #{first_num} and " +
         "#{second_num}..."

  result =  case operation_choice
            when "1"
              first_num.to_i + second_num.to_i
            when "2"
              first_num.to_i - second_num.to_i
            when "3"
              first_num.to_i * second_num.to_i
            when "4"
              first_num.to_f / second_num.to_f
            end

  prompt MESSAGES['result'] + " #{result}"

  prompt MESSAGES['continue']

  continue = gets.chomp

  if continue.downcase != "y"
    break
  end
end

prompt MESSAGES['goodbye']
