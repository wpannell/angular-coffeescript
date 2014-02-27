class Fibonacci
  at: (i) ->
    return 0 if i == 0
    return 1 if i < 3
    return @at(i-1) + @at(i-2)

describe "Fibonacci", ->
  Given -> @fibonacci = new Fibonacci()
  Then -> @fibonacci.at(0) == 0
  Then -> @fibonacci.at(1) == 1
  Then -> @fibonacci.at(2) == 1
  Then -> @fibonacci.at(3) == 2
  Then -> @fibonacci.at(4) == 3
  Then -> @fibonacci.at(5) == 5
  Then -> @fibonacci.at(6) == 8

describe "PrimeFactors", ->
  Given -> @primeFactors = new PrimeFactors()
  Then -> expect(@primeFactors.of(1)).toEqual []
  Then -> expect(@primeFactors.of(2)).toEqual [2]
  Then -> expect(@primeFactors.of(3)).toEqual [3]
  Then -> expect(@primeFactors.of(4)).toEqual [2,2]
  Then -> expect(@primeFactors.of(5)).toEqual [5]
  Then -> expect(@primeFactors.of(6)).toEqual [2,3]
  Then -> expect(@primeFactors.of(7)).toEqual [7]
  Then -> expect(@primeFactors.of(8)).toEqual [2,2,2]
  Then -> expect(@primeFactors.of(9)).toEqual [3,3]
