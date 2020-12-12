import Foundation
import Fluent

struct AddStudents: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Student.schema)
            .id()
            .field(.firstName, .string, .required)
            .field(.lastName, .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Student.schema).delete()
    }
}
