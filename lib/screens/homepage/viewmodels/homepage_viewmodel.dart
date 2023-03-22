import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:resume/config/core/base_model.dart';
import 'package:resume/config/core/enums/state_enums.dart';
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
    // print('{$x , $y}');
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
    if (state == ViewState.dpHovered) {
      return mousecursortext =
          'This is exactly how I look, when I am on vacation and in perfect light.';
    }

    // if (y > 100 && y < 200) {
    //   return mousecursortext = 'This is how I look.';
    // }
    if (state == ViewState.nameHovered) {
      return mousecursortext = 'This is my name ofcourse';
    }
    if (state == ViewState.roleHovered) {
      return mousecursortext = 'This is my role having experience of 3 years.';
    }
    if (state == ViewState.resumeHovered) {
      return mousecursortext = 'This is where you can get my resume!';
    }
    if ((state == ViewState.summaryHovered)) {
      return mousecursortext = '''
I have worked on variety of projects whether they are for mobile or web, due to which I have worked with various 
packages too, because they are very well documented already which shows my quick learning ability. I have worked 
on MVVM and MVC architecture. I have also worked with googleMaps and yes, I had to implement custom marker and 
custom map(like uber or ola). Well for more you can always contact me, or just checkout my resume!''';
    }
    if (state == ViewState.skillsHovered) {
      return mousecursortext =
          '''I have good command on all these skills and have acquired by constant effort and implementation.

Why I will be a good addition to your organization?
Only if you like efficient, transparent, a person who knows his capabilities, and have a burning desire to learn more and more.''';
    }
    if (state == ViewState.contactHovered) {
      return mousecursortext = 'This is how you can contact me directly.';
    }
    if (state == ViewState.footerHovered) {
      return mousecursortext = 'This means you are at footer region now!';
    }
    if (state == ViewState.idle) {
      return mousecursortext =
          'Move your mouse around and discover elements yourself!';
    }

    notifyListeners();
  }

  onHover(bool value, ViewState newState) {
    if (value) {
      state = newState;
    } else {
      state = ViewState.idle;
    }
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
