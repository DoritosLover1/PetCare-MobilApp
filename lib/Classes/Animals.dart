enum AnimalKind {dog, cat, bird, turtle, spider, snake }

class Animal {
  final AnimalKind type;
  final String breed;
  final int id;
  final String name;
  final int age;

  const Animal({required this.id, required this.name, required this.age, required this.type, required this.breed});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'breed': breed, 'type': type.name};
  }
}
