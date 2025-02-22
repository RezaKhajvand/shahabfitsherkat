import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/shagerdtype.dart';
import 'package:shahabfit/Features/oldversion/widgets/shagerdlist.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        image: DecorationImage(
          image: AssetImage('images/shahabbg.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: controller,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                      _debounce = null;
                    }
                    _debounce = Timer(
                        Duration(milliseconds: 800),
                        () => context
                            .read<ShagerdBloc>()
                            .add(FetchShagerdEvent(searchText: value)));
                  },
                  style: const TextStyle(
                      fontSize: 14, letterSpacing: 0, color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: primary),
                    prefixIcon: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.close, color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: cardBorderRadius,
                        borderSide: BorderSide.none),
                    fillColor: const Color.fromARGB(217, 13, 13, 13),
                    hintStyle: const TextStyle(color: Colors.white30),
                    hintText: 'جستجو',
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                  ),
                ),
              ),
            ),
            body: ShagerdList(type: ShagerdType.all)),
      ),
    );
  }
}
