//
//  0523 - 순열 : 조합.swift
//  코딩테스트
//
//  Created by Mason Kim on 2023/05/23.
//

import Foundation

func run0523() {
//  let arr = ["A", "B", "C"]
  
  // 조합 Combination 계산 (3개 중에 순서/중복없이 2개 뽑기)
//  for i in 0..<arr.count {
//    for j in i+1..<arr.count {
//      print(arr[i], arr[j])
//    }
//  }
//
//  // 순열 _ for문 (무지성 방식)
//  for i in 0..<arr.count {
//    for j in 0..<arr.count {
//      for k in 0..<arr.count {
//        if i != j && j != k && k != i {
//          print(arr[i], arr[j], arr[k])
//        }
//      }
//    }
//  }
  
  // MARK: - 재귀 방식의 순열 메서드
  
  let array = ["A", "B", "C", "D", "E"]
  let selectionNumber = 3
  
  var sel: [String] = Array(repeating: "", count: selectionNumber)
  var check: [Int] = Array(repeating: 0, count: array.count)
  
  func perm(depth: Int) {
    // 프린트실 _ 마지막 depth에 도달하면 해당 check 를 프린트
    if depth == selectionNumber {
      print(sel)
      return
    }
    
    // 각 경우에 대해서,
    for i in 0..<array.count {
      // 아직 해당 위치를 사용 안한 상태이면 냉큼 사용
      if check[i] == 0 {
        check[i] = 1
        // 현재 위치에 냉큼 알파벳 넣어주고
        sel[depth] = array[i]
        // 한 단계 들어감
        perm(depth: depth + 1)
        // 들어간 depth 에서 나올 때면 초기화
        check[i] = 0
      }
    }
  }
  
  // 첫 뎁스로 들어가서 시작함.
  perm(depth: 0)
}

func 순열_복습(array: [String], number: Int) {
  var sel = Array(repeating: "", count: number)
  var check = Array(repeating: 0, count: array.count)
  
  func perm(depth: Int) {
    if depth == number {
      print(sel)
      return
    }
    
    for i in 0..<array.count {
      if check[i] == 0 {
        check[i] = 1
        sel[depth] = array[i]
        perm(depth: depth + 1)
        check[i] = 0
      }
    }
  }
  
  perm(depth: 0)
}
