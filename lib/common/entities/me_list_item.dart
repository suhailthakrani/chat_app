// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeListItem {
  String? name;
  String? icon;
  String? aboutMe;
  String? route;
  MeListItem({
    this.name,
    this.icon,
    this.aboutMe,
    this.route,
  });

  MeListItem copyWith({
    String? name,
    String? icon,
    String? aboutMe,
    String? route,
  }) {
    return MeListItem(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      aboutMe: aboutMe ?? this.aboutMe,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'aboutMe': aboutMe,
      'route': route,
    };
  }

  factory MeListItem.fromMap(Map<String, dynamic> map) {
    return MeListItem(
      name: map['name'] != null ? map['name'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      aboutMe: map['aboutMe'] != null ? map['aboutMe'] as String : null,
      route: map['route'] != null ? map['route'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeListItem.fromJson(String source) => MeListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MeListItem(name: $name, icon: $icon, aboutMe: $aboutMe, route: $route)';
  }

  @override
  bool operator ==(covariant MeListItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.icon == icon &&
      other.aboutMe == aboutMe &&
      other.route == route;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      icon.hashCode ^
      aboutMe.hashCode ^
      route.hashCode;
  }
}
