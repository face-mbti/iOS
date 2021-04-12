//
//  ResultView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import SwiftUIX
import AlamofireImage

struct ResultTabView: View {
    @State var isSheet = false

    let sampleTexts = [
        "개인주의자",
        "이상주의자의 면모가 강함",
        "이해심이 많고 적응력이 좋음",
        "관대하고 개방적인편",
        "애정표시를 직접적으로 하지 못하는 편",
        "다수보단 소수의 특별한 사람들 선호",
        "도덕적인 것과 비도덕적인 것에 민감하게 반응",
        "책과 언어에 관심이 많고 표현력이 좋음",
        "사업과는 인연이 멀다"
    ]

    let imageURLs = [
        "https://s3-alpha-sig.figma.com/img/9f0e/20b4/b07f6a98e8abb2b4b7e43af31b429e83?Expires=1618790400&Signature=Nv6U-nGajfkrTjfNrSDCqVACs08bNUO9AUzxtGghGji5Aa3nbyUNf8kG9UazO1UMS8fZuTW5unRaRv1yiOjnfmOClzqaAKI3z58kHQY32upC3lUW5SElIU1Ds3YjwFxhBptuErrVQ9q3XKoV087dyG14ShI14RI8brL19ybEMnQwDa-UHpeloeubotzEUC0vVW4CLZoCbLxWzeIogdBdu5QI1iQbl2-shCfCFz74PM8JxEvG5suTHKYcKsO4pi0yC2BTcvNsmeTilKlsXJ5xkk6CF-8vxc6kCDvUPo8S8woR694BZa~IaDGXyUbMkPrbtvNtTZXFiEEBR9MUt7n8Iw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA", "https://s3-alpha-sig.figma.com/img/ffb3/93bd/83cce65688f5fd7e674489b00d6b6c0f?Expires=1618790400&Signature=MCqU5M2fvGb6wcPLfFWpFP5hnFQuf7ZCCuQU6hSa31rDgWNVSSgE6m1y3nPEUPxMYf3Utmu6CL8pUZ21-4tIcGB4vSKD0XdL4xsw99Tg4V29G1JrfG2W~HbE-MglBIKalTaWWiLsOJ1wGS1d67A5Qv-cW9eesOCYsOnzm1nkJmee1CTFiZj4mi6HRKvJQy6~2X3l4kR4qYFKF-QGlTf7~pXSKPXyjHgzKmTM2mToni7xw3vfjBECHf80pw93Lbwcntu2EgEH2CXwzMIpnbX-XRnJfRbAmIsKPzmpWoRibIusYUQl6Uu~2mIlQdXZXwcms3KWjOYNnA6ir2y9mRYlXQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        "https://s3-alpha-sig.figma.com/img/5822/3a96/ab151278121af29f5e898c6af30f00e6?Expires=1618790400&Signature=BJkBjoUMRDXgKPOao-gJ4e2BcPgFtehPXtVva7OWwQoRvwkJyWotLdODVchv7h8E4KrGUfSSDIB~VGMgXoFPT0pkzfeA9PW6pDK9lqBiBBZLSk0PSrrMpMtjZ-Q-ThV6KdzWBbcHA-hUVNO0Nb-IrxPwCJewlXxCTczCYZHRUL-7kvaDjqd~Z1RuXIGX3Mwb-mR3~NBjpQAKNS9jZ9wbAbK-0NmLP0ACEOXIkZNY5u38ouzbUBjTcYaSJx-cCPIsN1J9XTob6EHHndN9NzRPGn0pywIgDuTukJKBqZh2BA6AJgh2FZkKFq7jtkknZWPdwJDoFa3sy7OgTEwFcMgbGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        "https://s3-alpha-sig.figma.com/img/e863/4d41/1592a2059431cf6c5d8e455e418bd039?Expires=1618790400&Signature=hwPHfkdH469FyzzwxpcupCA8Eol7KRUnueDS6SGplGuX6m7cDzUdsU4LNRuxAI3TnlU~slyTsASZgm4CFiqJBjRh1vhINeUT-gTUdGlfnM6nyFA6ANaGmZJ~xH9-GItfbmme-WRJKzZ24ct9BTqAPOkD0c101Q8X2wSxRNH9TeVSGjbFmEqfsBz4q1p8tr5hwk9P9-7R9DcOneXMx-7d13EvZJP1B~P5GwiwBf5lS6o~rwFgkKkTPcOiXlGs667TKXQbnmrSFHuf~eE9l6gC5jvTaOUPvzaJuKwH5qzyNj18U~nOlCHJkc-~rkzvAzy~2NpGbm7orcoNjMUlsL0h1w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
    ].compactMap { URL(string: $0) }

    var body: some View {
        NavigationView {
            TabView {
                ScrollView {
                    VStack {
                        R.image.sampleProfile.image
                            .resizable()
                            .frame(width: 120, height: 120)
                        Text("감성이 풍부해 보이는 당신은")
                            .font(.helvetica(size: 18))
                        Text("INFP")
                            .font(.helvetica(size: 48)).bold()
                        Text("75%")
                            .font(.helvetica(size: 24))

                        VStack(alignment: .leading) {
                            ForEach(sampleTexts, id: \.self) { text in
                                Text("- \(text)")
                            }
                        }

                        PieChartView(data: [70, 13, 17]).frame(width: 126, height: 126)

                        Button(action: { isSheet = true }, label: { Text("공유하기") })
                            .sheet(isPresented: $isSheet) {
                                AppActivityView(activityItems: ["Hello!"])
                            }

                        Text("나와 같은 MBTI를 가진 사람은 누가 있을까요?")

                        ForEach(imageURLs, id: \.self) { url in
                            RemoteImage(url: url)
                                .frame(width: 150, height: 150)
                        }

                    }
                }

                ResultPredictView(predictionResult: .dummy)
                    .tabItem {
                        Text("Second")
                    }

                ResultCelebrityView()
                    .tabItem {
                        Text("Third")
                    }
            }
        }.navigationBarHidden(true)
    }
}

struct ResultView: View {
    var body: some View {
        VStack {
            ProfileImage(image: R.image.sampleProfile)
        }
    }
}

struct ResultPredictView: View {
    let predictionResult: PredictionResult

    var body: some View {
        Text(predictionResult.jsonString ?? "invalid json!")
    }
}

struct ResultCelebrityView: View {
    var body: some View {
        Text("Celebrity")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTabView()
    }
}
