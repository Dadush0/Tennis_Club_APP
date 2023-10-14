This folders contains the models or data.
Each model is in its own file (thumb rule).
A model class contains mainly attributes and a constructor. 
The function should only be function to convert the model or attributes in another form 
(e.g. model to json for storage, or Data in different format).
EXAMPLE:
UserModel {
  String name
  String password

  UserModel(this.name, this.password)
}