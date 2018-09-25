import XCTest
@testable import WorkflowKit

class Tests: XCTestCase {
  func test() {
    let url = Bundle.main.url(forResource: "Flashlight Morse", withExtension: "shortcut")!
    let workflow = Workflow.init(url: url)!
    print(workflow.actions.map({ $0.identifier }))
    XCTAssertEqual(workflow.clientRelease, "2.0")
    XCTAssertEqual(workflow.clientVersion, "702")
    XCTAssertEqual(workflow.icon.glyphNumber, 59845)
//    XCTAssertEqual(workflow.icon.startColor, UIColor(red: 0.662745, green: 0.662745, blue: 0.662745, alpha: 1))
    XCTAssertEqual(workflow.icon.imageData.count, 0)
    XCTAssertEqual(workflow.importQuestions.count, 0)
    XCTAssertEqual(workflow.inputContentItemClasses.count, 17)
    XCTAssertEqual(workflow.minimumClientVersion, 411)
    XCTAssertEqual(workflow.types.count, 2)
  }
  
  func testUnsafe() {
    let urls = [
      Bundle.main.url(forResource: "Bitcoin Price", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "Check If Email Address Has Been Pwned", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "Get File Size", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "New Link Post in Ulysses", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "PDF from Markdown", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "Siri News Reader", withExtension: "shortcut")!,
      Bundle.main.url(forResource: "Stop Current Toggl Timer", withExtension: "shortcut")!,
    ]
    for url in urls {
      XCTAssertNotNil(Workflow.init(url: url))
    }
    
  }
}

