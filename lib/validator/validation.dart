class TValidator {
  static String? checkEmptyField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null; // Valid email
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone number cannot be empty";
    }
    final phoneRegex =
        RegExp(r'^[0-9]{10}$'); // Validates a 10-digit phone number
    if (!phoneRegex.hasMatch(phone)) {
      return "Enter a valid 10-digit phone number";
    }
    return null; // Valid phone number
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Name cannot be empty";
    }
    if (name.length < 3) {
      return "Name must be at least 3 characters long";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name)) {
      return "Name can only contain letters and spaces";
    }
    return null; // Valid name
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null; // Valid password
  }
}
