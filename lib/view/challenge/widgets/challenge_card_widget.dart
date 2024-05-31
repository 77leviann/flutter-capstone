import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:palette_generator/palette_generator.dart';

class ChallengeCardWidget extends StatefulWidget {
  final int index;
  const ChallengeCardWidget({super.key, required this.index});

  @override
  State<ChallengeCardWidget> createState() => _ChallengeCardWidgetState();
}

class _ChallengeCardWidgetState extends State<ChallengeCardWidget> {
  List images = [
    ImagesConstant.forgotPass,
    ImagesConstant.onboardingImage2,
    ImagesConstant.onboardingImage3,
    ImagesConstant.onboardingImage1,
    ImagesConstant.registerSuccessImage,
  ];

  PaletteGenerator? paletteGenerator;

  List<Color> cardColors = [];

  @override
  void initState() {
    super.initState();
    initializeCardColors();
  }

  void initializeCardColors() {
    List<Color> baseColors = [
      ColorsConstant.info300,
      ColorsConstant.danger300,
      ColorsConstant.warning300
    ];

    cardColors = List.generate(images.length, (index) {
      return baseColors[index % baseColors.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColors[widget.index],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: ColorsConstant.success100,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Mudah',
                      style: TextStylesConstant.nunitoCaptionBold
                          .copyWith(color: ColorsConstant.success600),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 62,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.neutral50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsConstant.poinXp),
                            const SizedBox(width: 4),
                            Text(
                              '+50',
                              style:
                                  TextStylesConstant.nunitoCaptionBold.copyWith(
                                color: ColorsConstant.success600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 62,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: ColorsConstant.neutral50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsConstant.coin),
                            const SizedBox(width: 4),
                            Text(
                              '+100',
                              style:
                                  TextStylesConstant.nunitoCaptionBold.copyWith(
                                color: ColorsConstant.success600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              height: 214,
              decoration: const BoxDecoration(
                color: Color(0xFF113E35),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Aku Cinta Tote Bag',
              style: TextStylesConstant.nunitoHeading3.copyWith(
                fontWeight: FontWeight.w800,
                color: ColorsConstant.neutral900,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Membantu',
                  style: TextStylesConstant.nunitoButtonBold.copyWith(
                    color: ColorsConstant.neutral900,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: ColorsConstant.primary500,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: ColorsConstant.primary500,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Dengan menggunakan tote bag, masyarakat dapat mengurangi jumlah sampah plastik yang berkontribusi pada penurunan polusi dan kerusakan ekosistem.',
              style: TextStylesConstant.nunitoCaption.copyWith(
                color: ColorsConstant.neutral900,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                SvgPicture.asset(IconsConstant.threeUser),
                const SizedBox(width: 8),
                Text(
                  '100',
                  style: TextStylesConstant.nunitoFooterBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 4),
                Text(
                  'orang sedang melakukan tantangan ini',
                  style: TextStylesConstant.nunitoFooter,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
