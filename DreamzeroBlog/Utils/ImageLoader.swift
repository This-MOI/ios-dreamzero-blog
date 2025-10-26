//
//  ImageLoader.swift
//  DreamzeroBlog
//
//  Created by dreamzero on 2025/10/24.
//
import UIKit
import Kingfisher

class ImageLoader {
    
    // 使用Kingfisher加载图像
    func loadImage(from url: String, into imageView: UIImageView) {
        guard let imageURL = URL(string: url) else {
            LogTool.shared.error("Invalid URL: \(url)")
            return
        }
        
        // 使用Kingfisher加载并缓存图像
        imageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "placeholder"), options: [.cacheOriginalImage]) { result in
            switch result {
            case .success(let value):
                LogTool.shared.info("[ImageLoader] Image loaded successfully: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                LogTool.shared.error("[ImageLoader] Error loading image: \(error.localizedDescription)")
            }
        }
    }
    
    // 清除缓存
    func clearCache() {
        ImageCache.default.clearMemoryCache()
        ImageCache.default.clearDiskCache()
        LogTool.shared.info("[ImageLoader] Cache cleared")
    }
    
    // 获取缓存的图像，使用 async/await
    func getCachedImage(from url: String) async -> UIImage? {
        guard let imageURL = URL(string: url) else {
            LogTool.shared.error("[ImageLoader] Invalid URL: \(url)")
            return nil
        }
        
        do {
            // 异步获取缓存图像
            if let cachedImage = try await ImageCache.default.retrieveImageInDiskCache(forKey: imageURL.absoluteString) {
                LogTool.shared.info("[ImageLoader] Image found in cache: \(imageURL.absoluteString)")
                return cachedImage
            } else {
                LogTool.shared.info("[ImageLoader] Image not found in cache: \(imageURL.absoluteString)")
                return nil
            }
        } catch {
            LogTool.shared.error("[ImageLoader] Error retrieving image from cache: \(error.localizedDescription)")
            return nil
        }
    }
}

