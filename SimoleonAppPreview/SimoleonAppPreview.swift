//
//  SimoleonAppPreview.swift
//  SimoleonAppPreview
//
//  Created by Dennis Concepción Martín on 17/8/21.
//

import XCTest

class SimoleonAppPreview: XCTestCase {
    
    override func setUpWithError() throws {
        // This method is called before the invocation of each test method in the class.
        if UIDevice.current.userInterfaceIdiom == .pad {
            XCUIDevice.shared.orientation = .landscapeLeft
        }
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // This method is called after the invocation of each test method in the class.
    }

    func recordInteraction(of app: XCUIApplication) {
        app.launch()
        
        // Write amount in textfield
        app.textFields["ConversionTextField"].tap()
        app.keys["4"].tap()
        app.keys["5"].tap()
        app.keys["0"].tap()
        app.keys["0"].tap()
        app.keys["0"].tap()
        
        // Tap done to dismiss keyboard
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        // Open currency selector and select USD/BTC
        app.scrollViews.buttons["OpenCurrencySelector"].tap()
        let currencySearchBar = app.textFields["CurrencySearchBar"]
        currencySearchBar.tap()
        currencySearchBar.typeText("Usd/btc\n")
        sleep(1)
        app.tables.buttons.firstMatch.tap()
        sleep(2)
    }
    
    func testUSEnglish() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(en-US)"]
        app.launchArguments += ["-AppleLocale", "\"en-US\""]
        recordInteraction(of: app)
    }
    
    func testSpanish() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(es-ES)"]
        app.launchArguments += ["-AppleLocale", "\"es-ES\""]
        recordInteraction(of: app)
    }
    
    func testGBEnglish() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(en-GB)"]
        app.launchArguments += ["-AppleLocale", "\"en-GB\""]
        recordInteraction(of: app)
    }
    
    func testGerman() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(de-DE)"]
        app.launchArguments += ["-AppleLocale", "\"de-DE\""]
        recordInteraction(of: app)
    }
    
    func testFrench() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(fr-FR)"]
        app.launchArguments += ["-AppleLocale", "\"fr-FR\""]
        recordInteraction(of: app)
    }
    
    func testPortuguese() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(pt-PT)"]
        app.launchArguments += ["-AppleLocale", "\"pt-PT\""]
        recordInteraction(of: app)
    }
    
    func testDutch() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(nl-NL)"]
        app.launchArguments += ["-AppleLocale", "\"nl-NL\""]
        recordInteraction(of: app)
    }
    
    func testItalian() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(it-IT)"]
        app.launchArguments += ["-AppleLocale", "\"it-IT\""]
        recordInteraction(of: app)
    }
    
    func testRussian() throws {
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(ru-RU)"]
        app.launchArguments += ["-AppleLocale", "\"ru-RU\""]
        recordInteraction(of: app)
    }
}
