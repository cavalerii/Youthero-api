import Foundation
import Fluent

struct AddReviews: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Review.schema)
            .id()
            .field(.userID, .uuid, .required)
            .foreignKey(.userID, references: Student.schema, .id, onDelete: .cascade, onUpdate: .cascade)
            .field(.comment, .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Review.schema).delete()
    }
}
