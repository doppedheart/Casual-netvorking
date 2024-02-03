// {
//   "_id": {
//     "$oid": "65be5c876cc5347cdf9b0b21"
//   },
//   "name": "Ashutosh Jha",
//   "email": "ashdude95@gmail.com",
//   "username": "johndoe",
//   "avatar": "https://yash-s3-bucket-sdk-test.s3.amazonaws.com/hackconnect/ayo-ogunseinde-sibVwORYqs0-unsplash_1706974334162.jpg",
//   "eventParticipated": [
//     "Tech Meetup 2023",
//     "CodeJam"
//   ],
//   "connections": [],
//   "interests": {
//     "occupation": [
//       "Web Development"
//     ],
//     "frameworksAndTools": [
//       "React",
//       "Express"
//     ],
//     "hobbies": [
//       "Reading",
//       "Gaming"
//     ],
//     "companies": [
//       "Tech Co.",
//       "StartupX"
//     ]
//   },
//   "conversationStarter": {
//     "icebreakerResponses": [
//       "What's your favorite coding language?",
//       "Any book recommendations?"
//     ],
//     "pickupLines": [
//       "Are you a developer? Because you've got some great backend skills!"
//     ]
//   },
//   "matchingPreferences": {
//     "connectionType": [
//       "collaboration",
//       "casual_networking"
//     ],
//     "matchingCriteria": {
//       "similarTechInterests": true,
//       "complementarySkills": true
//     }
//   },
//   "createdAt": {
//     "$date": "2024-02-03T15:32:23.103Z"
//   },
//   "updatedAt": {
//     "$date": "2024-02-03T16:58:56.212Z"
//   },
//   "__v": 0,
//   "age": 23,
//   "bio": "Passionate about technology and coding",
//   "gender": "Male",
//   "profession": "Software Engineer",
//   "socialLinks": {
//     "linkedIn": "https://www.linkedin.com/in/johndoe/",
//     "github": "https://github.com/johndoe",
//     "portfolio": "https://johndoeportfolio.com/",
//     "other": "https://example.com/johndoe"
//   },
//   "techStack": "JavaScript, React, Node.js",
//   "timeSpent":50
// }

class UserModal {
  String? id;
  String? name;
  String? email;
  String? username;
  int? age;
  String? bio;
  String? avatar;
  List<String>? eventParticipated;
  List<String>? connections;
  Interests? interests;
  ConversationStarter? conversationStarter;
  MatchingPreferences? matchingPreferences;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gender;
  String? profession;
  String? techStack;
  int? timeSpent;
  SocialLinks? socialLinks;

  UserModal(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.age,
      this.bio,
      this.avatar,
      this.eventParticipated,
      this.connections,
      this.interests,
      this.conversationStarter,
      this.matchingPreferences,
      this.createdAt,
      this.updatedAt,
      this.gender,
      this.profession,
      this.socialLinks,
      this.techStack,
      this.timeSpent});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
      id: json['_id']['\$oid'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      age: json['age'],
      bio: json['bio'],
      avatar: json['avatar'],
      eventParticipated: List<String>.from(json['eventParticipated']),
      connections: List<String>.from(json['connections']),
      interests: Interests.fromJson(json['interests']),
      conversationStarter:
          ConversationStarter.fromJson(json['conversationStarter']),
      matchingPreferences:
          MatchingPreferences.fromJson(json['matchingPreferences']),
      createdAt: DateTime.parse(json['createdAt']['\$date']),
      updatedAt: DateTime.parse(json['updatedAt']['\$date']),
      gender: json['gender'],
      profession: json['profession'],
      socialLinks: SocialLinks.fromJson(json['socialLinks']),
      techStack: json['techStack'],
      timeSpent: json['timeSpent'],
    );

  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      id: map['_id'],
      name: map['name'],
      email: map['email'],
      username: map['username'],
      age: map['age'],
      bio: map['bio'],
      avatar: map['avatar'],
      eventParticipated: List<String>.from(map['eventParticipated']),
      connections: List<String>.from(map['connections']),
      interests: Interests.fromJson(map['interests']),
      conversationStarter:
          ConversationStarter.fromJson(map['conversationStarter']),
      matchingPreferences:
          MatchingPreferences.fromJson(map['matchingPreferences']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      profession: map['profession'],
      socialLinks: SocialLinks.fromJson(map['socialLinks']),
      techStack: map['techStack'],
      timeSpent: map['timeSpent'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'username': username,
      'age': age,
      'bio': bio,
      'avatar': avatar,
      'eventParticipated': eventParticipated,
      'connections': connections,
      'interests': interests?.toJson(),
      'conversationStarter': conversationStarter?.toJson(),
      'matchingPreferences': matchingPreferences?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'profession': profession,
      'socialLinks': socialLinks?.toJson(),
      'techStack': techStack,
      'timeSpent': timeSpent,
    };
  }
}

