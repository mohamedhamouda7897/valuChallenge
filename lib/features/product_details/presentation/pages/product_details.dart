// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valu_challenge/features/home/domain/entities/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/utils/app_colors.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity productEntity;

  ProductDetails(this.productEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.primary),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.quicksand(
              fontSize: 20.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: AppColors.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        color: const Color(0xff004182).withOpacity(.3),
                        width: 2.w)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: productEntity.image ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      productEntity.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0xff06004F)),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "${productEntity.price.toString()} EGP",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: AppColors.primary),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    height: 34.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            width: 1.h,
                            color: AppColors.primary.withOpacity(.3))),
                    child: Center(
                      child: Text(
                        '1200 Sold',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xff06004F)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffFDD835),
                    size: 15.h,
                  ),
                  productEntity.rating?.rate != null
                      ? Text(
                          '${productEntity.rating?.rate} (${productEntity.rating?.count})',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.primary),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 11.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: AppColors.primary),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   isExpanded = !isExpanded;
                  // });
                },
                child: Text(
                  productEntity.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  // maxLines: isExpanded ? 10 : 3,
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: const Color(0xff06004F).withOpacity(.6)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: const Color(0xff06004F).withOpacity(.6))),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP 3,000',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff06004F)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 32.w)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.add_shopping_cart_outlined),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Add to cart',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
