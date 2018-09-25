import XCTest
@testable import WorkflowKit

class Tests: XCTestCase {
  func test() {
    let url = Bundle.init(for: type(of: self)).url(forResource: "Flashlight Morse", withExtension: "shortcut")!
    let workflow = Workflow.init(url: url)!
    print(workflow.actions.map({ $0.identifier }))
    XCTAssertEqual(workflow.clientRelease, "2.0")
    XCTAssertEqual(workflow.clientVersion, "702")
    XCTAssertEqual(workflow.icon.glyphNumber, 59845)
    XCTAssertEqual(workflow.icon.imageData.count, 0)
    XCTAssertEqual(workflow.importQuestions.count, 0)
    XCTAssertEqual(workflow.inputContentItemClasses.count, 17)
    XCTAssertEqual(workflow.minimumClientVersion, 411)
    XCTAssertEqual(workflow.types.count, 2)
  }
}

