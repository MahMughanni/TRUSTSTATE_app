import 'package:final_project/features/addingProperty_feature/presentation/bindings/addProperty_binding.dart';
import 'package:final_project/features/addingProperty_feature/presentation/pages/addingProperty_view.dart';
import 'package:final_project/features/agents_feature/presentation/pages/agent_detailes_view.dart';
import 'package:final_project/features/agents_feature/presentation/pages/agents_view.dart';
import 'package:final_project/features/auth_feature/create_new_pass/view/create_new_pass_view.dart';
import 'package:final_project/features/auth_feature/login/view/login_view.dart';
import 'package:final_project/features/auth_feature/signup/view/signup_view.dart';
import 'package:final_project/features/auth_feature/verification/view/verification_view.dart';
import 'package:final_project/features/auth_feature/forget_password/view/forget_pass_view.dart';
import 'package:final_project/features/booking_feature/presentation/pages/booking_view.dart';
import 'package:final_project/features/chat_feature/presentation/pages/chat_view.dart';
import 'package:final_project/features/favorities_feature/presentation/pages/favorites_view.dart';
import 'package:final_project/features/filter_feature/presentation/bindings/home_binding.dart';
import 'package:final_project/features/filter_feature/presentation/pages/filter_view.dart';
import 'package:final_project/features/home_feature/presentation/bindings/home_binding.dart';
import 'package:final_project/features/home_feature/presentation/pages/home_view.dart';
import 'package:final_project/features/home_feature/presentation/pages/property_details_view.dart';
import 'package:final_project/features/home_feature/presentation/widgets/home_layout.dart';
import 'package:final_project/features/notification_feature/presentation/pages/notification_view.dart';
import 'package:final_project/features/profile_feature/presentation/bindings/profile_binding.dart';
import 'package:final_project/features/profile_feature/presentation/pages/profile_view.dart';
import 'package:final_project/features/results_feature/presentation/bindings/results_binding.dart';
import 'package:final_project/features/results_feature/presentation/pages/results_view.dart';
import 'package:final_project/features/settings_feature/presentation/pages/helping_view.dart';
import 'package:final_project/features/settings_feature/presentation/pages/languages_view.dart';
import 'package:get/get.dart';
import '../../features/chat_feature/presentation/pages/chat_contact_view.dart';
import '../../features/on_boarding_feature/view/on_boarding_view.dart';
import '../../features/splash_feature/presenttion/pages/splash_screen.dart';



class AppRoutes{
  static String splash='/splash';
  static String onBoarding='/onBoarding';
  static String signIN='/signIN';
  static String signUp='/signUp';
  static String home='/home';
  static String layout='/';
  static String resetPass='/resetPass';
  static String checkCode='/checkCode';
  static String createPass='/createPass';
  static String chat='/chat';
  static String chatContacts='/chatContacts';
  static String profile='/profile';
  static String favorites='/favorites';
  static String details='/details';
  static String notification='/notification';
  static String filter='/filter';
  static String helping='/helping';
  static String results='/results';
  static String booking='/booking';
  static String addProperty='/addProperty';
  static String agents='/agents';
  static String agentDetails='/agentDetails';
  static String lang='/lang';

  static String getOnBoardingRout() => onBoarding;
  static String getSignINRout() => signIN;
  static String getSignUpRout() => signUp;
  static String getHomeRout() => home;
  static String getLayoutRout() => layout;
  static String getForgetPassRout() => resetPass;
  static String getCheckCodeRout() => checkCode;
  static String getCreatePassRout() => createPass;
  static String getChatRout() => chat;
  static String getChatContactsRout() => chatContacts;
  static String getProfileRout() => profile;
  static String getFavoritesRout() => favorites;
  static String getDetailsRout() => details;
  static String getNotificationRout() => notification;
  static String getFilterRout() => filter;
  static String getHelpingRout() => helping;
  static String getResultsRout() => results;
  static String getSplashRout() => splash;
  static String getBookingRout() => booking;
  static String getAddPropertyRout() => addProperty;
  static String getAgentsRout() => agents;
  static String getAgentDetailsRout() => agentDetails;
  static String getLangRout() => lang;
  List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signIN, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: layout, page: () => HomeLayout(),binding: HomeBinding()),
    GetPage(name: resetPass, page: () => ResetPasswordScreen()),
    GetPage(name: checkCode, page: () => const VerificationScreen()),
    GetPage(name: createPass, page: () => const CreateNewPassScreen()),
    GetPage(name: chat, page: () => const ChatScreen(id: '')),
    GetPage(name: chatContacts, page: () => const ChatContactScreen()),
    GetPage(name: profile, page: () => const ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: favorites, page: () => const FavoritesScreen()),
    GetPage(name: details, page: () => const PropertyDetailsScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),
    GetPage(name: filter, page: () => const FilterScreen(),binding: FilterBinding()),
    GetPage(name: helping, page: () => const HelpingScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: booking, page: () => const BookingScreen()),
    GetPage(name: agents, page: () =>  AgentsScreen()),
    GetPage(name: agentDetails, page: () => const AgentDetailsScreen()),
    GetPage(name: lang, page: () => LangScreen()),
    GetPage(name: results, page: () => ResultsScreen(),binding: ResultsBinding()),
    GetPage(name: addProperty, page: () => const AddingPropertyScreen(),binding: AddPropertyBinding()),

  ];

}