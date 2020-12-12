import Foundation
import Vapor
import Fluent
import Crypto

final class Teacher: Model, Content {
    static let schema = "teachers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .firstName)
    var firstName: String
    
    @Field(key: .lastName)
    var lastName: String
    
    init(teacherItem: Teacher.Public) {
        self.firstName = teacherItem.firstName
        self.lastName = teacherItem.lastName
    }
    
    init() {
        
    }
    
    struct Public: Content {
        var firstName: String
        var lastName: String
    }
}
