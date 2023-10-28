//
//  ProtocolOrientedProjectTests.swift
//  ProtocolOrientedProjectTests
//
//  Created by Şule Kaptan on 28.10.2023.
//

import XCTest
@testable import ProtocolOrientedProject

final class ProtocolOrientedProjectTests: XCTestCase {
    
    private var viewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    

    override func setUpWithError() throws {
        userService = MockUserService()
        viewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        viewModel.delegate = output
    }

    override func tearDownWithError() throws {
        viewModel = nil
        userService = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameEmail() throws {
        //given -when-then
        let mockUser = User(id: 1, name: "Şule", username: "sulekaptan", email: "sule@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        viewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.count, 1)
        XCTAssertEqual(output.updateViewArray.first?.name, "Şule")
        XCTAssertEqual(output.updateViewArray.first?.username, "sule@gmail.com")
        
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        viewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
    }

    class MockUserService : UserService {
        var fetchUserMockResult : Result<ProtocolOrientedProject.User, Error>?
        
        func fetchUser(completion: @escaping (Result<ProtocolOrientedProject.User, Error>) -> ()) {
            if let result = fetchUserMockResult {
                completion(result)
            }
        }
    }
    
    class MockUserViewModelOutput : UserViewModelOutput {
        var updateViewArray : [(name:String, username:String, email:String)] = []
        func updateView(name: String, username: String, email: String) {
            updateViewArray.append((name,email,username))
        }
    }

}
