//
//  HomeVMProtocols.swift
//  pollexa
//
//  Created by Furkan OGUZ on 5.06.2024.
//

import Foundation

protocol HomeVMProtocol {
    var delegate: HomeVMDelegate? { get set }
    var polls: [Poll] { get set }
    var user: User? { get set }
    func updateActivePolls()
    func fetchData()
}

protocol HomeVMDelegate: AnyObject {
    func handleVMOutput(_ output: HomeVMOutput)
}

enum HomeVMOutput {
    case userFetched(User)
    case pollsFetched([Poll])
    case activePollsFetched(ActivePollsViewModel)
}
