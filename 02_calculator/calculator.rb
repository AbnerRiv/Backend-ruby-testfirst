#write your code here
def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def sum(arr)
    if arr.length == 0
        return 0
    end
    arr.inject{|sum, item| sum + item}
end

def multiply(a,b)
    a * b
end

def multiply(*nums)
    nums.reduce{|result, item| result * item}
end

def power(num, power)
    num ** power
end

def factorial(num)
    if num == 0
        return 1
    end

    if num == 1
        return 1
    end
    num * factorial(num - 1)
end
