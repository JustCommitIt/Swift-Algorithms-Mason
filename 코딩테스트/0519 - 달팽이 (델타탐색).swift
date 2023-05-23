//
//  0519 - 달팽이.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/19.
//

import Foundation

// MARK: - 달팽이 문제 (델타탐색)

func run0519_달팽이() {
  //  let numberOfTestCase = Int(readLine()!)!
  let numberOfTestCase = 1
  //  1...numberOfTestCase
  for _ in 0..<numberOfTestCase {
    //    let snailSize = Int(readLine()!)!
    let snailSize = 5
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: snailSize), count: snailSize)
    
    let drX = [1, 0, -1, 0]
    let drY = [0, 1, 0, -1]
    //우, 하, 좌, 상
    var drIndex = 0
    
    var (x, y) = (0, 0)
    
    matrix[0][0] = 1
    
    var mark = 1
    
    while mark < (snailSize * snailSize) {
      
      // 달팽이가 다음으로 가려는 X,Y 지점 위치
      let nextX = x + drX[drIndex]
      let nextY = y + drY[drIndex]
      
      // 가려는 범위가 벗어나면 (너무 크거나 작으면)
      if nextX > snailSize - 1 || nextY > snailSize - 1 || nextX < 0 || nextY < 0 {
        // 방향을 바꿔라
        drIndex = (drIndex + 1) % 4
        continue
      }
      
      // 가려는 곳이 이미 차있으면
      if matrix[nextY][nextX] != 0 {
        // 방향을 바꿔라
        drIndex = (drIndex + 1) % 4
        continue
      }
      
      // 조건에 모두 충족됐으면, (범위를 벗어나지 않고, 가려는 곳이 비어있으면)
      x = nextX
      y = nextY
      
      // 마크를 더하고 숫자를 박아넣어라
      mark += 1
      matrix[y][x] = mark
    }
    
    matrix.forEach {
      print($0)
    }
  }
}

/**
 [1,    2,   3,   4,  5]
 [16, 17, 18, 19, 6]
 [15, 24, 25, 20, 7]
 [14, 23, 22, 21, 8]
 [13, 12, 11, 10, 9]
 */

func run0519_달팽이_다른풀이() {
  //  let numberOfTestCase = Int(readLine()!)!
  let numberOfTestCase = 1
  //  1...numberOfTestCase
  for _ in 0..<numberOfTestCase {
    //    let snailSize = Int(readLine()!)!
    let snailSize = 5
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: snailSize), count: snailSize)
    
    let drX = [1, 0, -1, 0]
    let drY = [0, 1, 0, -1]
    //우, 하, 좌, 상
    var drIndex = 0
    
    var (x, y) = (-1, 0)
    
    var mark = 0
    
    for i in stride(from: snailSize * 2, to: 1, by: -1) {
      for _ in 0..<(i / 2) {
        mark += 1
        x += drX[drIndex % 4]
        y += drY[drIndex % 4]
        print(x, y)
        matrix[y][x] = mark
      }
      drIndex += 1
    }
    
    matrix.forEach {
      print($0)
    }
  }
}
