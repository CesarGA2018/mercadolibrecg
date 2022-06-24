//
//  HomeWorker.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
protocol HomeWorkingLogic {
    /// Request to API for loading list of users
    func search(q:String) async throws -> SearchDmain
}

final class HomeWorker: HomeWorkingLogic {
    private let autRemote: PostRemote
    private let searchRemote: GetRemote
    private let networkWorked: NetworkWorker
    
    public init(networkWorked: NetworkWorker, autRemote: PostRemote, searchRemote: GetRemote) {
        self.autRemote = autRemote
        self.searchRemote = searchRemote
        self.networkWorked = networkWorked
    }
    
    private let networkWorker: NetworkWorker = NetworkWorker()
    
    func search(q: String) async throws -> SearchDmain {
        async let authResponse = try await authMethod()
        do {
            var paramsCopy = searchRemote.params
            if paramsCopy == nil {
                paramsCopy = [:]
            }
            paramsCopy!["q"] = q
            
            var headersCopy = searchRemote.headers
            if headersCopy == nil {
                headersCopy = [:]
            }
            headersCopy!["Autorization"] = "Bearer \(try await authResponse.accessToken)"
            
            let response = try await networkWorked.callService(url: searchRemote.url, queryItems: paramsCopy, method: .getMethod, headers: headersCopy)
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(SearchDmain.self, from: response.0)
                return decodeData
            } catch {
                print(error)
                throw NetworkErrors.couldNotDecodeData
            }
        } catch {
            throw error
        }
    }
    
    public func authMethod() async throws -> AuthModel {
        do {
            let response = try await networkWorked.callService(url: autRemote.url, dataIn: autRemote.body, method: .postMethod, headers: autRemote.headers)
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(AuthModel.self, from: response.0)
                return decodeData
            } catch {
                print(error)
                throw NetworkErrors.couldNotDecodeData
            }
        } catch {
            throw error
        }
    }
}
