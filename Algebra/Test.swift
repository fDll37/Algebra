//
//  Test.swift
//  luckyTickets
//
//  Created by Данил Менделев on 09.08.2024.
//
import Foundation




class Test {
    
    struct TimeResult {
        private let start: Date
        private let end: Date
        
        var result: Double {
            end.timeIntervalSince(start)
        }
        
        init(start: Date, end: Date) {
            self.start = start
            self.end = end
        }
    }
    
    enum File: String {
        case input = "in"
        case output = "out"
    }
    
    static let shared: Test = Test()
    private let fileManager = FileManager.default
    private var timeStorage: [TimeResult] = []
    
    private init() {}
    
    func run() {
        checkFibo()
        showTime()
        print("-------------------------------")
        checkPrime()
        showTime()
        print("-------------------------------")
        checkPower()
        showTime()
    }
    
    private func checkFibo() {
        for index in 0...6 {
            let inputTestValue = getDataFrom(path: "Fibo/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let start = Date()
            let result = Algebra.fibonacciIter(n: UInt(inputTestValue)!)
            let end = Date()
            timeStorage.append(TimeResult(start: start, end: end))
            
            let outputTestValue = getDataFrom(path: "Fibo/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: "", options: .caseInsensitive)
            let output = UInt(outputTestValue)!
           
            if result == output {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }

    private func checkPrime() {
        for index in 0...14 {
            let inputTestValue = getDataFrom(path: "Primes/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\r\n", with: "", options: .caseInsensitive)
            
            let start = Date()
            let result = Algebra.eratosphen(n: Int(inputTestValue)!)
            let end = Date()
            timeStorage.append(TimeResult(start: start, end: end))
            
            let outputTestValue = getDataFrom(path: "Primes/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: "", options: .caseInsensitive)
            let output = Int(outputTestValue)!
           
            if result == output {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }

    private func checkPower() {
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Power/test.\(index).\(File.input.rawValue)")
            let dataFromResult = inputTestValue.split(separator: "\r\n")
            
            let start = Date()
            var result = Algebra.powMulti(number: Double(dataFromResult[0])!, x: Int(dataFromResult[1])!)
            let end = Date()
            timeStorage.append(TimeResult(start: start, end: end))
           
            if Double(Int(result)) != result {
                if index == 5 {
                    result = Double(String(format: "%.10f", result)) ?? 0.0
                } else {
                    result = Double(String(format: "%.11f", result)) ?? 0.0
                }
            }
            
            let outputTestValue = getDataFrom(path: "Power/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: "", options: .caseInsensitive)
            let output = Double(outputTestValue)!
            
            if result == output {
                print("Test №\(index) in: \(dataFromResult[0]) to \(dataFromResult[1]) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    private func getDataFrom(path: String) -> String {
        
        if fileManager.fileExists(atPath: path) {
            do {
                let fileContents = try String(contentsOfFile: path, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
                return "-2"
            }
        } else {
            print("File does not exist")
            return "-1"
        }
    }
    
    private func showTime() {
        
        for (index, time) in timeStorage.enumerated() {
            print("test №\(index) выполнен за \(time.result)")
        }
        
        timeStorage = []
    }
}






