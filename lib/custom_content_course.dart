import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomContentCourse extends StatelessWidget {
  const CustomContentCourse(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.duration,
      this.isSelected = false,
      required this.number});

  final String image;

  final String title;
  final String subTitle;
  final String duration;
  final String number;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 130,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        border: isSelected == true
            ? Border.all(color: Colors.blue, width: 3)
            : Border(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                  width:130,
                  height: 130,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    height: 130,
                    image,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: EdgeInsets.all(15),
                child: CustomText.titleMedium(
                  number,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CustomText.titleLarge(
                    'AppStrings.currentWork.tr()',


                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CustomText.titleMedium(
                        title,

                      ),
                    ),
                    CustomText.titleMedium(
                      subTitle,

                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CustomText.titleMedium(
                        duration,

                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
