//
//  PredictionResult.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/29.
//

import Foundation

// 딥러닝 모델로 부터 예측된 결과
struct PredictionResult: Codable {
    let entp: Double
    let entj: Double
    let enfp: Double
    let enfj: Double
    let estp: Double
    let estj: Double
    let esfp: Double
    let esfj: Double
    let intp: Double
    let intj: Double
    let infp: Double
    let infj: Double
    let istp: Double
    let istj: Double
    let isfp: Double
    let isfj: Double

    static let dummy = PredictionResult(
        entp: 0.001, entj: 0.002, enfp: 0.003, enfj: 0.004,
        estp: 0.005, estj: 0.006, esfp: 0.007, esfj: 0.008,
        intp: 0.009, intj: 0.01, infp: 0.011, infj: 0.012,
        istp: 0.013, istj: 0.014, isfp: 0.015, isfj: 0.88
    )
}
