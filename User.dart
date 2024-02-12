class User {
  String gender, email, phone, cell, nat;
  Name name;
  Location location;
  Login login;
  Dob dob;
  Register registered;
  Id id;
  Picture picture;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.location,
      required this.login,
      required this.dob,
      required this.registered,
      required this.id,
      required this.picture});

  factory User.from(dynamic data) {
    Name name = Name.from(data["name"]);
    Location location = Location.from(data["location"]);
    Login login = Login.from(data["login"]);
    Dob dob = Dob.from(data["dob"]); // Corrected from data["dob"]
    Register registered = Register.from(data["registered"]);
    Id id = Id.from(data["id"]);
    Picture picture = Picture.from(data["picture"]);
    return User(
      gender: data["gender"],
      email: data["email"],
      phone: data["phone"],
      cell: data["cell"],
      nat: data["nat"],
      name: name,
      location: location,
      login: login,
      dob: dob,
      registered: registered,
      id: id,
      picture: picture,
    );
  }
}

class Name {
  String title, first, last;

  Name({required this.title, required this.first, required this.last});

  factory Name.from(dynamic data) {
    return Name(
      title: data["title"],
      first: data["first"],
      last: data["last"],
    );
  }
}

class Location {
  Street street;
  String city, state, country, postcode;
  Coordinate coordinate;
  TimeZone timezone;

  Location(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coordinate,
      required this.timezone});

  factory Location.from(dynamic data) {
    Street street = Street.from(data["street"]);
    Coordinate coordinate = Coordinate.from(data["coordinates"]);
    TimeZone timezone = TimeZone.from(data["timezone"]);

    var pcode = "";
    if(data["postcode"] is int) {
      pcode = data["postcode"].toString();
    } else {
      pcode = data["postcode"];
    }
    return Location(
        street: street,
        city: data["city"],
        state: data["state"],
        country: data["country"],
        postcode: pcode,
        coordinate: coordinate,
        timezone: timezone);
  }
}

class Street {
  int number;
  String name;

  Street({required this.number, required this.name});

  factory Street.from(dynamic data) {
    return Street(number: data["number"], name: data["name"]);
  }
}

class Coordinate {
  String latitude, longitude;

  Coordinate({required this.latitude, required this.longitude});

  factory Coordinate.from(dynamic data) {
    return Coordinate(
        latitude: data["latitude"], longitude: data["longitude"]);
  }
}

class TimeZone {
  String offset, description;

  TimeZone({required this.offset, required this.description});

  factory TimeZone.from(dynamic data) {
    return TimeZone(
        offset: data["offset"],
        description: data["description"]); //instance, object
  }
}

class Login {
  String uuid, username, password, salt, md5, sha1, sha256;

  Login(
      {required this.uuid,
      required this.username,
      required this.password,
      required this.salt,
      required this.md5,
      required this.sha1,
      required this.sha256});

  factory Login.from(dynamic data) {
    return Login(
        uuid: data["uuid"],
        username: data["username"],
        password: data["password"],
        salt: data["salt"],
        md5: data["md5"],
        sha1: data["sha1"],
        sha256: data["sha256"]);
  }
}

class Dob {
  String date;
  int age;

  Dob({required this.date, required this.age});

  factory Dob.from(dynamic data) {
    return Dob(date: data["date"], age: data["age"]);
  }
}

class Register {
  String date;
  int age;

  Register({required this.date, required this.age});

  factory Register.from(dynamic data) {
    return Register(date: data["date"], age: data["age"]);
  }
}

class Id {
  String name, value;

  Id({required this.name, required this.value});

  factory Id.from(dynamic data) {
    return Id(name: data["name"], value: data["value"]);
  }
}

class Picture {
  String large, medium, thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.from(dynamic data) {
    return Picture(
        large: data["large"],
        medium: data["medium"],
        thumbnail: data["thumbnail"]);
  }
}
