import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haggle_x/services/main_service.dart';
import 'package:haggle_x/widgets/appbar.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imageValue =
        context.select((MainAppProvider img) => img.image);
    final int index = context.select((MainAppProvider idx) => idx.index);
    final String stringValue =
        context.select((MainAppProvider str) => str.value);
    final List<String> listStringValue =
        context.select((MainAppProvider str) => str.others);

    final String randString =
        context.select((MainAppProvider str) => str.randomString);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Receive crypto',
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 30),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        displayModalBottomSheet(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: CustomTheme.grey400.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: CustomTheme.grey500,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  imageValue,
                                  height: 30,
                                ),
                                Width(1.5.h),
                                Text(
                                  stringValue,
                                  style: CustomTheme.bodyText5,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: CustomTheme.greyish,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (listStringValue != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Height(2.0.h),
                          Text(
                            'Select Network',
                            style: CustomTheme.label.copyWith(
                              color: CustomTheme.grey400.withOpacity(0.6),
                            ),
                          ),
                          Row(
                            children:
                                listStringValue.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  final provider = Provider.of<MainAppProvider>(
                                      context,
                                      listen: false);
                                  provider.setIndex(entry.key);
                                  provider.setRandomString();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    margin:
                                        EdgeInsets.only(right: 10.0, top: 10.0),
                                    decoration: BoxDecoration(
                                        color: CustomTheme.grey400
                                            .withOpacity(0.2),
                                        border: Border.all(
                                          color: entry.key == index
                                              ? CustomTheme.grey500
                                              : CustomTheme.grey400
                                                  .withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        )),
                                    child: Text(entry.value,
                                        style: CustomTheme.label)),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    Height(5.0.h),
                    Text(
                      '$stringValue deposit address',
                      style: CustomTheme.label,
                    ),
                    Height(3.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          border: Border.all(
                            color: CustomTheme.purple30.withOpacity(0.31),
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: QrImage(
                          backgroundColor: Colors.white,
                          data: randString,
                          version: QrVersions.auto,
                          size: 30.0.h,
                          gapless: true,
                        ),
                      ),
                    ),
                    Height(2.5.h),
                    Container(
                      decoration: BoxDecoration(
                          color: CustomTheme.grey400.withOpacity(0.1),
                          border: Border.all(
                            color: CustomTheme.grey500,
                          )),
                      child: Row(
                        children: [
                          Width(1.5.h),
                          Expanded(
                            flex: 9,
                            child: Text(
                              randString,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTheme.label.copyWith(
                                  color: Colors.white.withOpacity(0.88)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    new ClipboardData(text: randString));
                                Get.snackbar(
                                  'Copied',
                                  'Copied to clipboard!',
                                );
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: CustomTheme.purple20,
                                  child: Image.asset(
                                    'assets/images/copy.png',
                                    scale: 3.0,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Height(12.0.h),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: CustomTheme.grey400.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/info.png',
                            scale: 3.0,
                          ),
                          Width(2.0.h),
                          Text(
                            'Send only $stringValue to this deposit address',
                            style: CustomTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    Height(2.0.h),
                    Divider(
                      color: CustomTheme.purple30.withOpacity(0.31),
                    ),
                    Text(
                      '• Paste a $stringValue address only through this means. \n• Sending coins or token other than $stringValue to this address may result in the loss of your tokens',
                      style: CustomTheme.subtitle3.copyWith(height: 2),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Select wallet to receive',
                    style: CustomTheme.headline5,
                  ),
                  Height(2.0.h),
                  ModalTile(
                    image: 'assets/images/btc_ic.png',
                    title: 'Bitcoin (BTC)',
                    value: 'BTC',
                  ),
                  ModalTile(
                    image: 'assets/images/eth.png',
                    title: 'Ethereum (ETH)',
                    value: 'ETH',
                  ),
                  ModalTile(
                    image: 'assets/images/usdt.png',
                    title: 'Tether (USDT)',
                    value: 'USDT',
                    others: ['ER20', 'OMNI'],
                  ),
                  ModalTile(
                    image: 'assets/images/bch.png',
                    title: 'Bitcoin Cash (BCH)',
                    value: 'BCH',
                  ),
                  ModalTile(
                    image: 'assets/images/dash.png',
                    title: 'Dash (DASH)',
                    value: 'DASH',
                  ),
                  ModalTile(
                    image: 'assets/images/doge.png',
                    title: 'Dodecoin (DOGE)',
                    value: 'DOGE',
                  ),
                  ModalTile(
                    image: 'assets/images/litecoin.png',
                    title: 'Litecoin (LTC)',
                    value: 'LTC',
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ModalTile extends StatelessWidget {
  final String image, title, value;
  final List<String> others;

  const ModalTile({Key key, this.image, this.title, this.value, this.others})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
          leading: Image.asset(
            image,
            height: 40,
          ),
          title: Text(
            title,
            style: CustomTheme.title,
          ),
          onTap: () {
            final _provider =
                Provider.of<MainAppProvider>(context, listen: false);
            _provider.setNotifier(image, value, others);
            _provider.setRandomString();
          }),
    );
  }
}
