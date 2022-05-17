class Item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      this.id, this.name, this.description, this.price, this.color, this.image);
}

final products = [
  Item(
      "Codepur001",
      "iPhone 12 Pro",
      "Apple iPhone 12th generation",
      999,
      "#33505a",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
];
