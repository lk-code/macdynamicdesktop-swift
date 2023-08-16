//
//  WallpaperPackTests.swift
//  MacDynamicDesktopTests
//
//  Created by Lars Krämer on 16.08.23.
//

import XCTest
@testable import MacDynamicDesktop

final class WallpaperPackTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWallpaperPackInitialization() {
        let images = ["image1", "image2", "image3"]
        let previewImage = "previewImage"
        let wallpaperPack = WallpaperPack(name: "Test Pack", images: images, previewImage: previewImage)
        
        XCTAssertEqual(wallpaperPack.Name, "Test Pack")
        XCTAssertEqual(wallpaperPack.Images, images)
        XCTAssertEqual(wallpaperPack.PreviewImage, previewImage)
    }
    
    func testPreviewImageFallbackToFirstImage() {
        let images = ["image1", "image2", "image3"]
        let wallpaperPack = WallpaperPack(name: "Test Pack", images: images)
        
        XCTAssertEqual(wallpaperPack.PreviewImage, "image1")
    }
    
    func testPreviewImageWithCustomFallback() {
        let images = ["image1", "image2", "image3"]
        let wallpaperPack = WallpaperPack(name: "Test Pack", images: images, previewImage: "customPreview")
        
        XCTAssertEqual(wallpaperPack.PreviewImage, "customPreview")
    }
}
