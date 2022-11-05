//
//  ImageView.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct ImageView: View {
    @StateObject var vm : ImageViewModel
    
    init(urlString: String) {
         _vm = StateObject(wrappedValue: ImageViewModel(urlString: urlString))
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            } else {
                placeHolderImage()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}

extension ImageView {
    private func placeHolderImage()  -> some View {
        ZStack{
            Circle()
                .overlay(Circle()
                    .stroke()
                    .background(.gray))
                .clipShape(Circle())
                .frame(width: 75, height: 75)
            Image(systemName: "person.fill")
                .resizable()
                .padding()
                .clipShape(Circle())
                .frame(width: 75, height: 75)
        }
    }
}
