class Account {
  Account({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  Account copyWith({
    String? id,
    String? name,
    String? imageUrl,
  }) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  static List<Account> fakeValues = [
    _account,
    _account.copyWith(id: '2', name: 'Account - Two', imageUrl: _imagesUrls[2]),
    _account.copyWith(
        id: '3', name: 'Account - Three', imageUrl: _imagesUrls[3]),
    _account.copyWith(
        id: '4', name: 'Account - Four', imageUrl: _imagesUrls[4]),
    _account.copyWith(
        id: '5', name: 'Account - Five', imageUrl: _imagesUrls[1]),
  ];
}

final _account = Account(
  id: '1',
  name: 'Account - One',
  imageUrl: _imagesUrls[0],
);

const _imagesUrls = [
  'assets/images/blue (16).jpg',
  'assets/images/blue (7).jpg',
  'assets/images/blue (3).jpg',
  'assets/images/blue (10).jpg',
  'assets/images/blue.png',
];
