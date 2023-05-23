//
//  0523 - 순열.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/23.
//

import Foundation

// array에서 number 개 만큼 뽑아서 출력하는 순열 메서드
func 순열(array: [String], number: Int) {
  // 뽑은 것들
  var sel = Array(repeating: "", count: number)
  // 해당 위치를 뽑았는지 체크
  var check = Array(repeating: 0, count: array.count)
  
  func perm(depth: Int) {
    // 프린트실 _ 마지막 depth에 도달하면 해당 check 를 프린트
    if depth == number {
      print(sel)
      return
    }
    
    // 각 배열의 요소들을 반복해서,
    for i in 0..<array.count {
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
}


func 중복순열(array: [String], number: Int) {
  var sel = Array(repeating: "", count: number)
  
  func perm_rep(depth: Int) {
    if depth == number {
      print(sel)
      return
    }
    
    // 체크가 필요없다. -> 중복 체크를 하지 않아도 되기 때문에.
    for i in 0..<array.count {
      sel[depth] = array[i]
      perm_rep(depth: depth + 1)
    }
  }
  
  perm_rep(depth: 0)
}

