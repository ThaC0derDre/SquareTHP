//
//  ImageViewModel.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import UIKit
import Combine

class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    var urlString : String
    var cancellables = Set<AnyCancellable>()
    let cache = ImageCacheManager.instance
    
    init(urlString: String){
        self.urlString = urlString
        getImage()
    }
    
    func getImage() {
        if let cachedImage = cache.get(name: urlString) {
            image = cachedImage
        } else {
            downloadImages()
        }
        
    }
    
    func downloadImages() {
        
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self]  receivedImage in
                guard
                    let self = self,
                    let unwrappedImage = receivedImage else { return }
                
                self.image = receivedImage
                self.cache.add(image: unwrappedImage, name: self.urlString)
            }
            .store(in: &cancellables)
    }
}
