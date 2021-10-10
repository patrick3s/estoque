import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
// banner ca-app-pub-4501329271036176/6670996468
// interticial ca-app-pub-4501329271036176/2076025774
// ios banner ca-app-pub-4501329271036176/8753114763
// ios interticial ca-app-pub-4501329271036176/5014299860
class AdmobService {
  final String _iosBanner ='';
  final String _iosIntersticial ='';
  final String _androidBanner ="ca-app-pub-4501329271036176/7270613294";
  final String _androidIntersticial = 'ca-app-pub-4501329271036176/5506105480';
  late AdmobBannerSize bannerSize;
   AdmobInterstitial? interstitialAd;
   AdmobReward? rewardAd;
  AdmobBanner? admobBanner;
  GlobalKey<FormFieldState<bool>>? _formKey;
  AdmobService() {
    _formKey = GlobalKey();
    bannerSize = AdmobBannerSize.BANNER;

    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd?.load();
        handleEvent(event, args!, 'Interstitial');
      },
    );

    rewardAd = AdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) rewardAd?.load();
        handleEvent(event, args!, 'Reward');
      },
    );

    interstitialAd?.load();
    rewardAd?.load();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        break;
      case AdmobAdEvent.opened:
        break;
      case AdmobAdEvent.closed:
        break;
      case AdmobAdEvent.failedToLoad:
        break;
      case AdmobAdEvent.rewarded:
        break;
      default:
    }
  }

  void bannerEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
      case AdmobAdEvent.opened:
        _formKey?.currentState?.didChange(true);
        break;
      case AdmobAdEvent.closed:
      case AdmobAdEvent.failedToLoad:
        _formKey?.currentState?.didChange(false);
        break;
      case AdmobAdEvent.rewarded:
    
        break;
      default:
    }
  }

  showIntertistial() async {
    if (await interstitialAd?.isLoaded == true) {
      interstitialAd?.show();
    } else {

    }
  }

  showReward() async {
    if (await rewardAd?.isLoaded == true) {
      rewardAd?.show();
    } else if (await rewardAd?.isLoaded == true) {
      rewardAd?.show();
    } else if (await rewardAd?.isLoaded == true) {
      rewardAd?.show();
    }
  }

  showBanner() {
    return FormField<bool>(
        key: _formKey,
        builder: (state) {
    
          return state.value == null
              ? SizedBox(
                  child: AdmobBanner(
                    adUnitId: getBannerAdUnitId(),
                    adSize: bannerSize,
                    listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
                      bannerEvent(event, args!, 'Banner');
                    },
                    onBannerCreated: (AdmobBannerController controller) {
                      // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                      // Normally you don't need to worry about disposing this yourself, it's handled.
                      // If you need direct access to dispose, this is your guy!
                      // controller.dispose();
                    },
                  ),
                )
              : state.value == true
                  ? SizedBox(
                      child: AdmobBanner(
                        adUnitId: getBannerAdUnitId(),
                        adSize: bannerSize,
                        listener:
                            (AdmobAdEvent event, Map<String, dynamic>? args) {
                          bannerEvent(event, args!, 'Banner');
                        },
                        onBannerCreated: (AdmobBannerController controller) {
                          // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                          // Normally you don't need to worry about disposing this yourself, it's handled.
                          // If you need direct access to dispose, this is your guy!
                          // controller.dispose();
                        },
                      ),
                    )
                  : Container();
        });
  }

  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return _iosBanner;
    } else {
      return _androidBanner;
    }
   
  }

  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return _iosIntersticial;
    } else{
      return _androidIntersticial;
    }
 
  }

  String getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    } else{
      return 'ca-app-pub-3940256099942544/5224354917';
    }

  }

  dispose() {
    interstitialAd?.dispose();
    rewardAd?.dispose();
  }
}
