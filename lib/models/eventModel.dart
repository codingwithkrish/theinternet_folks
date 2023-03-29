class EventModel {
  int id;
  String tittle;
  String description;
  String bannnerimage;
  String dateTime;
  String organisername;
  String organiserIcon;
  String venuename;
  String venuecity;
  String venuecountry;
  EventModel(
      {required this.id,
      required this.dateTime,
      required this.bannnerimage,
      required this.description,
      required this.organiserIcon,
      required this.organisername,
      required this.tittle,
      required this.venuecity,
      required this.venuecountry,
      required this.venuename});
  factory EventModel.fromjson(Map<String, dynamic> json) {
    return EventModel(
        id: json["id"],
        dateTime: json["date_time"],
        bannnerimage: json["banner_image"],
        description: json["description"],
        organiserIcon: json["organiser_icon"],
        organisername: json["organiser_name"],
        tittle: json["title"],
        venuecity: json["venue_city"],
        venuecountry: json["venue_country"],
        venuename: json["venue_name"]);
  }
}
