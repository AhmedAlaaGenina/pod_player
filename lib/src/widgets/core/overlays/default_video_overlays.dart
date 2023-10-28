part of 'package:pod_player/src/pod_player.dart';

class DefaultVideoOverlays extends StatelessWidget {
  final String tag;

  const DefaultVideoOverlays({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);

    ///Built in overlay
    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      id: 'overlay',
      builder: (podCtr) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: podCtr.isOverlayVisible ? 1 : 0,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              if (!kIsWeb) _MobileOverlay(tag: tag),
              if (kIsWeb) _WebOverlay(tag: tag),
            ],
          ),
        );
      },
    );
  }
}
