import Foundation
import Fluent

struct AddSchools: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(School.schema)
            .id()
            .field(.name, .string, .required)
            .field(.address, .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(School.schema).delete()
    }
}
