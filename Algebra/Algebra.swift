import Foundation

class Algebra {
    // Реализовать итеративный O(N) алгоритм возведения числа в степень
    static func powNew(number: Int, x: Int) -> Int {
        var temp: Int = 1
        for element in 1...x {
            temp *= number
        }
        return temp
    }

    //Реализовать рекурсивный O(2^N) алгоритмы поиска чисел Фибоначчи
    static func fibonacci(n: Int) -> Int {
        guard n != 1 else { return 1 }
        guard n != 2 else { return 2 }
        
        return fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }

    // итеративный O(N) алгоритмы поиска чисел Фибоначчи
    static func fibonacciIter(n:  UInt) -> UInt {
        guard n != 0 else {return 0}
        guard n != 1 else {return 1}
        guard n != 2 else {return 1}
        
        var fibOne: UInt = 1
        var fibTwo: UInt = 1
        
        for _ in 2..<n {
            let temp = fibOne
            fibOne = fibTwo
            fibTwo = temp + fibOne
        }
        
        return fibTwo
    }

    // Реализовать алгоритм поиска количества простых чисел через перебор делителей, O(N^2).
    static func getSimpleNumber(to: Int) -> Int {
        guard to != 1 else { return 1 }
        guard to != 2 else { return 2 }
        var count = 1
        var isSimple = true
        
        for number in 2...to {
            for element in 2..<number {
                if number % element == 0 {
                    isSimple = false
                    break
                } else {
                    isSimple = true
                }
            }
            if isSimple {
                count += 1
            }
        }
        return count
    }

    // MIDDLE
    // Реализовать алгоритм возведения в степень через домножение O(N/2+LogN) = O(N)
    static func powMulti(number: Double, x: Int) -> Double {
        guard x != 0 else { return 1 }
        
        if x % 2 > 0 {
            let r = powMulti(number: number, x: x/2)
            return number * r * r
        } else {
            let r = powMulti(number: number, x: x/2)
            return r * r
        }
    }

    // Реализовать алгоритм поиска чисел Фибоначчи по формуле золотого сечения
    static func goldFibonacci(n: Int) -> Double {
        let fi = (1 + sqrt(5)) / 2
        
        let result = pow(fi, Double(n)) / sqrt(5.0) + 0.5
        return floor(result)
    }

    // Реализовать алгоритм поиска простых чисел с оптимизациями поиска и делением только на простые числа, O(N * Sqrt(N) / Ln (N)).
    static private func isPrimeSqrt(n: Int) -> Bool {
        guard n != 2 else { return true }
        guard n % 2 != 0 else { return false }
        
        let sqrt = Int(sqrt(Double(n)))
        for i in stride(from: 3, to: sqrt, by: 2) {
            if n % i == 0 {
                return false
            }
        }
        return true
    }

    static func getCountSimple(to: Int) -> Int {
        guard to != 1 else { return 1 }
        guard to != 2 else { return 2 }
        var count = 1
        
        for number in 3...to {
            count += isPrimeSqrt(n: number) ? 1 : 0
        }
        return count
    }

    // Реализовать алгоритм "Решето Эратосфена" для быстрого поиска простых чисел O(N Log Log N)
    static func eratosphen(n: Int) -> Int {
        guard n >= 2 else { return 0 }
        
        var count = 0
        var prime: [Bool] = Array(repeating: true, count: n + 1)
        prime[0] = false
        prime[1] = false
        
        for index in 2...n {
            if prime[index] {
                count += 1
                for j in stride(from: index * index, through: n, by: index) {
                    prime[j] = false
                }
            }
        }
        return count
    }

}
