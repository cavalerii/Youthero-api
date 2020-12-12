import Foundation
import Vapor

final class ReviewsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let logsRoute = routes.grouped("api", "reviews")
        logsRoute.post(use: createHandle)
        logsRoute.get(use: getAllHandler)
    }

    func createHandle(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let teacherItem = try req.content.decode(Teacher.Public.self)
        let log = Teacher(teacherItem: teacherItem)
        return log.create(on: req.db).transform(to: HTTPStatus.ok)
    }
    
    func getAllHandler(_ req: Request) throws -> EventLoopFuture<[Teacher]> {
        return Teacher.query(on: req.db).all()
    }
}