class Interests {
  List<String>? occupation;
  List<String>? frameworksAndTools;
  List<String>? hobbies;
  List<String>? companies;

  Interests(
      {this.occupation, this.frameworksAndTools, this.hobbies, this.companies});

  factory Interests.fromJson(Map<String, dynamic> json) {
    return Interests(
        occupation: List<String>.from(json['occupation']),
        frameworksAndTools: List<String>.from(json['frameworksAndTools']),
        hobbies: List<String>.from(json['hobbies']),
        companies: List<String>.from(json['companies']));
  }

  Map<String, dynamic> toJson() {
    return {
      'occupation': occupation,
      'frameworksAndTools': frameworksAndTools,
      'hobbies': hobbies,
      'companies': companies,
    };
  }
}

class ConversationStarter {
  List<String>? icebreakerResponses;
  List<String>? pickupLines;

  ConversationStarter({this.icebreakerResponses, this.pickupLines});

  factory ConversationStarter.fromJson(Map<String, dynamic> json) {
    return ConversationStarter(
        icebreakerResponses: List<String>.from(json['icebreakerResponses']),
        pickupLines: List<String>.from(json['pickupLines']));
  }

  Map<String, dynamic> toJson() {
    return {
      'icebreakerResponses': icebreakerResponses,
      'pickupLines': pickupLines,
    };
  }
}

class MatchingPreferences {
  List<String>? connectionType;
  MatchingCriteria? matchingCriteria;

  MatchingPreferences({this.connectionType, this.matchingCriteria});

  factory MatchingPreferences.fromJson(Map<String, dynamic> json) {
    return MatchingPreferences(
        connectionType: List<String>.from(json['connectionType']),
        matchingCriteria: MatchingCriteria.fromJson(json['matchingCriteria']));
  }

  Map<String, dynamic> toJson() {
    return {
      'connectionType': connectionType,
      'matchingCriteria': matchingCriteria?.toJson(),
    };
  }
}

class MatchingCriteria {
  bool? similarTechInterests;
  bool? complementarySkills;

  MatchingCriteria({this.similarTechInterests, this.complementarySkills});

  factory MatchingCriteria.fromJson(Map<String, dynamic> json) {
    return MatchingCriteria(
        similarTechInterests: json['similarTechInterests'],
        complementarySkills: json['complementarySkills']);
  }

  Map<String, dynamic> toJson() {
    return {
      'similarTechInterests': similarTechInterests,
      'complementarySkills': complementarySkills,
    };
  }
}

class SocialLinks {
  String? linkedIn;
  String? github;
  String? portfolio;
  String? other;

  SocialLinks({this.linkedIn, this.github, this.portfolio, this.other});

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
        linkedIn: json['linkedIn'],
        github: json['github'],
        portfolio: json['portfolio'],
        other: json['other']);
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedIn': linkedIn,
      'github': github,
      'portfolio': portfolio,
      'other': other,
    };
  }
}
