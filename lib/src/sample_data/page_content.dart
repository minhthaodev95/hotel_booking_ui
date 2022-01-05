class WalkThroughContent {
  final String title;
  final String description;
  final String image;
  WalkThroughContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<WalkThroughContent> walkThroughContent = <WalkThroughContent>[
  WalkThroughContent(
    title: 'Stay in the heart of the city',
    description:
        'Find the best location hotel to make sure you never a miss a place to see during your trip',
    image: 'assets/images/background04.png',
  ),
  WalkThroughContent(
    title: 'Explore unbeaten paths',
    description:
        'Explore hidden gem and stay in remote locations to explore the location lifestyle away from the bustle',
    image: 'assets/images/background04.png',
  ),
  WalkThroughContent(
    title: 'Embark on a new journey',
    description:
        'With our recommendation engine, you have limitless options to design your trip the way you want it',
    image: 'assets/images/background04.png',
  ),
];
