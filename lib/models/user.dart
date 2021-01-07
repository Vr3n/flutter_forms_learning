class User {
  static const String PassionCooking = 'cooking';
  static const String PassionHiking = 'hiking';
  static const String PassionTraveling = 'traveling';

  String firstName = '';
  String lastName = '';

  Map<String, bool> passions = {
    PassionCooking: false,
    PassionHiking: false,
    PassionTraveling: false
  };

  bool newsLetter = false;

  save() {
    print("Saving user using a web service!");
  }
}
