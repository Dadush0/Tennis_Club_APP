This folder should contain all files that are used to access any datasources.
For example api access, database access etc.
Every souce should be in a different file.
The data received or sent from the sources is processed and stored in the model folder
EXAMPLE:
Api {
      List<CourtModel> getCourts {
            response = https request
            List<CourtModel> courts = CourtModel.fromJson(respnse.body)
      }
}

NOTE: the function fromJson should be implemented within CourtModel.dart