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



func dfs_복습() {
  let inputs = [
    [7, 8],
    [1, 2],
    [1, 3],
    [2, 4],
    [2, 5],
    [4, 6],
    [5, 6],
    [6, 7],
    [3, 7]
  ]
  
  let V = inputs[0][0]
  let E = inputs[0][1]
  var matrix = Array(repeating: Array(repeating: 0, count: V + 1), count: V + 1)
  // 0번 인덱스는 사용하지 않기 위해 +1로 인접행렬 만듬
  
  for i in 1..<E {
    let startIndex = inputs[i][0]
    let endIndex = inputs[i][1]
    matrix[startIndex][endIndex] = 1
    matrix[endIndex][startIndex] = 1
  }
  
  matrix.forEach { print($0) }
  
  var current = 0
  var stack: [Int] = [inputs[1][0]]
  var visited: Set<Int> = []
  var track: [Int] = []
  
  while !stack.isEmpty {
    current = stack.popLast()!
    
    if !visited.contains(current) {
      visited.insert(current)
      track.append(current)
    }
    
    for destination in 1..<E {
      if matrix[current][destination] == 1 && !visited.contains(destination) {
        current = destination
        
        stack.append(destination)
        
      }
    }
  }
  
}
/**
[0, 0, 0, 0, 0, 0, 0, 0]
[0, 0, 1, 1, 0, 0, 0, 0]
[0, 1, 0, 0, 1, 1, 0, 0]
[0, 1, 0, 0, 0, 0, 0, 1]
[0, 0, 1, 0, 0, 0, 1, 0]
[0, 0, 1, 0, 0, 0, 1, 0]
[0, 0, 0, 0, 1, 1, 0, 1]
[0, 0, 0, 1, 0, 0, 1, 0]
 */

// MARK: - 이진 탐색

func binary_search() {
  let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  
  func binary_search(low: Int, high: Int, target: Int) -> Int? {
    if low > high {
      return nil
    }
    
    let mid = (low + high) / 2
    if target == numbers[mid] {
      return mid
    }
    
    if target < numbers[mid] {
      return binary_search(low: low, high: mid - 1, target: target)
    } else { // target > numbers[mid]
      return binary_search(low: mid + 1, high: high, target: target)
    }
  }
  
  print(binary_search(low: 0, high: numbers.count - 1, target: 10)!)
}
