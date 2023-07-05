# CoreData-Utilitues
Simplify CoreData requests

Here are a few generic functions that can help reduce the amount of code you need to write in your files:

## fetch
Example usage:
context.fetch(Item.self, for:NSPredicate, sortBy:[NSSortDesciptor]) -> [Item]
