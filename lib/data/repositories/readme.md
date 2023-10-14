This folder contains the actual implementation and connection between model, datasources and controller.
The presentation is not quite connected with this.
Each model is connected with one repository.
It contains functions to get, add, edit, delete data from the datasources.
EXAMPLE:
EventRepository {
      Api api;

      Future<Either<Failure, Event>> getEvent {
            return api.getEvent("today");
      }

      Future<Either<Failure, Event>> addEvent {
            return api.adEvent(new EventModel(...));
      }
}