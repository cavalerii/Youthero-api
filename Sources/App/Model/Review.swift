import Foundation
import Vapor
import Fluent

final class Review: Model, Content {
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: .userID)
    var user: Student
    
    @Field(key: .comment)
    var comment: String?
}

extension FieldKey {
    static var userID: Self { "user_id" }
    static var comment: Self { "comment" }
}
