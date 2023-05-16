//
//  0516.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/16.
//

import Foundation

func run0516() {
  
  // MARK: - DFS = Stack
  
  /** input은 이처럼 들어올 수 있다.
   Vertex = 7개, Edge = 8개인 그래프가 있을 때, 다음 8개의 줄에 연결 정보를 제공
   1 2 // 1과 2가 연결되어 있음...  */
  //7 8 첫줄은 정보 제공
  //1 2
  //1 3
  //2 4
  //2 5
  //4 6
  //5 6
  //6 7
  //3 7
  
  let input = [
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
  
  // ✨ 인접행렬을 위한 8 * 8 의 기본 2차배열 판을 만듬 (n번째 숫자에 쉽게 접근하기 위해 n+1 로 생성)
  let V = input[0][1]
  let E = input[0][0]
  var matrix = Array(repeating: Array(repeating: 0, count: V + 1), count: V + 1)
  
  // ✨ 인접 행렬로 정리...
  for i in 0..<E {
    let start = input[i][0]
    let end = input[i][1]
    
    matrix[start][end] = 1
    matrix[end][start] = 1
  }
  
  matrix.forEach {
    print($0)
  }
  
  // ✨ 방문 했음을 체크하는 Set
  var visited: Set<Int> = []
  var track: [Int] = []
  // ✨ 현재 방문한 포도알
  var current = 0
  // ✨ 시작점을 1번 포도알로 지정함!
  var stack: [Int] = [1]
  
  while !stack.isEmpty {
    current = stack.popLast()!
    
    // 방문한 적이 없으면 방문 찍어줌... -> contains가 필요한가..?
    if !visited.contains(current) {
      visited.insert(current)
      track.append(current)
    }
    
    for destination in 1..<E {
      if matrix[current][destination] == 1 && !visited.contains(destination) {
        stack.append(destination)
      }
    }
  }
  
  print("방문경로", track)
  
  
  
  // MARK: - BFS = Queue
  
}


func dfs_0516_복습() {
}




// MARK: - 신고 결과 받기
// https://campus.programmers.co.kr/tryouts/81433/challenges?language=swift
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
  // 신고 기록 딕셔너리 _ 키가 신고당한 사람, 밸류는 신고한 사람의 명단 Set
  var reports: [String: Set<String>] = [:]
  var letterCountDicts: [String: Int] = [:]
  id_list.forEach {
    reports[$0] = []
    letterCountDicts[$0] = 0
  }
  
  Set(report).forEach {
    let splited = $0.components(separatedBy: " ").map { String($0) }
    let reporter = splited[0]
    let reported = splited[1]
    reports[reported]!.insert(reporter)
  }
  
  var letterCounts: [Int] = []
  // 밴당한 유저: ["frodo", "neo"]
  id_list.forEach { id in
    if reports[id]!.count >= k {
      // id는 밴당한거임
      reports[id]!.forEach {
        letterCountDicts[$0]! += 1
      }
    }
  }
  
  id_list.forEach { id in
    letterCounts.append(letterCountDicts[id]!)
  }
  
  return letterCounts
}
