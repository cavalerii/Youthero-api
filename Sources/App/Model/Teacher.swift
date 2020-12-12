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
}
