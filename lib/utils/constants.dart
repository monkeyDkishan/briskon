part of utils;

Color kPrimaryColor = const Color(0xffCD2029);
Color kSecondaryTitleColor = const Color(0xff444444);
Color kLightGrayColor = const Color(0xff535763);
Color kFontGrayColor = const Color(0xff4F4F4F);
Color kSuccessOrderColor = const Color(0xff009A19);
Color kSuccessPendingColor = const Color(0xffFF9E42);
Color kBGColor = Colors.white;

// Routes
String kInitialRoute = '/';
String kLoginRoute = '/LoginScreen';
String kRegisterRoute = '/RegisterScreen';
String kHomeRoute = '/HomeScreen';
String kAddEnquiryRoute = '/AddEnquiryScreen';
String kAddOrderDetailsRoute = '/AddOrderDetailsScreen';
String kOrderListRoute = '/OrderListScreen';
String kOrderDetailsRoute = '/OrderDetailsScreen';
String kMyAccountRoute = '/MyAccountScreen';
String kCertificatedRoute = '/CertificatedScreen';
String kDistributorsRoute = '/DistributorsScreen';
String kContactUsRoute = '/ContactUsScreen';
String kProfileRoute = '/ProfileScreen';
String kKYCRoute = '/KYCScreen';
String kApplicationRoute = '/ApplicationScreen';
String kProductDetailsRoute = '/ProductDetailsScreen';
String kConfirmOrderRoute = '/ConfirmOrderScreen';

// Fonts
const String kRegularFonts = 'Roboto';

// Paths
const String appName = 'Briskon';
const String appBundle = 'com.automation.vavis';

// Messages
const String kOfflineMessage = "You are offline please connect to the internet";
const String kOfflineNetworkMessage = "You are offline please connect to the network";

// Font Sizes
double kCommonFontSize = 14.0;
double kFontSize15 = 15.0;
double kFontSize20 = 20.0;
double kFontSize12 = 12.0;
double kFontSize13 = 13.0;

fillTheCommonSizeINIT() {
  kCommonFontSize = 14.0.sp;
  kFontSize12 = 12.0.sp;
  kFontSize13 = 13.0.sp;
  kFontSize15 = 15.0.sp;
  kFontSize20 = 20.0.sp;
}

//Text limits
const int nameLimit = 50;
const int passwordLimit = 50;
const int mobileLimit = 10;
const int addressLimit = 100;
