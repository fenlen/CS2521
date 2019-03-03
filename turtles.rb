inp = $stdin.read.chomp.split(/\n+/)
n = 0
k = inp[0].to_i
(1..k).each do |testCase|
    n += 1
    numberOfLines = inp[n].to_i
    initialArray = inp[n+1..n+numberOfLines]
    initialHash= Hash.new
    targetArray = inp[n+numberOfLines+1.. n+numberOfLines*2]
    targetHash = Hash.new

    for i in 0..(numberOfLines-1)
        targetHash[targetArray[i]] = i
    end
    for i in 0..(numberOfLines-1)
        initialHash[initialArray[i]] = targetHash[initialArray[i]]
    end
    targetHash = targetHash.invert
    initialHash = initialHash.invert
    unsortedStack = initialHash.keys
    sortedStack = targetHash.keys
    steps = 0
    until unsortedStack == sortedStack
        for i in 1..(numberOfLines-1)
            if unsortedStack[i] < unsortedStack[i-1]
                temp = unsortedStack[i]
                unsortedStack.delete_at(i)
                unsortedStack.unshift(temp)
                steps += 1
            end
        end
    end
    puts(steps)
    n += numberOfLines*2 
end

