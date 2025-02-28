import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/barnameview/utils/setvideoplayercontroller.dart';

Future<XFile> generateThumbnail(ActivityItem element) async {
  XFile thumbnailFile = await VideoThumbnail.thumbnailFile(
    video: element.expand.activity!.video.isEmpty
        ? testVideoLink
        : element.expand.activity!.video,
    imageFormat: ImageFormat.WEBP,
    maxHeight: 160,
    quality: 75,
  );

  return thumbnailFile;
}
