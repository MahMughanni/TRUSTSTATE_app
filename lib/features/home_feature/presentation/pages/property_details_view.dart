import 'dart:async';

import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:final_project/features/profile_feature/presentation/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imageview360/imageview360.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../core/widgets/app_widgets.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  _PropertyDetailsScreenState createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  HomeController controller = Get.put(HomeController());

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 15; i++) {
      imageList.add(AssetImage('assets/images/$i.jpg'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/images/$i.jpg'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }

  PageController pageController = PageController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = const Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(AppTexts.detailesScreenTitle),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Center(
                    child: SizedBox(
                      width: 315.w,
                      height: 180.h,
                      child: PageView.builder(
                        itemCount: AppImages.houses.length,
                        controller: pageController,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              width: 315.w,
                              height: 180.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                      AppImages.houses[index],
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                              // child: Image.asset(
                              //   homeEntity.image,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.headLine1Color,
                                    radius: 18,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Get.dialog(Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 72.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                (imagePrecached == true)
                                                    ? ImageView360(
                                                        key: UniqueKey(),
                                                        imageList: imageList,
                                                        autoRotate: autoRotate,
                                                        rotationCount:
                                                            rotationCount,
                                                        rotationDirection:
                                                            RotationDirection
                                                                .anticlockwise,
                                                        frameChangeDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    50),
                                                        swipeSensitivity:
                                                            swipeSensitivity,
                                                        allowSwipeToRotate:
                                                            allowSwipeToRotate,
                                                        onImageIndexChanged:
                                                            (currentImageIndex) {
                                                          print(
                                                              "currentImageIndex: $currentImageIndex");
                                                        },
                                                      )
                                                    : const Text(
                                                        "Pre-Caching images..."),
                                              ],
                                            ),
                                          ),
                                        ));
                                      },
                                      icon: Image.asset(
                                        AppImages.fullViewIcon,
                                        width: 22,
                                        height: 22,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.height10.w,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: AppColors.headLine1Color,
                                    radius: 18,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.slow_motion_video_rounded,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.height10.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /*   Container(
                                width: 315.w,
                                height: 170.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                        AppImages.houses[index],
                                      ), fit: BoxFit.cover,
                                    )
                                ),
                              ),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      effect: const WormEffect(
                          dotColor: AppColors.backgroundColor,
                          dotWidth: 12,
                          dotHeight: 12,
                          activeDotColor: AppColors.primaryColor),
                      controller: pageController,
                      count: AppImages.houses.length,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              SizedBox(
                width: double.infinity,
                height: 100.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          width: 95.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: ExactAssetImage(
                                  AppImages.houses[index],
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: AppSizes.padding20.w,
                        ),
                    itemCount: AppImages.houses.length),
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              const Divider(
                height: 1.5,
                color: AppColors.headLine3Color,
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              Text(
                AppTexts.aboutProperty,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              Container(
                child: Text(
                  AppTexts.propertyDiscreption,
                  style: context.theme.textTheme.headline3,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              const Divider(
                height: 1.5,
                color: AppColors.headLine3Color,
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              Text(
                AppTexts.detailesScreenTitle,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              Card(
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 3,
                    children: List.generate(
                        AppTexts.estateDetails.length,
                        (index) => Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppTexts.estateDetails[index],
                                    style: context.theme.textTheme.headline3,
                                  ),
                                  Icon(
                                    controller.icons[index],
                                    color: AppColors.headLine3Color,
                                  )
                                ],
                              ),
                            ))),
              ),
              SizedBox(
                height: AppSizes.padding20.h,
              ),
              Text(
                AppTexts.address,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.padding20.h,
              ),
              SizedBox(height: 300, child: Image.asset(AppImages.mapImage)

                  /*GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),*/
                  ),
              SizedBox(
                height: AppSizes.padding20.h,
              ),
              Text(
                AppTexts.contactWithAgent.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.padding20.h,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.height10.h.w),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: ExactAssetImage(
                          AppImages.agentImage,
                        ),
                        radius: AppSizes.radius12 * 3,
                      ),
                      SizedBox(
                        width: AppSizes.height10.w,
                      ),
                      Text(
                        AppTexts.userPhoneNumber,
                        style: context.theme.textTheme.headline4,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            launch("tel://0597786890");
                          },
                          icon: const Icon(
                            Icons.call_outlined,
                            color: AppColors.primaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.getChatRout());
                          },
                          icon: const Icon(
                            Icons.email,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              DefaultButton(AppTexts.bookNow, AppRoutes.getBookingRout()),
            ],
          ),
        ),
      ),
    );
  }
}
