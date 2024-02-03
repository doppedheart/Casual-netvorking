class Hackathon {
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  String organizer;
  List<double> location;
  String registrationLink;
  List<String> participants;
  Map<String, String> channels;
  List<String> sponsors;
  List<String> judges;
  List<String> prizes;
  double distance;

  Hackathon({
    required this.name,
    this.description = '',
    required this.startDate,
    required this.endDate,
    this.organizer = '',
    required this.location,
    this.registrationLink = '',
    this.participants = const [],
    this.channels = const {},
    this.sponsors = const [],
    this.judges = const [],
    this.prizes = const [],
    this.distance = 0.0,
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) {
    return Hackathon(
      name: json['name'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      organizer: json['organizer'],
      location: List<double>.from(json['location']['coordinates']),
      registrationLink: json['registrationLink'],
      participants: List<String>.from(json['participants']),
      channels: Map<String, String>.from(json['channels']),
      sponsors: List<String>.from(json['sponsors']),
      judges: List<String>.from(json['judges']),
      prizes: List<String>.from(json['prizes']),
      distance: json['distance'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'organizer': organizer,
      'location': {
        'type': 'Point',
        'coordinates': location,
      },
      'registrationLink': registrationLink,
      'participants': participants,
      'channels': channels,
      'sponsors': sponsors,
      'judges': judges,
      'prizes': prizes,
      'distance': distance,
    };
  }
}
