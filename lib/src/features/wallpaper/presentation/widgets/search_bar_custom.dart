import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';

class SearchBarCustom extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value) onSubmitted;
  final Function(String value) onPressed;

  const SearchBarCustom(
      {super.key,
      required this.controller,
      required this.onPressed,
      required this.hintText,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final darkMode = context.watch<AppBloc>().state.darkMode;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[darkMode ? 600 : 200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => onPressed(controller.value.text),
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
