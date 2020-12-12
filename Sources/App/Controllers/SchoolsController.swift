import Foundation
import Vapor

final class SchoolsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let logsRoute = routes.grouped("api", "schools")
        logsRoute.post(use: createHandle)
        logsRoute.get(use: getAllHandler)
    }

    func createHandle(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let item = try req.content.decode(School.Public.self)
        let log = School(school: item)
        return log.create(on: req.db).transform(to: HTTPStatus.ok)
    }
    
    func getAllHandler(_ req: Request) throws -> EventLoopFuture<[School]> {
        return School.query(on: req.db).all()
    }
}
