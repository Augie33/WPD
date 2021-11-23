import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wpd_app/ui/screens/qr_screen.dart';
import 'package:wpd_app/ui/widgets/custom_button.dart';
import 'package:wpd_app/ui/widgets/floating_buttons.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';
import 'package:wpd_app/view_models/signal_case_screen_viewmodel.dart';

class SingleCaseScreen extends ConsumerStatefulWidget {
  const SingleCaseScreen({Key? key, required this.caseId}) : super(key: key);

  final String? caseId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SingleCaseScreenState();
}

class _SingleCaseScreenState extends ConsumerState<SingleCaseScreen> {
  @override
  void initState() {
    super.initState();

    ref
        .read(SingalCaseScreenViewModelProvider.provider)
        .fetchCase(caseId: widget.caseId);

    ref.read(SingalCaseScreenViewModelProvider.provider).getDataFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final singalCaseViewModel =
            ref.watch(SingalCaseScreenViewModelProvider.provider);
        final myCase = singalCaseViewModel.myCase;

        final authViewModel = ref.watch(AuthStateViewModelProvider.provider);

        final cartViewModel = ref.watch(CartViewModelProvider.provider);

        return singalCaseViewModel.isLoading
            ? const Center(
                child: ScreenLoader(),
              )
            : myCase == null
                ? Scaffold(
                    appBar: AppBar(),
                    body: Center(
                      child: Text(
                        'No Case with this ID',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(myCase.title),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: SelectableText(
                                          'Category:   ${myCase.category.title}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: SelectableText(
                                          'Number:    #${myCase.caseNumber}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        'Share',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          icon: Icons.qr_code_2,
                                          label: 'QR',
                                          onPressed: () async {
                                            if (singalCaseViewModel
                                                .inclueCaseNumber) {
                                              final success =
                                                  await cartViewModel
                                                          .showCaseNumberDialog(
                                                              context) ??
                                                      false;

                                              if (!success) {
                                                return;
                                              }

                                              final cart = await cartViewModel
                                                  .createCart(
                                                userId:
                                                    authViewModel.myUser!.id,
                                              );
                                              HapticFeedback.lightImpact();

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  fullscreenDialog: true,
                                                  builder: (context) =>
                                                      QRScreen(
                                                    cartId: cart?.id,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              HapticFeedback.lightImpact();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  fullscreenDialog: true,
                                                  builder: (context) =>
                                                      const QRScreen(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        CustomButton(
                                          icon: Icons.share,
                                          label: 'Share',
                                          onPressed: () async {
                                            if (singalCaseViewModel
                                                .inclueCaseNumber) {
                                              final success =
                                                  await cartViewModel
                                                          .showCaseNumberDialog(
                                                              context) ??
                                                      false;

                                              if (!success) {
                                                return;
                                              }

                                              final cart = await cartViewModel
                                                  .createCart(
                                                userId:
                                                    authViewModel.myUser!.id,
                                              );
                                              HapticFeedback.lightImpact();
                                              await singalCaseViewModel
                                                  .shareCase(
                                                userId:
                                                    authViewModel.myUser!.id,
                                                cartId: cart?.id,
                                              );
                                            } else {
                                              HapticFeedback.lightImpact();
                                              await singalCaseViewModel
                                                  .shareCase(
                                                userId:
                                                    authViewModel.myUser!.id,
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SwitchListTile(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      title: const Text(
                                        'Add case number',
                                      ),
                                      value:
                                          singalCaseViewModel.inclueCaseNumber,
                                      onChanged: singalCaseViewModel
                                          .toggleInclueCaseNumber,
                                    ),
                                    SwitchListTile(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      title: const Text(
                                        'Include your info',
                                      ),
                                      value: singalCaseViewModel.inclueInfo,
                                      onChanged:
                                          singalCaseViewModel.toggleInclueInfo,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        'Description',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 20,
                                      ),
                                      child: Text(
                                        myCase.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: InkWell(
                                  onTap: () async {
                                    await canLaunch(myCase.url)
                                        ? await launch(myCase.url)
                                        : BotToast.showText(text: 'Error');
                                  },
                                  customBorder: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 10,
                                        ),
                                        child: Text(
                                          'URL',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 15,
                                        ),
                                        child: Text(
                                          myCase.url,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        'PDF',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                    myCase.urlPDF == ''
                                        ? Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Center(
                                              child: Text(
                                                'N/A',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              if (Platform.isIOS ||
                                                  Platform.isAndroid)
                                                Container(
                                                  height: 570,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 20,
                                                  ),
                                                  child: singalCaseViewModel
                                                      .showPDF(),
                                                ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 15,
                                                ),
                                                child: ListTile(
                                                  onTap: () async {
                                                    await canLaunch(
                                                            myCase.urlPDF)
                                                        ? await launch(
                                                            myCase.urlPDF,
                                                          )
                                                        : BotToast.showText(
                                                            text: 'Error',
                                                          );
                                                  },
                                                  trailing: FaIcon(
                                                    FontAwesomeIcons.expandAlt,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  title: Center(
                                                    child: Text(
                                                      myCase.urlPDF,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      floatingActionButton: const FloatingButtons(),
                    ),
                  );
      },
    );
  }
}
