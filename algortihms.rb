#!/usr/bin/ruby
inp = $stdin.read.chomp.split(/\n+/)
def cycle_count(inp_range)
    min = inp_range[0].to_i
    max = inp_range[1].to_i
    current_highest = 0
    if max > 100
        min = max - 100
    end
    current_num = max
    while current_num > min
       @cycles = 0
       base_al(current_num)
       if current_highest < @cycles
            current_highest = @cycles
       end
       current_num -= 1 
    end
    return current_highest
end

def base_al(number)
    @cycles += 1
    if number == 1
        return
    elsif (number % 2) == 0
        number = number / 2
        base_al(number)
    else
        number = (number * 3) + 1
        base_al(number)
    end
end

puts(cycle_count(inp))
