import Vapor
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) throws {
    // MARK: - Postgres setup
    if let url = Environment.get("DATABASE_URL") {
        app.databases.use(try .postgres(url: url), as:.psql)
    } else {
        app.databases.use(.postgres(hostname: "localhost", port: 5433, username: "mihaipantiru", password: "test1234", database: "youthero"), as:.psql)
    }
    
    // MARK: - Migrations
    app.migrations.add(AddStudents())
    app.migrations.add(AddSchools())
    app.migrations.add(AddTeachers())
    app.migrations.add(AddReviews())
    try app.autoMigrate().wait()
    
    try routes(app)
}
