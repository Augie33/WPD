import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    ),
                  );
      },
    );
  }
}
