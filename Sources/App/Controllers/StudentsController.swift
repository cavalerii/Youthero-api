import Foundation
import Vapor

final class StudentsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let logsRoute = routes.grouped("api", "students")
        logsRoute.post(use: createHandle)
        logsRoute.get(use: getAllHandler)
    }

    func createHandle(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let item = try req.content.decode(Student.Public.self)
        let log = Student(item: item)
        return log.create(on: req.db).transform(to: HTTPStatus.ok)
    }
    
    func getAllHandler(_ req: Request) throws -> EventLoopFuture<[Student]> {
        return Student.query(on: req.db).all()
    }
}
