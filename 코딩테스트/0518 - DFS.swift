//
//  0518 - DFS.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/18.
//

import Foundation

func dfs_0518() {
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
  
  var graph: [Int: [Int]] = [:]
  
  input.forEach { arr in
    let (start, end) = (arr[0], arr[1])
    graph[start, default: []] += [end]
    graph[end, default: []] += [start]
  }
  
  func dfs_인접리스트(graph: [Int: [Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needToVisitStack: [Int] = [start]
    
    while !needToVisitStack.isEmpty {
      let node = needToVisitStack.removeLast()
      if visitedQueue.contains(node) { continue }
      
      visitedQueue.append(node)
      needToVisitStack += graph[node] ?? []
    }
    return visitedQueue
  }
  
  print("Graph: ", graph)
  print("DFS_인접리스트: ", dfs_인접리스트(graph: graph, start: 1))

}

// DFS 함수 정의. 현재 노드와 방문 기록을 인자로 받는다.
func dfs(_ node: Int, _ visited: inout [Bool], _ graph: [[Int]]) {
  // 현재 노드를 방문했다고 표시
  visited[node] = true
  print(node, terminator: " ")
  
  // 인접 노드를 반복하여 방문하지 않은 노드가 있다면 해당 노드에 대해 DFS 수행
  for i in graph[node] {
    if !visited[i] {
      dfs(i, &visited, graph)
    }
  }
}

func run0518_DFS() {
  // 사용 예제
  var visited = [Bool](repeating: false, count: 9)
  let graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
  ]
  dfs(1, &visited, graph)  // 1을 시작점으로 하는 DFS 수행
}
