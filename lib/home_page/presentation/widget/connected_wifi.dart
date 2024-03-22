import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widget.dart';
import '../../../util/dimens.dart';
import '../../data/model/strength.dart';
import '../../data/model/wifi_details_model.dart';

class ConnectedWifi extends StatelessWidget {
  const ConnectedWifi({super.key, this.data});

  final WifiDetailsModel? data;

  @override
  Widget build(BuildContext context) {
    WiFiDetails? _wifiDetails;
    String bssid = data?.wifiAnalyser
            ?.elementAt(0)
            .wiFiConnection
            ?.wiFiIdentifier
            ?.bssid ??
        '';
    if (data!.wifiAnalyser![0].wiFiDetails != null) {
      _wifiDetails = data!.wifiAnalyser![0].wiFiDetails!
          .firstWhereOrNull((model) => model.wiFiIdentifier!.bssid == bssid);
    }
    if (_wifiDetails != null) {
      return Container(
        color: wificonnectedItemBgColor,
        // height: listItemHeight,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text:
                    '${_wifiDetails.wiFiIdentifier?.ssidRaw ?? ''} (${_wifiDetails.wiFiIdentifier?.bssid ?? ''})',
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CustomTextWidget(
                        text: '${_wifiDetails.wiFiSignal?.level ?? ''} dbm',
                        color: Strength.fromSignalLevel(
                                _wifiDetails.wiFiSignal!.level!.toInt())
                            .color,
                        fontWeight: FontWeight.w800,
                      ),
                      SvgPicture.asset(
                        Strength.fromSignalLevel(
                                _wifiDetails.wiFiSignal!.level!.toInt())
                            .svgPath,
                        color: Strength.fromSignalLevel(
                                _wifiDetails.wiFiSignal!.level!.toInt())
                            .color,
                        height: 50,
                      ),
                    ],
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
                                  '${_wifiDetails.wifiAbility?.channelDisplay ?? ""}',
                              color: Color(0xFF33A8BD),
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CustomTextWidget(
                              text:
                                  '${_wifiDetails.wiFiSignal?.primaryFrequency ?? ""} MHz',
                              color: Color(0xFF28878B),
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CustomTextWidget(
                              text:
                                  '${_wifiDetails.wifiAbility?.distance ?? ""}',
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
                                  '${_wifiDetails.wiFiSignal?.primaryFrequency ?? ""}',
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
                                  '${_wifiDetails.wiFiSignal?.centerFrequency ?? ""}',
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CustomTextWidget(
                              text: '${_wifiDetails.wifiAbility?.width ?? ""}',
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
                                    '${_wifiDetails.wiFiSecurity?.capabilities ?? ""}',
                                color: Color(0xFF55666E),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text:
                        '${data?.wifiAnalyser?[0].wiFiConnection?.linkSpeed ?? ""} Mbps',
                    color: Color(0xFF3492DE),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  CustomTextWidget(
                    text:
                        '${data?.wifiAnalyser?[0].wiFiConnection?.ipAddress ?? ""}',
                    color: Color(0xFF3492DE),
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
