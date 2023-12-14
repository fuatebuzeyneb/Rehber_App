import '../../helper/cache_helper.dart';
import '../service_locator.dart';

void OnBoardingVisitedFun() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}
