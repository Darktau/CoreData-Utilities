import CoreData

extension NSManagedObjectContext {
    func fetch<T:NSManagedObject>(
        _ entityType:T.Type,
        for predicate:NSPredicate? = nil,
        sorting bySort:[NSSortDescriptor] = [],
        includePending:Bool = false,
        limit:Int? = nil
    ) -> [T] {
        
        let entityName = String(describing: entityType)
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: self)
        let request = NSFetchRequest<T>(entityName: entityName)
        request.entity = entity
        request.predicate = predicate
        request.sortDescriptors = bySort
        if limit != nil {
            request.fetchLimit = limit!
        }
        request.includesPendingChanges = includePending
        do {
            return try fetch(request)
        } catch {
            return []
        }
    }
    
    func count<T:NSManagedObject>(
        _ entityType:T.Type,
        for predicate:NSPredicate? = nil,
        includePending:Bool = true
    ) -> Int {
        
        let entityName = String(describing: entityType)
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: self)
        let request = NSFetchRequest<T>(entityName: entityName)
        request.entity = entity
        request.predicate = predicate
        request.includesPendingChanges = includePending
        do {
            return try count(for: request)
        } catch {
            return 0
        }
    }
}
