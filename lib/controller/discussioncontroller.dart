part of 'controller.dart';

class DiscussionController {
  static Future<Discussion> create(String leaderId, String title,
      String description, String zoomLink, String date) async {
    var response = await StellacrabService.createDiscussion(
        leaderId, title, description, zoomLink, date);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 201 && job['message'] != null) {
      var discussionJson = json.encode(job['discussion']);
      return Discussion.fromJson(discussionJson);
    } else {
      return Discussion(id: '0', title: job['error']);
    }
  }

  static Future<dynamic> get() async {
    List<Discussion> discussionList = await StellacrabService.getDiscussion();
    return discussionList;
  }
}
