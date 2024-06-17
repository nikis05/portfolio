import 'package:frontend/widgets.dart';
import 'package:intersperse/intersperse.dart';

class Skill extends PaneSection {
  Skill({required this.image, required this.name, required this.level});

  final String image;
  final String name;
  final SkillLevel level;

  @override
  Widget build(BuildContext context) {
    final (skillLevelText, skillLevelColor, skillLevelBarCount) =
        switch (level) {
      SkillLevel.competent => ("Competent", Colors.green, 3),
      SkillLevel.proficient => ("Proficient", Colors.primary, 4),
      SkillLevel.expert => ("Expert", Colors.purple, 5)
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  "images/skill_mock.png",
                  height: 20,
                  width: 20,
                )),
            const SizedBox(
              width: 8,
            ),
            Text(name),
          ],
        ),
        Row(
          children: [
            Text(
              skillLevelText,
              style: Fonts.semiBold,
            ),
            const SizedBox(
              width: 8,
            ),
            ...Iterable<Widget>.generate(
                skillLevelBarCount,
                (_) => Container(
                    height: 16,
                    width: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: skillLevelColor))).intersperse(const SizedBox(
              width: 2,
            ))
          ],
        )
      ],
    );
  }
}

enum SkillLevel { competent, proficient, expert }
