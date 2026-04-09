class ScheduleEvent {
  final int day;
  final String time;
  final String title;
  final String location;
  final String? speakerName;
  final String? speakerRole;
  final String? speakerImage;
  final String? tag;

  ScheduleEvent({
    required this.day,
    required this.time,
    required this.title,
    required this.location,
    this.speakerName,
    this.speakerRole,
    this.speakerImage,
    this.tag,
  });
}

final List<ScheduleEvent> events = [
  // Day 1
  ScheduleEvent(
    day: 1,
    time: "09:00 AM — 05:00 PM",
    title: "SLB Campus Interview",
    location: "Seminar Rooms 1,2 & 3",
    speakerImage: 'https://randomuser.me/api/portraits/women/44.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "09:00 AM — 05:00 PM",
    title: "TEC25 Exhibtion",
    location: "Chancellor Complex",
    tag: "EXHIBITION",
    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "09:00 AM — 05:00 PM",
    title: "SLB Campus Interview",
    location: "Seminar Rooms 1,2 & 3",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "INTERVIEW",
    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "09:00 AM — 05:00 PM",
    title: "ExxonMobile Campus Interview",
    location: "Seminar Rooms 1,2 & 3",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "INTERVIEW",

    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "09:30 AM — 11:00 AM",
    title: "HR Dialogue by PETRONAS",
    location: "Seminar Rooms 4 & 5",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "HR DIALOGUE",

    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "11:30 AM — 02:30 PM",
    title: "TEC25 Officiating Ceremony",
    location: "Seminar Rooms 7 & 8",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "03:00 PM — 04:30 PM",
    title: "HR Dialogue by SLB",
    location: "Seminar Rooms 4 & 5",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "HR DIALOGUE",
    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 2,
    time: "05:00 PM — 06:00 PM",
    title: "TEC25 Mixer",
    location: "Seminar Rooms 7 & 8",
    speakerName: "asdasd",
    speakerRole: "asdasd",

    speakerImage: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
  ScheduleEvent(
    day: 3,
    time: "09:00 AM — 05:00 PM",
    title: "TEC25 Exhibition",
    location: "Chancellor Complex",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "EXHIBITION",
    speakerImage: 'https://randomuser.me/api/portraits/men/78.jpg',
  ),
  ScheduleEvent(
    day: 3,
    time: "09:00 AM — 05:00 PM",
    title: "ExxonMobile Campus Interview",
    location: "Seminar Room 1,2 & 3",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    speakerImage: 'https://randomuser.me/api/portraits/lego/1.jpg',
  ),
  ScheduleEvent(
    day: 3,
    time: "10:00 AM — 11:30 AM",
    title: "HR Dialogue by ExxonMobile",
    location: "Seminar Rooms 4 & 5",
    speakerName: "asdasd",
    speakerRole: "asdasd",
    tag: "DIALOGUE",
    speakerImage: 'https://randomuser.me/api/portraits/men/52.jpg',
  ),
  ScheduleEvent(
    day: 3,
    time: "01:00 PM — 02:00 PM",
    title: "TEC25 Talk2Mentor",
    location: "Seminar Rooms 7 & 8",
    speakerName: "asdasd",
    speakerRole: "Asd",
    tag: "DIALOGUE",
    speakerImage: 'https://randomuser.me/api/portraits/men/52.jpg',
  ),
];
