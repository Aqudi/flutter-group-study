import 'package:flutter/material.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class ChattingRoomPage extends StatelessWidget {
  final String? name;

  const ChattingRoomPage({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: name,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 0,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.black.withOpacity(0.08),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Material(
                    color: Colors.yellow,
                    child: InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.send),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
