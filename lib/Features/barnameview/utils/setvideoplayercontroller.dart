import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:video_player/video_player.dart';

const testVideoLink =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
VideoPlayerController setVideoPlayerController(ActivityItem element) {
  print(element.expand.activity?.video);
  return VideoPlayerController.networkUrl(Uri.parse(
      element.expand.activity!.video.isEmpty
          ? testVideoLink
          : element.expand.activity!.video));
}
