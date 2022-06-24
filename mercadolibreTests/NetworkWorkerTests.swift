//
//  mercadolibreTests.swift
//  mercadolibreTests
//
//  Created by Cesar Guasca on 24/06/22.
//

import XCTest
import mercadolibre


class NetworkWorkerTests: XCTestCase {
    func test_post_success_complete() async {
        await expectResult(nil, when: (data: makeValidData(), response: nil, error: makeError()))
    }
    
    
    func test_post_should_complete_with_error_when_request_completes_with_error() async {
        await expectResult(NetworkErrors.badRequest, when: (data: nil, response: nil, error: makeError()))
    }
}

extension NetworkWorkerTests {
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> NetworkWorker {
        let sut = NetworkWorker()
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}


extension NetworkWorkerTests {
    func expectResult(_ expectedResult: NetworkErrors?, when stub: (data: Data?, response: HTTPURLResponse?,
                                                                           error: Error?), file: StaticString = #filePath, line: UInt = #line) async {
        let sut = makeSut()
        UrlProtocolStub.simulate(data: stub.data, response: stub.response, error: stub.error)
        let exp = expectation(description: "waiting")
        
        var receivedError: NetworkErrors? = nil
        do {
            let _ = try await sut.callService(url: makeUrl(), dataIn: makeValidData(), method: .postMethod, headers: nil)
        } catch {
            receivedError = error as? NetworkErrors
        }
        
        XCTAssertEqual(expectedResult, receivedError, file: file, line: line)
        
        exp.fulfill()
        wait(for: [exp], timeout: 1)
    }
}
