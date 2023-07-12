class User {
    final String? email;
    final String? firstName;
    final String? id;
    final String? lastName;

    User({
        this.email,
        this.firstName,
        this.id,
        this.lastName,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
    };
}
