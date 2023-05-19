//
//  0518 - DFS재귀.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/18.
//

import Foundation

func dfs_재귀() {
  
  let numInput = [7, 8]
  
  let input = [
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
  let V = numInput[1]
  let E = numInput[0]
  var matrix = Array(repeating: Array(repeating: 0, count: V + 1), count: V + 1)
  
  // ✨ 인접 행렬로 정리...
  for i in 0..<E {
    let start = input[i][0]
    let end = input[i][1]
    
    matrix[start][end] = 1
    matrix[end][start] = 1
  }
  
  // ✨ 방문 했음을 체크하는 Set
  var visited: Set<Int> = []
  var track: [Int] = []
  
  func dfs(_ n: Int) {
    // 방문한 적이 없으면 방문 찍어줌... -> contains가 필요한가..?
    if !visited.contains(n) {
      visited.insert(n)
      track.append(n)
    }
    
    for destination in 0..<E {
      if matrix[n][destination] == 1 && !visited.contains(destination) {
        dfs(destination)
      }
    }
  }
  
  dfs(1)
  print(track)
}

func dfs_재귀_복습() {
  let numInput = [7, 8]
  
  let input = [
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
  let V = numInput[1]
  let E = numInput[0]
  var matrix = Array(repeating: Array(repeating: 0, count: V + 1), count: V + 1)
  
  // ✨ 인접 행렬로 정리...
  for i in 0..<E {
    let start = input[i][0]
    let end = input[i][1]
    
    matrix[start][end] = 1
    matrix[end][start] = 1
  }
  
  var visited: Set<Int> = []
  var track: [Int] = []
  
  dfs_재귀_inner(1)
  
  func dfs_재귀_inner(_ n: Int) {
    
  }
}
