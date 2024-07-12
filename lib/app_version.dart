import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thyra_core/extensions/build_context_extension.dart';

class AppVersion extends HookWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: discarded_futures
    final Future<PackageInfo> future = useMemoized(PackageInfo.fromPlatform);
    final snapshot = useFuture(future, initialData: null);

    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        return Text(
          "Version ${snapshot.data?.version ?? '?'}",
          style: context.theme.textTheme.bodySmall!
              .copyWith(color: context.theme.hintColor),
        );
      }
      if (snapshot.hasError) {
        return const SizedBox.shrink();
      }
    }

    return const Center(child: CircularProgressIndicator());
  }
}
