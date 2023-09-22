//
//  TMDbMyAppTests.swift
//  TMDbMyAppTests
//
//  Created by Ruben Alonso on 31/8/23.
//

import XCTest
//Siempre imp esto:
@testable import TMDbMyApp

final class TMDbMyAppUnitTest: XCTestCase {
    var vm: MoviesVM!
    var repository: MovieRepositoryProtocol!

    
//    MARK: Quitamos esta fx - investigar
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
    
//    MARK: Cada test q pongamos aquí son independientes
    
//    Para cda test entra en esta fx para asignar
    override func setUp() async throws {
        repository = MovieRepositoryTest()
        vm = MoviesVM(repository: repository)
    }

//    MARK: Esta fx es la de arriba supongo - investigar(esta fx entra al fin de cada test y resetea)
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

//    MARK: Estas dos fx son ejemplos
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    
    func test_given_getPopularMovies_then_first_page_loaded() async throws {
        
    }
}
    
    

