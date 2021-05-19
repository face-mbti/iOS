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
        RemoteImage(url: URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")!)
    }
}
#endif
