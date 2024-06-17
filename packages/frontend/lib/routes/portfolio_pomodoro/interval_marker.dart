import 'package:frontend/widgets/widgets.dart';

class IntervalMarker extends StatelessWidget {
  const IntervalMarker({super.key, required this.status});

  final IntervalMarkerStatus status;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(switch (status) {
        IntervalMarkerStatus.unstarted => "icons/interval_unstarted.svg",
        IntervalMarkerStatus.started => "icons/interval_started.svg",
        IntervalMarkerStatus.complete => "icons/interval_complete.svg"
      });
}

enum IntervalMarkerStatus { unstarted, started, complete }
