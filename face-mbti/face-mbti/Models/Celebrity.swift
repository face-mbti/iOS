//
//  Celebrity.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/11.
//

import Foundation

struct Celebrity: Codable {
    let occupation: String
    let name: String
    let imageURL: URL

    static let dummy: [Celebrity] = [
        .init(occupation: "트와이스", name: "채영", imageURL: URL(string: "https://s3-alpha-sig.figma.com/img/9f0e/20b4/b07f6a98e8abb2b4b7e43af31b429e83?Expires=1618790400&Signature=Nv6U-nGajfkrTjfNrSDCqVACs08bNUO9AUzxtGghGji5Aa3nbyUNf8kG9UazO1UMS8fZuTW5unRaRv1yiOjnfmOClzqaAKI3z58kHQY32upC3lUW5SElIU1Ds3YjwFxhBptuErrVQ9q3XKoV087dyG14ShI14RI8brL19ybEMnQwDa-UHpeloeubotzEUC0vVW4CLZoCbLxWzeIogdBdu5QI1iQbl2-shCfCFz74PM8JxEvG5suTHKYcKsO4pi0yC2BTcvNsmeTilKlsXJ5xkk6CF-8vxc6kCDvUPo8S8woR694BZa~IaDGXyUbMkPrbtvNtTZXFiEEBR9MUt7n8Iw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!),
        .init(occupation: "배우", name: "서강준", imageURL: URL(string: "https://s3-alpha-sig.figma.com/img/ffb3/93bd/83cce65688f5fd7e674489b00d6b6c0f?Expires=1618790400&Signature=MCqU5M2fvGb6wcPLfFWpFP5hnFQuf7ZCCuQU6hSa31rDgWNVSSgE6m1y3nPEUPxMYf3Utmu6CL8pUZ21-4tIcGB4vSKD0XdL4xsw99Tg4V29G1JrfG2W~HbE-MglBIKalTaWWiLsOJ1wGS1d67A5Qv-cW9eesOCYsOnzm1nkJmee1CTFiZj4mi6HRKvJQy6~2X3l4kR4qYFKF-QGlTf7~pXSKPXyjHgzKmTM2mToni7xw3vfjBECHf80pw93Lbwcntu2EgEH2CXwzMIpnbX-XRnJfRbAmIsKPzmpWoRibIusYUQl6Uu~2mIlQdXZXwcms3KWjOYNnA6ir2y9mRYlXQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!),
        .init(occupation: "BTS", name: "정국", imageURL: URL(string: "https://s3-alpha-sig.figma.com/img/5822/3a96/ab151278121af29f5e898c6af30f00e6?Expires=1618790400&Signature=BJkBjoUMRDXgKPOao-gJ4e2BcPgFtehPXtVva7OWwQoRvwkJyWotLdODVchv7h8E4KrGUfSSDIB~VGMgXoFPT0pkzfeA9PW6pDK9lqBiBBZLSk0PSrrMpMtjZ-Q-ThV6KdzWBbcHA-hUVNO0Nb-IrxPwCJewlXxCTczCYZHRUL-7kvaDjqd~Z1RuXIGX3Mwb-mR3~NBjpQAKNS9jZ9wbAbK-0NmLP0ACEOXIkZNY5u38ouzbUBjTcYaSJx-cCPIsN1J9XTob6EHHndN9NzRPGn0pywIgDuTukJKBqZh2BA6AJgh2FZkKFq7jtkknZWPdwJDoFa3sy7OgTEwFcMgbGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!),
        .init(occupation: "배우", name: "민효린", imageURL: URL(string: "https://s3-alpha-sig.figma.com/img/e863/4d41/1592a2059431cf6c5d8e455e418bd039?Expires=1618790400&Signature=hwPHfkdH469FyzzwxpcupCA8Eol7KRUnueDS6SGplGuX6m7cDzUdsU4LNRuxAI3TnlU~slyTsASZgm4CFiqJBjRh1vhINeUT-gTUdGlfnM6nyFA6ANaGmZJ~xH9-GItfbmme-WRJKzZ24ct9BTqAPOkD0c101Q8X2wSxRNH9TeVSGjbFmEqfsBz4q1p8tr5hwk9P9-7R9DcOneXMx-7d13EvZJP1B~P5GwiwBf5lS6o~rwFgkKkTPcOiXlGs667TKXQbnmrSFHuf~eE9l6gC5jvTaOUPvzaJuKwH5qzyNj18U~nOlCHJkc-~rkzvAzy~2NpGbm7orcoNjMUlsL0h1w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!)
    ]
}
