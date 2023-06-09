import 'dart:html';
import 'dart:math';

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
  VideoPlayerController videoPlayerController1 =
      VideoPlayerController.asset('lib/assets/sample2.mp4');
  VideoPlayerController videoPlayerController2 =
      VideoPlayerController.asset('lib/assets/videoplayback.mp4');

  initializeVideo() async {
    videoPlayerController1.setLooping(true);
    videoPlayerController2.setLooping(true);
    print(videoPlayerController1);
    videoPlayerController1.setVolume(0);
    videoPlayerController2.setVolume(0);
    await videoPlayerController1.initialize();
    await videoPlayerController2.initialize();
    // videoPlayerController.play();
    print(videoPlayerController1);
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
        backgroundColor: model.isSkillsHovering ? Colors.black : Colors.white,
        body: Stack(
          children: [


            model.isSummaryHovering ? VideoPlayer(
                    videoPlayerController2,
                  )
                : const SizedBox(),
            model.isAsthetic
                ? VideoPlayer(
                    videoPlayerController1,
                  )
                : const SizedBox(),
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
                      onTap: () {
                        model.launch();
                      },
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
                                  : model.isAsthetic
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
                                  : model.isAsthetic
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: InkWell(
                  //     onTap: () => model.launch(),
                  //     // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                  //     onHover: (value) {
                  //       model.onHoverDownload(value);
                  //     },
                  //     child: AnimatedContainer(
                  //         duration: const Duration(milliseconds: 300),
                  //         color: model.isDownloadHovering
                  //             ? Colors.black.withOpacity(0.3)
                  //             : Colors.transparent,
                  //         child: Icon(Icons.download_sharp, size: 30,color: model.isAsthetic ? Colors.white :Colors.black)),
                  //   ),
                  // ),
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
                                  videoPlayerController2.play();
                                  videoPlayerController1.pause();
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
                                  child: SummaryWidget(
                                      color: model.isSummaryHovering
                                          ? Colors.white
                                          : Colors.transparent),
                                ),
                              ),
                            ),
                            SizedBox.square(
                              dimension: 30,
                            ),
                            InkWell(
                                onTap: () {},
                                // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                                onHover: (value) {
                                  model.setAsthetic(value);
                                  model.onHoverSkills(value);
                                  videoPlayerController1.play();
                                  videoPlayerController2.pause();
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
                                          ? Colors.white
                                          : Colors.transparent,
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
                  child: InkWell(
                    child: Text(
                      'Resume will be displayed on click!',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            Positioned(
              // right: Random().nextDouble()*300,
              left: (MediaQuery.of(context).size.width * 0.5) - model.offset,
              // right: (MediaQuery.of(context).size.width* 0.5) + model.offset,
              right: Random().nextDouble() * 300,

              top: (MediaQuery.of(context).size.height * 0.35) - model.offset,
              child: InkWell(
                onTap: () => model.launch(),
                // model.downloadFile('lib/assets/rahul pal resume.pdf'),
                onHover: (value) {
                  model.onHoverDownload(value);
                  model.setOffset(Random().nextInt(50));
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: model.isDownloadHovering
                        ? Colors.black.withOpacity(0.3)
                        : Colors.transparent,
                    child: Icon(Icons.document_scanner_sharp,
                        size: 30,
                        color: model.isAsthetic ? Colors.white : Colors.black)),
              ),
            ),
            if (model.count > 2)
              Positioned(
                bottom: 500,
                left: MediaQuery.of(context).size.width / 2,
                child: const Center(
                  child: InkWell(
                    child: Text(
                      'Wow you are really persistent! BRAVO... just click on my name please.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            if (model.count > 4)
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 4,
                child: const Center(
                  child: InkWell(
                    child: Text(
                      'LET ME HELP YOU!!!!!',
                      style: TextStyle(color: Colors.red, fontSize: 50),
                    ),
                  ),
                ),
              ),
            if (model.count > 4)
              GridView.builder(
                  itemCount: 200,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 500 ? 5 : 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: (2 / 1),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => model.launch(),
                      onHover: (value) {
                        model.onHoverDownload(value);
                      },
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: model.isDownloadHovering
                              ? Colors.black.withOpacity(0.3)
                              : Colors.transparent,
                          child: Icon(Icons.download_sharp,
                              size: 30,
                              color: model.isAsthetic
                                  ? Colors.white
                                  : Colors.black)),
                    );
                  })
          ],
        ),
      );
    });
  }
}
