//
//  SwiftUI+AlamofireImage.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/10.
//

import SwiftUI
import Combine
import AlamofireImage

let imageDownloader = ImageDownloader(
    configuration: ImageDownloader.defaultURLSessionConfiguration(),
    downloadPrioritization: .fifo,
    maximumActiveDownloads: 4,
    imageCache: AutoPurgingImageCache()
)

extension ImageDownloader {
    func image(for url: URL) -> AnyPublisher<UIImage?, Never> {
        return Future { subscriber in
            let urlRequest = URLRequest(url: url)
            imageDownloader.download(urlRequest, completion: { response in
                if let image = try? response.result.get() {
                    subscriber(.success(image))
                }
            })
        }
        .eraseToAnyPublisher()
    }
}

struct RemoteImage: View {
    let url: URL
    init(url: URL) {
        print("RemoteImage created \(url)")
        self.url = url
    }

    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
            }
        }
        .bind(imageDownloader.image(for: url), to: $image)
    }
}

extension View {
    func bind<P: Publisher, Value>(
        _ publisher: P,
        to state: Binding<Value>
    ) -> some View where P.Failure == Never, P.Output == Value {
        return onReceive(publisher, perform: { value in
            state.wrappedValue = value
        })
    }
}

#if DEBUG
struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: URL(string: "https://s3-alpha-sig.figma.com/img/76b7/1117/896a72c6ac7c7d6ffa65a81c26cb0633?Expires=1618790400&Signature=VDzy7AVm4Yj8ZXW3~BAuUW3JxAXjPTW9pqF9XYFE8Wlod098B~~UnPoSQKFs5qGINqdKzCRTmjVF4xr3KdI9rLvhEy4PC5e9lFCaJWle3DlYFt1GNfjvhVUyZP1qpDdJuXiOptkdOHf7YodfaTqXnbCM9buX9b84HRcnTyO8sgew9gKVYQ3cx-D~7T68FK7KNtmHSvHt0~ymYPNNtDZktiLpLbX-KIhbpPHrpb2SgOXRgzHswiZPr4a1R8uwVvZau-CdRI43KpgUHpBaInWE69Fev9qK8QtqwSAahqkWfhOoT8QUG72jQrbW5dE-3h2UyQpx1vz-g~F67CNbrUNWZw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")!)
    }
}
#endif
