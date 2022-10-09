part of utils;

class SVGImage{

  static Widget getImageFrom({required String image,double? width,double? height}){
    return SvgPicture.asset("assets/images/$image",width: width, height: height,);
  }

  static Widget getIconFrom({required String icon,double? width,double? height,Color? color}){
    return SvgPicture.asset("assets/icons/$icon", width: width, height: height,color: color,);
  }

}

class ImageGetter {

  static Image getImageFrom({required String image}){
    return Image.asset("assets/images/$image",fit: BoxFit.contain);
  }

}


class Assets {

  static Widget appLogoLight({double? width,double? height}) => SVGImage.getImageFrom(image: "briskon-logo-light.svg",width: width,height: height);
  static Widget appLogoDark({double? width,double? height}) => SVGImage.getImageFrom(image: "briskon-logo-dark.svg",width: width,height: height);
  static Widget emailIcon({double? width,double? height, Color? color}) => SVGImage.getIconFrom(icon: "email-icon.svg",width: width,height: height, color: color);
  static Widget websiteIcon({double? width,double? height, Color? color}) => SVGImage.getIconFrom(icon: "ic-website.svg",width: width,height: height, color: color);
  static Widget passwordIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "password-icon.svg",width: width,height: height);
  static Widget arrowRightIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "arrow-right-icon.svg",width: width,height: height);
  static Widget userIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "user-icon.svg",width: width,height: height);
  static Widget phoneIcon({double? width,double? height,Color? color}) => SVGImage.getIconFrom(icon: "phone-icon.svg",width: width,height: height,color: color);
  static Widget locationMarkIcon({double? width,double? height,Color? color}) => SVGImage.getIconFrom(icon: "location-mark-icon.svg",width: width,height: height,color: color);
  static Widget designationIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "designation-icon.svg",width: width,height: height);
  static Widget companyIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "company-icon.svg",width: width,height: height);
  static final Image logoBg = ImageGetter.getImageFrom(image: "auth-icon-bg.png");
  static final Image boxImg = ImageGetter.getImageFrom(image: "box-img.png");

  static Widget enquiryIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-enquiry-icon.svg",width: width,height: height,color: Colors.white);
  static Widget myOrderIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-my-order.svg",width: width,height: height,color: Colors.white);

  static Widget myAccountIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-my-account.svg",width: width,height: height,color: Colors.white);
  static Widget ourDistributorsIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-our-distributors.svg",width: width,height: height,color: Colors.white);
  static Widget contactUsIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-contact-us.svg",width: width,height: height,color: Colors.white);
  static Widget certificatesAndApprovalsIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-certifications-approvals.svg",width: width,height: height,color: Colors.white);
  static Widget aboutUsIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-about-us.svg",width: width,height: height,color: Colors.white);

  static Widget myAccountProfileIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-my-accout-profile.svg",width: width,height: height,color: Colors.black);
  static Widget myAccountLogoutIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-my-accout-logout.svg",width: width,height: height,color: Colors.black);
  static Widget kycIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "kyc-icon.svg",width: width,height: height,color: Colors.black);
  static Widget myAccountFeedbackIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-my-accout-feedback.svg",width: width,height: height,color: Colors.black);

  static Widget rateUsIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-rate-us.svg",width: width,height: height,color: Colors.black);
  static Widget privacyIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-privacy.svg",width: width,height: height,color: Colors.black);
  static Widget shareIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-share.svg",width: width,height: height,color: Colors.black);

  static Widget cameraIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-camera.svg",width: width,height: height);
  static Widget editIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-edit.svg",width: width,height: height);

  static Widget orderInvoiceIcon({double? width,double? height}) => SVGImage.getIconFrom(icon: "ic-order-invoice.svg",width: width,height: height);

  static Widget get facebookIcon => ImageGetter.getImageFrom(image: "facebook-icon.png");
  static Widget get instagramIcon => ImageGetter.getImageFrom(image: "instagram-icon.png");
  static Widget get linkedInIcon => ImageGetter.getImageFrom(image: "linkedin-icon.png");
  static Widget get twitterIcon => ImageGetter.getImageFrom(image: "twitter-icon.png");

  static Widget get briskonLogo => ImageGetter.getImageFrom(image: "briskon-logo.png",);

  static Widget get placeHolder => ImageGetter.getImageFrom(image: "placeholder.png");

  static final Image tmt500Img = ImageGetter.getImageFrom(image: "fe-500.png");
  static final Image tmt550Img = ImageGetter.getImageFrom(image: "Fe-550.png");
  static final Image tmt600Img = ImageGetter.getImageFrom(image: "Fe-600.png");

  static final Image menuSteelBarImg = ImageGetter.getImageFrom(image: "img-menu-grid-steel-bar.png");

  static final Image mapsImg = ImageGetter.getImageFrom(image: "maps_img.png");




}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/files/country_json');
}