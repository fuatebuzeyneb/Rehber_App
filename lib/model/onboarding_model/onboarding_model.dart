import 'package:travel_app/consts.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel(this.title, this.subTitle, this.image);
}

List<OnBoardingModel> onboardingContact = [
  OnBoardingModel(
    'Title onBoarding One',
    'Discover the wonders of a tropical paradise and indulge in breathtaking sunsets, pristine beaches, and vibrant culture.',
    kOnboardingImage1,
  ),
  OnBoardingModel(
    'Title onBoarding Tow',
    'Discover the wonders of a tropical paradise and indulge in breathtaking sunsets, pristine beaches, and vibrant culture.',
    kOnboardingImage2,
  ),
  OnBoardingModel(
    'Title onBoarding There',
    'Discover the wonders of a tropical paradise and indulge in breathtaking sunsets, pristine beaches, and vibrant culture.',
    kOnboardingImage3,
  ),
];
