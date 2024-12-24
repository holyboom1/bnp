import 'dart:io';

Future<bool> isDartVersionInRange(String minVersion, String maxVersion) async {
  final ProcessResult processResult = await Process.run(
    'dart',
    <String>['--version'],
    runInShell: true,
  );
  final String versionOutput = processResult.stdout.toString().trim();
  final RegExpMatch? versionMatch = RegExp(r'version: ([\d\.]+)').firstMatch(versionOutput);
  if (versionMatch != null) {
    final String? sdkVersion = versionMatch.group(1);
    if (sdkVersion != null) {
      final int? numericSdkVersion = int.tryParse(sdkVersion.split('.').first);
      final int? numericMinVersion = int.tryParse(minVersion.split('.').first);
      final int? numericMaxVersion = int.tryParse(maxVersion.split('.').first);
      if (numericSdkVersion != null && numericMinVersion != null && numericMaxVersion != null) {
        if (numericSdkVersion >= numericMinVersion && numericSdkVersion <= numericMaxVersion) {
          return true;
        }
      }
    }
  }

  return false;
}
