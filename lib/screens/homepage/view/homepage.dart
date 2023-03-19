import 'package:flutter/material.dart';
import 'package:resume/config/core/base_viewmodel.dart';
import 'package:resume/screens/homepage/view/contact_widget.dart';
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

class _HomepageState extends State<Homepage> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('lib/assets/video_sample.mp4');

  initializeVideo() async {
    videoPlayerController.setLooping(true);
    print(videoPlayerController);
    videoPlayerController.setVolume(0);
    await videoPlayerController.initialize();
    videoPlayerController.play();
    print(videoPlayerController);
    setState(() {});
    // videoPlayerController.play();
  }

  @override
  void initState() {
    initializeVideo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomepageViewModel>(builder: (_, model, __) {
      return Scaffold(
        body: Stack(
          children: [
            model.isAsthetic ? VideoPlayer(videoPlayerController, ) :const SizedBox(),
            Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      onHover: (value) {
                        model.onHoverName(value);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        color: model.isNameHovering
                            ? Colors.black54
                            : Colors.white.withOpacity(0),
                        child: Text(
                          'Rahul Pal ',
                          style: TextStyle(
                              fontSize: 40,
                              color: model.isNameHovering
                                  ? Colors.white
                                  : model.isAsthetic ? Colors.white :Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      onHover: (value) {
                        model.onHoverRole(value);
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
                                  : model.isAsthetic ? Colors.white :Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => model.launch(),
                      // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                      onHover: (value) {
                        model.onHoverDownload(value);
                      },
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: model.isDownloadHovering
                              ? Colors.black.withOpacity(0.3)
                              : Colors.transparent,
                          child: Icon(Icons.download_sharp, size: 30,color: model.isAsthetic ? Colors.white :Colors.black)),
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
                              // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                              onHover: (value) {
                                model.onHoverSummary(value);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                color: model.isSummaryHovering
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.transparent,
                                child: SizedBox(
                                  // width: MediaQuery.of(context).size.width / 4,
                                  width: 300,
                                  height: 400,
                                  child: SummaryWidget(color: model.isSummaryHovering ? Colors.white : Colors.transparent),
                                ),
                              ),
                            ),
                            SizedBox.square(
                              dimension: 30,
                            ),
                            InkWell(
                                onTap: () {},
                                // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                                onHover: (value) {model.setAsthetic(value);
                                  model.onHoverSkills(value);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  color: model.isSkillsHovering
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.transparent,
                                  child: SizedBox(
                                    // width: MediaQuery.of(context).size.width / 3,
                                    width: 500, height: 400,
                                    child: SkillsWidget(
                                      color: model.isSkillsHovering
                                                ?  Colors.white : Colors.transparent,
                                    ),
                                  ),
                                )),
                            SizedBox.square(
                              dimension: 30,
                            ),
                            InkWell(
                                onTap: () {},
                                // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                                onHover: (value) {
                                  model.onHoverContact(value);
                                },
                                child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    color: model.isContactHovering
                                        ? Colors.black.withOpacity(0.3)
                                        : Colors.transparent,
                                    child: SizedBox(
                                        // width: MediaQuery.of(context).size.width / 4,

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
                  )
                ],
              ),
            ),
            if (model.isDownloadHovering)
              Positioned(
                bottom: 200,
                left: MediaQuery.of(context).size.width / 2.27,
                child: const Center(
                  child: Text(
                    'Resume will be displayed on click!',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
