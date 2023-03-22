import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume/config/core/base_viewmodel.dart';
import 'package:resume/config/core/enums/state_enums.dart';
import 'package:resume/screens/homepage/view/contact_widget.dart';
import 'package:resume/screens/homepage/view/custom_cursor.dart';
import 'package:resume/screens/homepage/view/footer_widget.dart';
import 'package:resume/screens/homepage/view/skills_widget.dart';
import 'package:resume/screens/homepage/view/summary_widget.dart';
import 'package:resume/screens/homepage/viewmodels/homepage_viewmodel.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  static const String routeName = 'homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List<String> videoAssetStrings = [
  'lib/assets/name.mp4',
  'lib/assets/role.mp4',
  'lib/assets/skills.mp4',
  'lib/assets/summary.mp4',
  'lib/assets/contact.mp4',
  'lib/assets/dp.mp4',
];

List<VideoPlayerController> videoControllers = [];

class _HomepageState extends State<Homepage> {
  initializeAllVideos() async {
    for (int i = 0; i < videoControllers.length; i++) {
      videoControllers[i].setLooping(true);
      videoControllers[i].setVolume(0);
      await videoControllers[i].initialize();
    }
    print(videoControllers.length);
  }

  @override
  void initState() {
    for (int i = 0; i < videoAssetStrings.length; i++) {
      videoControllers.add(VideoPlayerController.asset(videoAssetStrings[i]));
    }

    initializeAllVideos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomepageViewModel>(builder: (_, model, __) {
      playOnHoveringEverythingElsePause(VideoPlayerController controller) {
        for (int i = 0; i < videoControllers.length; i++) {
          videoControllers[i].pause();
        }
        controller.play();
      }

      bool isVideoTriggered = model.state == ViewState.summaryHovered ||
          model.state == ViewState.contactHovered ||
          model.state == ViewState.skillsHovered ||
          model.state == ViewState.footerHovered;

      return Scaffold(
        backgroundColor: isVideoTriggered ? Colors.black : Colors.white,
        body: MouseRegion(
          cursor: SystemMouseCursors.none,
          onHover: model.updateLocation,
          child: Stack(
            children: [
              model.state == ViewState.nameHovered
                  ? VideoPlayer(videoControllers[0])
                  : Container(),
              model.state == ViewState.roleHovered
                  ? VideoPlayer(videoControllers[1])
                  : Container(),
              model.state == ViewState.skillsHovered
                  ? VideoPlayer(videoControllers[2])
                  : Container(),
              model.state == ViewState.summaryHovered
                  ? VideoPlayer(videoControllers[3])
                  : Container(),
              model.state == ViewState.contactHovered
                  ? VideoPlayer(videoControllers[4])
                  : Container(),
              model.state == ViewState.dpHovered
                  ? VideoPlayer(videoControllers[5])
                  : Container(),
              Positioned(
                child: CustomCursor(
                  text: model.updateMouseCursorText(),
                ),
                left: model.x,
                top: model.y,
              ),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          print('sadadadasda');
                        },
                        onHover: (value) {
                          model.onHover(value, ViewState.dpHovered);
                          playOnHoveringEverythingElsePause(
                              videoControllers[5]);
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'lib/assets/Capture2.PNG',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          model.launch();
                        },
                        onHover: (value) {
                          model.onHoverName(value);
                          model.onHover(value, ViewState.nameHovered);
                          playOnHoveringEverythingElsePause(
                              videoControllers[0]);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          color: model.isNameHovering
                              ? Colors.black54
                              : Colors.white.withOpacity(0),
                          child: Text(
                            ' Rahul Pal ',
                            style: TextStyle(
                                fontSize: 40,
                                color: model.isNameHovering
                                    ? Colors.white
                                    : model.isSkillsHovering ||
                                            model.isContactHovering ||
                                            model.isSummaryHovering ||
                                            model.isFooterHovering ||
                                            model.state == ViewState.dpHovered
                                        ? Colors.white
                                        : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        onHover: (value) {
                          model.onHoverRole(value);
                          model.onHover(value, ViewState.roleHovered);
                          playOnHoveringEverythingElsePause(
                              videoControllers[1]);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          color: model.isRoleHovering
                              ? Colors.black54
                              : Colors.transparent,
                          child: Text(
                            ' F L U T T E R   D E V E L O P E R',
                            style: TextStyle(
                                fontSize: 20,
                                color: model.isRoleHovering
                                    ? Colors.white
                                    : model.isSkillsHovering ||
                                            model.isContactHovering ||
                                            model.isSummaryHovering ||
                                            model.isFooterHovering ||
                                            model.state == ViewState.dpHovered
                                        ? Colors.white
                                        : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => model.launch(),
                        onHover: (value) {
                          model.onHoverDownload(value);
                          model.onHover(value, ViewState.resumeHovered);
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            color: model.isDownloadHovering
                                ? Colors.black.withOpacity(0.3)
                                : Colors.transparent,
                            child: Icon(Icons.read_more,
                                size: 30,
                                color: model.isSkillsHovering ||
                                        model.isContactHovering ||
                                        model.isSummaryHovering ||
                                        model.isFooterHovering ||
                                        model.state == ViewState.dpHovered
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  model.onHoverSummary(value);
                                  model.onHover(
                                      value, ViewState.summaryHovered);
                                  playOnHoveringEverythingElsePause(
                                      videoControllers[3]);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  color: model.isSummaryHovering
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.transparent,
                                  child: SizedBox(
                                    width: 300,
                                    height: 400,
                                    child: SummaryWidget(
                                        color: model.isSummaryHovering
                                            ? Colors.white
                                            : Colors.transparent),
                                  ),
                                ),
                              ),
                              const SizedBox.square(
                                dimension: 30,
                              ),
                              InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    model.onHover(
                                        value, ViewState.skillsHovered);
                                    model.setAsthetic(value);
                                    model.onHoverSkills(value);
                                    playOnHoveringEverythingElsePause(
                                        videoControllers[2]);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    color: model.isSkillsHovering
                                        ? Colors.black.withOpacity(0.3)
                                        : Colors.transparent,
                                    child: SizedBox(
                                      width: 500,
                                      height: 400,
                                      child: SkillsWidget(
                                        color: model.isSkillsHovering
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  )),
                              const SizedBox.square(
                                dimension: 30,
                              ),
                              InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    model.onHover(
                                        value, ViewState.contactHovered);
                                    model.onHoverContact(value);
                                    playOnHoveringEverythingElsePause(
                                        videoControllers[4]);
                                  },
                                  child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      color: model.isContactHovering
                                          ? Colors.black.withOpacity(0.3)
                                          : Colors.transparent,
                                      child: SizedBox(
                                          width: 300,
                                          height: 400,
                                          child: ContactWidget(
                                              color: model.isContactHovering
                                                  ? Colors.white
                                                  : Colors.transparent))))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        onHover: (value) {
                          model.onHoverFooter(value);
                          model.onHover(value, ViewState.footerHovered);
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            color: model.isFooterHovering
                                ? Colors.black.withOpacity(00.4)
                                : Colors.transparent,
                            child: FooterWidget(
                              color: model.isFooterHovering
                                  ? Colors.white
                                  : Colors.transparent,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              if (model.isDownloadHovering)
                Positioned(
                  bottom: 200,
                  left: MediaQuery.of(context).size.width / 2.27,
                  child: const Center(
                    child: InkWell(
                      child: Text(
                        'Resume will be displayed on click!',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
