import Foundation
import Vapor
import Fluent

final class School: Model, Content {
    static let schema = "schools"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .name)
    var name: String
    
    @Field(key: .address)
    var address: String
    
    struct Public: Content {
        var name: String
        var address: String
    }
    
    init(school: School.Public) {
        self.name = school.name
        self.address = school.address
    }
    
    init() {
        
    }
}

extension FieldKey {
    static var name: Self { "name" }
    static var address: Self { "address" }
}
