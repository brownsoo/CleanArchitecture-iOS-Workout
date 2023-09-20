//
//  AppStoreSampleUITests.swift
//  AppStoreSampleUITests
//
//  Created by hyonsoo on 2023/09/17.
//

import XCTest

final class KabangExamUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    /// 최근 검색 저장, 가져오기 테스트
    func testSaveAndGetRecents() async {
        let defaults = UserDefaults(suiteName: "testing")!
        defaults.removeObject(forKey: DefaultRecentsStorage.theKey)
        
        let storage = DefaultRecentsStorage(store: defaults)
        let list = await storage.findRecents(searchTerm: "abc")
        XCTAssertTrue(list.isEmpty)
        
        await storage.saveRecent(searchTerm: "abc")
        await storage.saveRecent(searchTerm: "bcd")
        let list2 = await storage.findRecents(searchTerm: "abc")
        XCTAssertEqual(list2.count, 1)
        
        await storage.saveRecent(searchTerm: "abc")
        await storage.saveRecent(searchTerm: "bcd")
        let list3 = await storage.findRecents(searchTerm: "fgh")
        XCTAssertEqual(list3.count, 0)
        
    }
}
