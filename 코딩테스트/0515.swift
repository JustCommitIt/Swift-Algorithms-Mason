//
//  0515.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/16.
//

import Foundation

func run0515() {
  var matrix: [[Int]] = [[3, 6, 5],
                         [4, 2, 6],
                         [8, 1, 5]]
  var trails: [Int] = []
  
  for r in (0...2) {
    for c in (0...2) {
      trails.append(matrix[r][c])
    }
  }
  print(trails)
  
  trails = []
  for r in(0...2) {
    for c in stride(from: 2, to: -1, by: -1) {
      trails.append(matrix[r][c])
    }
  }
  print(trails)
  
  trails = []
  for r in (0...2) {
    if r % 2 == 0 {
      for c in (0...2) {
        trails.append(matrix[r][c])
      }
    } else {
      for c in stride(from: 2, through: 0, by: -1) {
        trails.append(matrix[r][c])
      }
    }
  }
  print(trails)
  
  matrix = [[3, 6, 5],
            [4, 2, 6],
            [8, 1, 5]]
  var transformedMatrix = matrix
  
  for row in (0..<matrix.count) {
    for column in (0..<matrix.first!.count) {
      transformedMatrix[row][column] = matrix[column][row]
    }
  }
  
  print(transformedMatrix)
  //[[3, 4, 8],
  // [6, 2, 1],
  // [5, 6, 5]]
  
  print("-------------------------------------------------------")
  
  // ✨ 4가지 동서남북의 방향을 정의!
  let deltaRow = [-1, 1, 0, 0] // deltaRow - 행 (줄을 아래로)
  let deltaColumn = [0, 0, -1, 1] // deltaColumm - 열 (요소를 우측으로)
  // 상, 하, 좌, 우
  
  // 초기 위치 설정
  let row = 1, column = 1
  
  let map = [[1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]]
  
  for index in (0..<4) {
    let newRow = row + deltaRow[index]
    let newColumn = column + deltaColumn[index]
    print(map[newRow][newColumn])
  }
  
  /** 복습
   let a = (0..<4)
   
   
   let dr = [-1, 1, 0, 0]
   let dc = [0, 0, -1, 1]
   
   let map = [[1, 2, 3],
   [4, 5, 6],
   [7, 8, 9]]
   
   let r = 1, c = 1
   for i in 0..<4 {
   let nr = r + dr[i]
   let nc = c + dc[i]
   print(map[nr][nc])
   }
   */
  
  
  // ✨ 비트연산자 - &, |
  // & - 교집합, | - 합집합
  let number1: Int8 = 0b111101
  let number2: Int8 = 0b101001
  let andExpectation: Int8 = 0b101001
  let orExpectation: Int8 = 0b111101
  print(number1 & number2, andExpectation) // 0b101001
  print(number1 | number2, orExpectation) // 0b111101
  
  let setA: Set<Int> = [1, 2, 3, 4, 5]
  let setB: Set<Int> = [4, 5, 6, 7]
  print(setA.union(setB)) // 합집합
  print(setA.intersection(setB)) // 교집합
  
  let array1 = [1, 2, 3, 4, 4]
  let array2 = [2, 3, 5, 5, 6]
  
  let set2 = Set(array2)
  let filteredArray1 = array1.filter {
    !set2.contains($0)
  }
  print(filteredArray1)
  
  
  print("---------------부분집합 구하기----------------")
  
  let letters = ["a", "b", "c"]
  
  for i in 0..<(1 << letters.count) {
    var selected: [String] = []
    for j in 0..<letters.count {
      if (i & (1 << j)) != 0 {
        selected.append(letters[j])
      }
    }
    print(selected)
  }
  
  
  
  
  
  
  
  
  print("---------------------------------------")
  // 깍두기 게임 풀이...
  // 배열에서 딱 혼자서만 존재하는 요소를 출력하라.
  // ex) [1, 1, 3, 2, 2] 이면 3을 출력
  // ex) [1, 77, 34, 23, 34, 23, 1] 이면 77을 출력
  
  var players = [1, 50, 34, 23, 34, 23, 1]
  
  // 풀이 1. 딕셔너리 활용 - 갯수가 1인 것을 출력하게끔
  var playCount: [Int: Int] = [:]
  Set(players).forEach {
    playCount[$0] = 0
  }
  
  players.forEach {
    playCount[$0]! += 1
  }
  
  let kakdugi = playCount.first { key, value in
    value == 1
  }?.key
  
  print(kakdugi!)
  
  // 풀이 2.
  // 배열을 sort 하고, 처음으로 앞뒤의 숫자가 모두 다른 요소를 출력
  let sortedPlay = players.sorted()
  
  for i in (1..<sortedPlay.count - 1) {
    if (sortedPlay[i - 1] != sortedPlay[i]) && (sortedPlay[i] != sortedPlay[i + 1]) {
      print(sortedPlay[i])
      break
    }
    
    // 마지막 요소에 도달했다면, 걔가 깍두기인 것
    if i == sortedPlay.count - 2 {
      print(sortedPlay.last!)
    }
  }
  
  // 풀이 3.
  // [1, 1, 2, 2, 3]
  // Set으로 만들고, 그 요소를 원래의 play에서 뺀 다음,
  // [1, 2, 3]
  // 남은 요소를 원래의 play에서 빼는 방식..?
  // [1, 2]
  var removePlay = players
  var setPlay = Array(Set(players))
  setPlay.forEach {
    removePlay.remove(at: removePlay.firstIndex(of: $0)!)
  }
  // 삭제할 기준이 되는 것
  let standard = Set(removePlay)
  
  let kkak = players.filter {
    !standard.contains($0)
  }.first!
  print(kkak)
  
  // ✨ XOR 풀이법
  var answer = 0
  
  for player in players {
    answer ^= player
  }
  
  print(answer)
  // [1, 1, 5, 0, 0]

}
