//
//  0522.swift
//  코딩테스트
//
//  Created br Mason Kim on 2023/05/22.
//

import Foundation

// MARK: - 연속된 1의 갯수 구하기

func run0522() {
  let dr = [-1, 0, 1, 0]
  let dc = [0, 1, 0, -1]
  
  var count = 0
  var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: 7), count: 7)
  
  func dfs(r: Int, c: Int) {
    matrix[r][c] = 0
    count += 1
    
    for i in 0..<4 {
      let newR = r + dr[i]
      let newC = c + dc[i]
      
      if matrix[0].count <= newC || newC < 0 || matrix.count <= newR || newR < 0 {
        continue
      }
      
      if matrix[newR][newC] == 0 {
        continue
      }
      
      dfs(r: newR, c: newC)
    }
  }
  
  let input = [[0,0,0,0,0,1,1],
               [0,0,0,0,0,0,0],
               [0,0,1,1,1,0,0],
               [0,0,1,0,1,1,1],
               [0,1,1,0,0,1,0],
               [0,0,1,1,1,0,0],
               [0,0,0,0,0,0,0]]
  matrix = input
  for i in 0..<input.count {
    for j in 0..<input.count {
      if matrix[i][j] == 1 {
        count = 0
        dfs(r: i, c: j)
        print(count)
      }
    }
  }
}

// MARK: - 단속카메라 (그리디)
/// https://campus.programmers.co.kr/tryouts/81436/challenges?language=python3

func 단속카메라(routes: [[Int]]) -> Int {
  var sortedRoutes = routes.sorted { a, b in
    return b[1] > a[1]
  }
  
  var cameras = Set<Int>()
  
  print("정렬된 경로: \(sortedRoutes)")

  while sortedRoutes.isEmpty == false { // TODO: 이걸로 써야 함
    guard let route = sortedRoutes.first else { return cameras.count }
      // 첫번째로 나간지점을 만나면,
      let camera = route[1]
      cameras.insert(camera)
      print("카메라??: \(camera)")
      
      // 카메라에 걸리는 sortedRoutes 모두 삭제...
      // 여기가 너무 비용이 심할 것 같음 (O(n)임)... 어떻게 최적화해서 삭제할 수 있을까??
      // 삭제를 안해도 된다..???????
      // 살려줘.....
      sortedRoutes = sortedRoutes.filter { route in
        route[0] > camera
      }
      
      print("삭제??: \(sortedRoutes)")
  }
  return cameras.count
}

// MARK: - 송아지 (BFS)
/// https://campus.programmers.co.kr/tryouts/81438/challenges

func 송아지(s: Int, e: Int) -> Int {
  
  // MARK: - BFS 방식... -> 아직 못품
//  let moves = [1, -1, 5]
  
  // 각각의 moves를 반복해보면서 가장 최근에 도달한 움직임의 갯수를 return하면 됨
  // BFS -> 같은 depth 로 움직일 것이기에 최적의 해 보장
  
//  var position = s
//
//  while position != e {
//    var count = 0
//    for i in 0..<3 {
//      dfs(position: &position, step: moves[i])
//    }
//  }
//
//  func dfs(position: inout Int, step: Int) {
//    count += 1
//    position += step
//  }
  
// MARK: - 점화식 방식...
  if s > e { return s - e }

  let distance = e - s
  if distance % 5 == 0 {
    return distance / 5
  }

  if distance % 5 == 4 {
    return distance / 5 + 2
  }

  return distance / 5 + distance % 5
}

func 보석쇼핑(_ gems:[String]) -> [Int] {
  let count = Set(gems).count
  print(gems, count)
  
  var startIndex = 0
  var endIndex = 0
  
  while true {
    if Set(gems[startIndex...endIndex]).count == count {
      break
    }
    endIndex += 1
  }
  
  while true {
    if Set(gems[startIndex...endIndex]).count != count {
      break
    }
    startIndex += 1
  }
  startIndex -= 1
  
  return [startIndex + 1, endIndex + 1] // 번째 이므로
}
