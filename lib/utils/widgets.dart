import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/modules/web_view.dart';
import 'package:elkhabr/utils/helper.dart';
import 'package:elkhabr/utils/thems.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article, BuildContext context) => InkWell(
      onTap: () {
        push(
          WebScreen(
            url: article['url'],
          ),
        );
      },
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: "${article['urlToImage']}",
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline,
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article['title']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppCubit.get(context).isDark
                            ? Colors.black
                            : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "${article['publishedAt']}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget buildArticle(list, {isSearch = false}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 18, vertical: 16),
        itemBuilder: (context, index) => buildArticleItem(
          list[index],
          context,
        ),
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.primaryColor,
        ),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch ? Container() : const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );

Widget defaultTxtField({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String>? validator,
  required String label,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onChange,
  VoidCallback? onTap,
  bool isEnabled = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isEnabled,
      cursorColor: AppColors.primaryColor,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
      ),
    );
