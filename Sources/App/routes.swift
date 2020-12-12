import Vapor

func routes(_ app: Application) throws {
    // MARK: - Teachers API
    
    let teachersController = TeachersController()
    try app.register(collection: teachersController)
    
    let schoolsController = SchoolsController()
    try app.register(collection: schoolsController)
    
    let reviewsController = ReviewsController()
    try app.register(collection: reviewsController)
    
    let studentsController = StudentsController()
    try app.register(collection: studentsController)
}
