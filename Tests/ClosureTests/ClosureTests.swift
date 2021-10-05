import XCTest
@testable import Closure

final class ClosureTests: XCTestCase {
  func testClosure() throws {
    let noStateCount = Closure<String, String> { text in
      String(repeating: text, count: 4)
    }
    .then { string in
      Int(string) ?? 0
    }
    
    
    XCTAssertEqual(noStateCount.method("5"), 5555)
    XCTAssertEqual(noStateCount.method("5"), 5555)
    XCTAssertEqual(noStateCount.method("5"), 5555)
  }
  
  func testStateClosure() throws {
    let stateCount: Closure<String, Int> = Closure<String, String> {
      var count = 1
      
      return { text in
        defer {
          count += 1
        }
        
        return String(repeating: text, count: count)
      }
    }
    .then { string in
      Int(string) ?? 0
    }
    
    XCTAssertEqual(stateCount.method("5"), 5)
    XCTAssertEqual(stateCount.method("5"), 55)
    XCTAssertEqual(stateCount.method("5"), 555)
  }
}
