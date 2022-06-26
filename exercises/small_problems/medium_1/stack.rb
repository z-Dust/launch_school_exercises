def minilang(str)
  register = 0
  stack_arr = []

  str.split.each do |e|
    if e == e.to_i.to_s
      register = e.to_i
    else
      case e
      when 'PUSH'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        stack_arr.push(register)
      when 'ADD'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register += stack_arr.pop
      when 'SUB'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register -= stack_arr.pop
      when 'MULT'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register *= stack_arr.pop
      when 'DIV'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register /= stack_arr.pop
      when 'MOD'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register %= stack_arr.pop
      when 'POP'
        # return p 'Error: empty Stack.' if stack_arr.empty?
        register = stack_arr.pop
      when 'PRINT'
        p register
      else
        return p "Error: unknown command"
      end
    end
  end
  nil
end

minilang('HEY')

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)
