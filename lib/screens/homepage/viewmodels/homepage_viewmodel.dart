import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:resume/config/core/base_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomepageViewModel extends BaseModel {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('lib/assets/videoplayback2.mp4');

  int count = 0;

  int _offset = 0;
  int get offset => _offset;
  setOffset(int value) {
    if (offset > 300 || offset < -300) {
      count++;
      _offset = 0;
    }
    if (count % 2 == 0) {
      _offset += value;
    } else {
      _offset -= value;
    }
    print(offset);
    notifyListeners();
  }

  bool _isAsthetic = false;
  bool get isAsthetic => _isAsthetic;
  setAsthetic(bool value) {
    _isAsthetic = value;
    notifyListeners();
  }

  initializeVideo() async {
    videoPlayerController.setLooping(true);
    print(videoPlayerController);
    videoPlayerController.setVolume(0);
    await videoPlayerController
        .initialize()
        .then((value) => videoPlayerController.play());
    print(videoPlayerController);
    // videoPlayerController.play();
    notifyListeners();
  }

  playVideo() {
    // if(videoPlayerController.)
    videoPlayerController.play();
    notifyListeners();
  }

  disposeVideo() {
    videoPlayerController.dispose();
    notifyListeners();
  }

  downloadFile(String url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Rahul Pal Resume";
    anchorElement.click();
    // notifyListeners();
  }

  bool _isCursorMoving = false;
  bool get isCursorMoving => _isCursorMoving;
  onHoverMovingCursor(bool value) {
    _isCursorMoving = value;
    notifyListeners();
  }

  bool _isDownloadHovering = false;
  bool get isDownloadHovering => _isDownloadHovering;

  onHoverDownload(bool value) {
    _isDownloadHovering = value;
    notifyListeners();
  }

  //--------name hovering
  bool _isNameHovering = false;
  bool get isNameHovering => _isNameHovering;
  onHoverName(bool value) {
    _isNameHovering = value;
    notifyListeners();
  }

  //--------role hovering
  bool _isRoleHovering = false;
  bool get isRoleHovering => _isRoleHovering;
  onHoverRole(bool value) {
    _isRoleHovering = value;
    notifyListeners();
  }

  //--------skills hovering
  bool _isSkillsHovering = false;
  bool get isSkillsHovering => _isSkillsHovering;
  onHoverSkills(bool value) {
    _isSkillsHovering = value;
    notifyListeners();
  }

  //--------summary hovering
  bool _isSummaryHovering = false;
  bool get isSummaryHovering => _isSummaryHovering;
  onHoverSummary(bool value) {
    _isSummaryHovering = value;
    notifyListeners();
  }

  //--------contact hovering
  bool _isContactHovering = false;
  bool get isContactHovering => _isContactHovering;
  onHoverContact(bool value) {
    _isContactHovering = value;
    notifyListeners();
  }

  //---------mouse information
  double x = 0.0;
  double y = 0.0;
  void updateLocation(PointerHoverEvent details) {
    x = details.position.dx.toDouble();
    y = details.position.dy.toDouble();
    print('{$x , $y}');
    notifyListeners();
  }

  //--------footer quote hovering
  bool _isFooterHovering = false;
  bool get isFooterHovering => _isFooterHovering;
  onHoverFooter(bool value) {
    _isFooterHovering = value;
    notifyListeners();
  }

  String mousecursortext = 'Glad you made it here!';
  updateMouseCursorText() {
    if (y > 100 && y < 200) {
      return mousecursortext = 'This is how I look.';
    }
    if (y > 200 && y < 250) {
      return mousecursortext = 'This is my name ofcourse';
    }
    if (y > 250 && y < 280) {
      return mousecursortext = 'This is my role.';
    }
    if (y > 285 && y < 320) {
      return mousecursortext = 'This is where you can get my resume!';
    }
    if ((x > 380 && x < 680) && (y > 370 && y < 760)) {
      return mousecursortext = 'This shows summary of my profile.';
    }
    if ((x > 712 && x < 1210) && (y > 370 && y < 760)) {
      return mousecursortext =
          'This shows my fundamental skills that I am proficient in.';
    }
    if ((x > 1240 && x < 1540) && (y > 370 && y < 760)) {
      return mousecursortext = 'This is how you can contact me directly.';
    }
    if (y > 800 && y < 950) {
      
      return mousecursortext = 'This means you are at footer region now!';
    } else {
      return mousecursortext =
          'Glad you made it here! I hope you are in full screen mode(press F11)!';
    }

    notifyListeners();
  }

  launch() async {
    String url =
        'drive.google.com/file/d/1ZHR70EHowsvnHkLNu_53u2Yg3KJprbAi/view?usp=sharing';
    print('saddddddddddddddd');
    if (!await launchUrl(Uri.https(
        'drive.google.com',
        '/file/d/1ZHR70EHowsvnHkLNu_53u2Yg3KJprbAi/view',
        {'usp': 'sharing'}))) {
      throw Exception('Could not launch $url');
    }
  }
}
