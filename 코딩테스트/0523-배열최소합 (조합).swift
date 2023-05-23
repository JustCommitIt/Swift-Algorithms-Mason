//
//  0523-배열최소합 (조합).swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/23.
//

import Foundation

func 배열최소합() {
  let testCases = Int(readLine()!)!
  
  for testCase in 0..<testCases {
    
    let count = Int(readLine()!)!

    var input: [[Int]] = Array(repeating: Array(repeating: 0, count: count), count: count)
    
    for i in 0..<count {
      let numbers = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
      numbers.enumerated().forEach { j, number in
        input[i][j] = number
      }
    }
    
    var array = (0..<count).map { Int($0) }
    
    var sel = Array(repeating: 0, count: count)
    
    
    // 해당 위치를 뽑았는지 체크
    var check = Array(repeating: 0, count: count)
    
    var sums: Set<Int> = []
    
    func perm(depth: Int) {
      // 프린트실 _ 마지막 depth에 도달하면 해당 check 를 프린트
      if depth == count {
        
        let sum = sel.enumerated().reduce(0) {
          $0 + input[$1.element][$1.offset]
        }
        print(sum)
        sums.insert(sum)
        
        return
      }
      
      // 각 배열의 요소들을 반복해서,
      for i in 0..<count {
        // 아직 체크되지 않은 요소가 있다면 즉시,
        if check[i] == 0 {
          // 사용했다 체크하고
          check[i] = 1
          // 현재 depth에 뽑은 요소를 넣음
          sel[depth] = array[i]
          // 한 단계 더 들어감
          perm(depth: depth + 1)
          // 빠져나오면서 사용한걸 초기화 해줌
          check[i] = 0
        }
      }
    }
    
    // 가장 첫 depth 부터 들어가기 시작해라.
    perm(depth: 0)
    
    print("# \(testCase + 1) \(sums.min()!)")
  }
}
