import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../constant/Ads/check.dart';

class AdsProvider extends ChangeNotifier{
  bool isHomePageBanner_Loaded=false;
  bool isDetailScreen_Banner_Loaded=false;
  bool isSavedScreen_Banner_Loaded=false;
  bool isBackToHome_Interstitial_Loaded=false;

  late BannerAd HomePageBanner;
  late BannerAd DetailScreen_Banner;
  late BannerAd SavedScreen_Banner;
  late InterstitialAd BackToHome_Interstitial;
// For Initialization Of HomePageBanner Ads
  void initializedHomePageBanner()async{
    HomePageBanner=BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelper.banner_id,
        listener: BannerAdListener(
          onAdLoaded: (ad){
            log('Home Page Banner Loaded');
            isHomePageBanner_Loaded=true;
            notifyListeners();
          },
          onAdClosed: (ad){
            ad.dispose();
            isHomePageBanner_Loaded=false;
            notifyListeners();
          },
          onAdFailedToLoad: (ad,err){
            log(err.toString());
            log('yha error h');
            isHomePageBanner_Loaded=false;
            notifyListeners();
          }

        ),
        request: AdRequest()

    );
   await HomePageBanner.load();
   notifyListeners();
  }
// For Initialization Of DetailScreen_Banner Ads
  void initializedDetailScreen_Banner()async{
    DetailScreen_Banner=BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelper.banner_id_2,
        listener: BannerAdListener(
            onAdLoaded: (ad){
              log('Home Page Banner Loaded');
              isDetailScreen_Banner_Loaded=true;
            },
            onAdClosed: (ad){
              ad.dispose();
              isDetailScreen_Banner_Loaded=false;
            },
            onAdFailedToLoad: (ad,err){
              log(err.toString());
              isDetailScreen_Banner_Loaded=false;
            }

        ),
        request: AdRequest()

    );
    await DetailScreen_Banner.load();
    notifyListeners();
  }
// For Initialization Of BackToHome_Interstitial Ads
  void initializedSavedScreen_Banner()async{
    SavedScreen_Banner=BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelper.banner_id_3,
        listener: BannerAdListener(
            onAdLoaded: (ad){
              log('Home Page Banner Loaded');
              isSavedScreen_Banner_Loaded=true;
            },
            onAdClosed: (ad){
              ad.dispose();
              isSavedScreen_Banner_Loaded=false;
            },
            onAdFailedToLoad: (ad,err){
              log(err.toString());
              isSavedScreen_Banner_Loaded=false;
            }

        ),
        request: AdRequest()

    );
    await SavedScreen_Banner.load();
    notifyListeners();
  }
void InitializationFullPageAd()async{
    await InterstitialAd.load(
        adUnitId: AdsHelper.inter_id,
        request: AdRequest(),
        adLoadCallback:InterstitialAdLoadCallback(
          onAdFailedToLoad: (err){
            log(err.toString());
            isBackToHome_Interstitial_Loaded=false;
          },
            onAdLoaded: (ad) {
              log('Full Page Ads Loaded !');
              BackToHome_Interstitial=ad;
              isBackToHome_Interstitial_Loaded=true;
            }
        )


    );
    notifyListeners();


}
}