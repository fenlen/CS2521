def carries(lineWithNums)
    splitLine = lineWithNums.split(" ")
    firstNum = splitLine[0].split(//).reverse
    secondNum = splitLine[1].split(//).reverse
    firstNumSize = firstNum.length
    secondNumSize = secondNum.length
    carryCounter = 0
    if firstNumSize >= secondNumSize
        for i in 0..(firstNumSize - 1)
            if (firstNum[i].to_i + secondNum[i].to_i) > 9
                firstNum[i+1] = firstNum[i+1].to_i + 1
                carryCounter += 1
            end
        end
    else
       for i in 0..(secondNumSize - 1)
            if (secondNum[i].to_i + firstNum[i].to_i) > 9
                secondNum[i+1] = secondNum[i+1].to_i + 1
                carryCounter += 1
            end
        end 
    end
    if carryCounter == 0
        puts("No carry operation.")
    elsif carryCounter == 1
        puts("1 carry operation.")
    else
        puts("#{carryCounter} carry operations.")
    end
end


inp = $stdin.read.chomp.split(/\n+/)
inp.each do |line|
    if line == inp.last
        next
    else
        carries(line)
    end
end

