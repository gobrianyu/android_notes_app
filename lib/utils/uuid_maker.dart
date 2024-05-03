import 'package:uuid/uuid.dart';

typedef UUIDString = String;

// Class to create a UUID; a unique label to assign
// other objects.
class UUIDMaker{
  static const uuid = Uuid();

  // Generates a UUID;
  // No parameters.
  static UUIDString generateUUID(){
    return uuid.v4();
  }
}