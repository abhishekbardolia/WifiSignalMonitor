import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/common_widget.dart';
import '../../../util/dimens.dart';
import '../../data/model/strength.dart';
import '../../data/model/wifi_details_model.dart';

class AllWifiDetails extends StatelessWidget {
  AllWifiDetails({super.key, this.data});

  final WifiDetailsModel? data;

  List<WiFiDetails>? sortWiFiDetails(List<WiFiDetails>? wiFiDetails) {
    if (wiFiDetails == null) return null;
    List<WiFiDetails> sortedList = List<WiFiDetails>.from(wiFiDetails);
    sortedList.sort((a, b) {
      final num levelA = a.wiFiSignal?.level ?? 0;
      final num levelB = b.wiFiSignal?.level ?? 0;

      return levelB.compareTo(levelA);
    });
    return sortedList;
  }

  List<WiFiDetails>? wifiDetails = [];

  @override
  Widget build(BuildContext context) {
    wifiDetails = data?.wifiAnalyser?.isNotEmpty == true
        ? sortWiFiDetails(data!.wifiAnalyser![0].wiFiDetails)
        : null;
    return ListView.separated(
      itemCount: wifiDetails?.length ?? 0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        WiFiDetails? wiFiDetails = wifiDetails![index];
        return WifiDetailItems(context, wiFiDetails);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(
            color: Colors.grey, // Color of the divider
            height: 1, // Height of the divider
          ),
        );
      },
    );
  }
}

Widget WifiDetailItems(BuildContext context, WiFiDetails? wiFiDetails) {
  return Container(
    // height: listItemHeight,
    padding: EdgeInsets.symmetric(vertical: 8),
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text:
                '${wiFiDetails?.wiFiIdentifier?.ssidRaw ?? ''} (${wiFiDetails?.wiFiIdentifier?.bssid ?? ''})',
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
          Row(
            children: [
              Container(
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: '${wiFiDetails?.wiFiSignal?.level ?? ''} dbm',
                      color: Strength.fromSignalLevel(
                              wiFiDetails?.wiFiSignal!.level!.toInt())
                          .color,
                      fontWeight: FontWeight.w800,
                    ),
                    SvgPicture.asset(
                      Strength.fromSignalLevel(
                              wiFiDetails?.wiFiSignal!.level!.toInt())
                          .svgPath,
                      color: Strength.fromSignalLevel(
                              wiFiDetails?.wiFiSignal!.level!.toInt())
                          .color,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'CH',
                        color: Color(0xFF7E7E7E),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomTextWidget(
                        text:
                            '${wiFiDetails?.wifiAbility?.channelDisplay ?? ""}',
                        color: Color(0xFF33A8BD),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomTextWidget(
                        text:
                            '${wiFiDetails?.wiFiSignal?.primaryFrequency ?? ""} MHz',
                        color: Color(0xFF28878B),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomTextWidget(
                        text: '${wiFiDetails?.wifiAbility?.distance ?? ""}',
                        color: Color(0xFF29867C),
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text:
                            '${wiFiDetails?.wiFiSignal?.primaryFrequency ?? ""}',
                        color: Color(0xFF919191),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomTextWidget(
                        text: '-',
                        color: Color(0xFF919191),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomTextWidget(
                        text:
                            '${wiFiDetails?.wiFiSignal?.centerFrequency ?? ""}',
                        color: Color(0xFF919191),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomTextWidget(
                        text: '${wiFiDetails?.wifiAbility?.width ?? ""}',
                        color: Color(0xFF919191),
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomTextWidget(
                          text:
                              '${wiFiDetails?.wiFiSecurity?.capabilities ?? ""}',
                          color: Color(0xFF55666E),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    ),
  );
}
