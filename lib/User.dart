class User {
  final String folio;
  final String meter;
  final String consumer;
  final String reading;
  User(this.folio, this.meter,this.consumer,this.reading);
  //constructor that convert json to object instance
  User.fromJson(Map<String, dynamic> json) : folio = json['folio'],  meter = json['meter'],consumer = json['consumer'],reading = json['reading'];
  //a method that convert object to json
  Map<String, dynamic> toJson() => {
    'folio': folio,
    'meter': meter,
    'consumer': consumer,
    'reading': reading
  };
}