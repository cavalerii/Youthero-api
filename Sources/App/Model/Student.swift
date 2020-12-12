import Foundation
import Vapor
import Fluent

final class Student: Model, Content {
    static let schema = "student"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .firstName)
    var firstName: String
    
    @Field(key: .lastName)
    var lastName: String
    
    @Children(for: \.$user)
    var reviews: [Review]
    
}

extension FieldKey {
    static var firstName: Self { "first_name" }
    static var lastName: Self { "last_name" }
}
