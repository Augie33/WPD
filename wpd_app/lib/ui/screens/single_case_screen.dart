import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wpd_app/ui/widgets/custom_button.dart';
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
                                        onPressed: () {},
                                      ),
                                      CustomButton(
                                        icon: Icons.email,
                                        label: 'Email',
                                        onPressed: () {},
                                      ),
                                      CustomButton(
                                        icon: Icons.share,
                                        label: 'Share',
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  SwitchListTile(
                                    activeColor: Theme.of(context).primaryColor,
                                    title: const Text(
                                      'Include your info',
                                    ),
                                    value: true,
                                    onChanged: (_) {},
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
                                            : throw 'Could not launch ${myCase.url}';
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
                                  Container(
                                    height: 600,
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 10,
                                      bottom: 20,
                                    ),
                                    child: singalCaseViewModel.showPDF(),
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
