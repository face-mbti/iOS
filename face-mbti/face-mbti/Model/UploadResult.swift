//
//  UploadResult.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/29.
//

import Foundation

// 딥러닝 모델로 부터 예측된 결과
struct UploadResult: Decodable {
    enum MBTIType: String, Decodable {
        case entp, entj, enfp, enfj
        case estp, estj, esfp, esfj
        case intp, intj, infp, infj
        case istp, istj, isfp, isfj
    }

    struct MBTI: Decodable {
        let type: MBTIType
        let percent: Int
    }

    struct Random8Types: Decodable {
        let E: Int
        let I: Int
        let N: Int
        let S: Int
        let T: Int
        let F: Int
        let P: Int
        let J: Int
    }

    let mbti: [MBTI]
    let imgPath: String
    let random8types: Random8Types
}
