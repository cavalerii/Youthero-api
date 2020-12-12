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
    
    init(item: Student.Public) {
        self.firstName = item.firstName
        self.lastName = item.lastName
    }
    
    init() {
        
    }
    
    struct Public: Content {
        var firstName: String
        var lastName: String
    }
}

extension FieldKey {
    static var firstName: Self { "first_name" }
    static var lastName: Self { "last_name" }
}
