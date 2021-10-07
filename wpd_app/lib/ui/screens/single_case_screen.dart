import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:wpd_app/ui/widgets/custom_button.dart';
import 'package:wpd_app/ui/widgets/custom_form_field.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/signal_case_screen_viewmodel.dart';

class SingleCaseScreen extends StatefulWidget {
  const SingleCaseScreen({Key? key, required this.caseId}) : super(key: key);

  final String? caseId;

  @override
  State<SingleCaseScreen> createState() => _SingleCaseScreenState();
}

class _SingleCaseScreenState extends State<SingleCaseScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read(SingalCaseScreenViewModelProvider.provider)
        .fetchCase(caseId: widget.caseId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final singalCaseViewModel =
            watch(SingalCaseScreenViewModelProvider.provider);
        final myCase = singalCaseViewModel.myCase;

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
                : Scaffold(
                    appBar: AppBar(
                      title: Text(myCase.title),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star_border),
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
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
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        icon: Icons.qr_code_2,
                                        label: 'QR',
                                        onPressed: () {
                                          Routemaster.of(context).push('qr');
                                        },
                                      ),
                                      CustomButton(
                                        icon: Icons.email,
                                        label: 'Email',
                                        onPressed: () {
                                          Routemaster.of(context).push('email');
                                        },
                                      ),
                                      CustomButton(
                                        icon: Icons.share,
                                        label: 'Share',
                                        onPressed: () async {
                                          await singalCaseViewModel.shareCase();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  SwitchListTile(
                                    activeColor: Theme.of(context).primaryColor,
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
                                      style:
                                          Theme.of(context).textTheme.headline3,
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
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
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
                                      'URL',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 10,
                                      bottom: 15,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await canLaunch(myCase.url)
                                            ? await launch(myCase.url)
                                            : BotToast.showText(text: 'Error');
                                      },
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
                                    ),
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
                                      'PDF',
                                      style:
                                          Theme.of(context).textTheme.headline3,
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
                                            Container(
                                              height: 600,
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 20,
                                              ),
                                              child:
                                                  singalCaseViewModel.showPDF(),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 15,
                                              ),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  await canLaunch(myCase.urlPDF)
                                                      ? await launch(
                                                          myCase.urlPDF)
                                                      : BotToast.showText(
                                                          text: 'Error');
                                                },
                                                child: Text(
                                                  myCase.urlPDF,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}

class QRScreen extends ConsumerWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final singalCaseViewModel =
        watch(SingalCaseScreenViewModelProvider.provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: Center(
        child: Card(
          child: singalCaseViewModel.showQR(),
        ),
      ),
    );
  }
}

class EmailScreen extends HookWidget {
  EmailScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please, write your email';
    } else if (!isEmail(value)) {
      return 'Please, write valid email';
    } else {
      return null;
    }
  }

  Future<void> _send(
    BuildContext context,
    SingalCaseScreenViewModel viewModel,
    TextEditingController _emailController,
  ) async {
    if (_key.currentState?.validate() ?? false) {
      print('send');

      BotToast.showText(text: 'Email send to ${_emailController.text}');

      Routemaster.of(context).pop();
    } else {
      debugPrint('Error :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    final singalCaseViewModel =
        useProvider(SingalCaseScreenViewModelProvider.provider);

    final emailController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send by Email'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomFormField(
                controller: emailController,
                autofocus: true,
                hintText: 'Email',
                icon: Icons.email,
                validator: _validateEmail,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Send'),
                onPressed: () async {
                  await _send(context, singalCaseViewModel, emailController);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
