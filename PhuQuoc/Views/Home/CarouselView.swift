//
//  CarouselView.swift
//  PhuQuoc
//
//  Created by Aleksander Pankow on 13/06/2023.
//

import SwiftUI

struct CarouselView: View {
    @State var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    @State var images: [String] = ["https://picsum.photos/200","https://picsum.photos/200","https://picsum.photos/200"]
    var body: some View {
        HStack{
                ForEach(0..<images.count, id: \.self){ index in
                    AsyncImage(url: URL(string: images[index])) { image in
                        image
                            .resizable()
                            .frame(width: .infinity, height:250)
                            .cornerRadius(25)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                            //.offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y:0)
                    } placeholder: {
                        ProgressView()
                    }
                }
        }
        .gesture(
            DragGesture()
                .onEnded({ value in
                    let treshold: CGFloat = 50
                    if value.translation.width > treshold {
                        withAnimation{
                            currentIndex = max(0, currentIndex - 1)
                        }
                    } else if value.translation.width < -treshold {
                        withAnimation{
                            currentIndex = min(images.count - 1, currentIndex + 1)
                        }
                    }
                })
        )
    }
}


struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
