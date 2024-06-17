import 'package:frontend/widgets.dart';
import 'package:frontend/widgets/widgets.dart';

class ExperienceEntry extends PaneSection {
  ExperienceEntry(
      {required this.jobName,
      required this.dates,
      required this.jobTitle,
      required this.description,
      this.link});

  final String jobName;
  final String dates;
  final String jobTitle;
  final String description;
  final String? link;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobName,
                style: Fonts.h5,
              ),
              Text(
                dates,
                style: Fonts.h5,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            jobTitle,
            style: Fonts.semiBold,
          ),
          const SizedBox(height: 8),
          Text(description)
        ],
      ));
}
