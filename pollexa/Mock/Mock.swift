//
//  Mock.swift
//  pollexa
//
//  Created by Furkan OGUZ on 6.06.2024.
//

import Foundation

struct Poll {
    var avatarImageName: String
    var userName: String
    var lastTime: String
    var lastVotedTime: String
    var contentMessage: String
    var firstLikeImageName: String
    var secondLikeImageName: String
    var totalVotes: Int
}

struct User {
    var avatarImage: String
    var userName: String
}

class MockService {
    func fetchPolls(completion: @escaping ([Poll]) -> Void) {
        let polls = [
            Poll(avatarImageName: "User1", userName: "Lisa Bryant", lastTime: "1h ago", lastVotedTime: "30m ago", contentMessage: "I am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 120),
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),            
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),            
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150),
            Poll(avatarImageName: "User3", userName: "Lisa Bryant", lastTime: "3h ago", lastVotedTime: "2h ago", contentMessage: " am in the middle of these two perfumes. Which one should I buy?", firstLikeImageName: "Option1", secondLikeImageName: "Option2", totalVotes: 200),
            Poll(avatarImageName: "User2", userName: "John Smith", lastTime: "2h ago", lastVotedTime: "1h ago", contentMessage: "Which way would you choose for your next vacation?", firstLikeImageName: "Option3", secondLikeImageName: "Option4", totalVotes: 150)
            
        ]
        completion(polls)
    }
    
    func fetchUser(completion: @escaping (User) -> Void) {
        let user = User(avatarImage: "User1", userName: "Discover")
        completion(user)
    }
}
