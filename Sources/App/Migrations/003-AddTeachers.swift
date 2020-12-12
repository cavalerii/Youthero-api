import Foundation
import Fluent

struct AddTeachers: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Teacher.schema)
            .id()
            .field(.firstName, .string, .required)
            .field(.lastName, .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Teacher.schema).delete()
    }
}
