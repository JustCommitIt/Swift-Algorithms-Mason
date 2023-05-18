//
//  0518.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/18.
//

import Foundation

func run0518() {
//  let trial = Int(readLine()!)!
//  for t in 1...trial {
//    let numberCount = Int(readLine()!)!
//    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
//    print("#\(t) \(numbers.max()! - numbers.min()!)")
//  }
  
  
  // MARK: - SWEA 구간합 문제
  /// https://swexpertacademy.com/main/learn/course/lectureProblemViewer.do
  /**
  let testCase = Int(readLine()!)!
  
  for tc in 1...testCase {
    let counts = readLine()!
      .components(separatedBy: " ")
      .compactMap { Int($0) }
    
    let N = counts.first!
    let M = counts.last!
    
    let numbers = readLine()!
      .components(separatedBy: " ")
      .compactMap { Int($0) }
    
    var sums: [Int] = []
    
    for index in (0..<(numbers.count - M + 1)) {
      let sum = (index..<(index + M)).reduce(into: 0) { result, i in
        result += numbers[i]
      }
      sums.append(sum)
    }
    let difference = sums.max()! - sums.min()!
    
    print("#\(tc) \(difference)")
   */
    
  // MARK: - 구간합 문제 최적화 - 슬라이딩 도어 적용
  let testCase = Int(readLine()!)!
  
  for tc in 1...testCase {
    let counts = readLine()!
      .components(separatedBy: " ")
      .compactMap { Int($0) }
    
    let (arrayCount, rangeCount) = (counts[0], counts[1])
    
    let numbers = readLine()!
      .components(separatedBy: " ")
      .compactMap { Int($0) }
    
    var windowSum = numbers[0..<rangeCount].reduce(0, +)
    var (maxSum, minSum) = (windowSum, windowSum)

    // 이렇게 하면 매번 M * N 번을 계산할 필요가 없으므로, N번만 계산하면 된다
    for index in rangeCount..<arrayCount {
      windowSum += numbers[index] - numbers[index - rangeCount]
      maxSum = max(windowSum, maxSum)
      minSum = min(windowSum, minSum)
    }
    
    print("#\(tc) \(maxSum - minSum)")
  }
}
