import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/home_cubit.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 158.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  imageUrl: productEntity.image ?? "",
                  width: 158.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productEntity.title ?? '',
              style: GoogleFonts.poppins(color: Color(0xff004182))
                  .copyWith(height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'EGP ${productEntity.price}',
              style: GoogleFonts.poppins(color: AppColors.primary)
                  .copyWith(height: 1.1),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 5, bottom: 8),
            child: Row(
              children: [
                Text(
                  'Review',
                  style: GoogleFonts.poppins(color: Color(0xff004182).withOpacity(.3))
                      .copyWith(height: 1.1),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  '(4.5)',
                  style: GoogleFonts.poppins(color:Color(0xff004182).withOpacity(.3)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Icon(
                  Icons.star,
                  color: AppColors.primary,
                  size: 15,
                ),
                const Spacer(),
                SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: () {},
                    backgroundColor: AppColors.primary,
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
