import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/inbox/chat_detail_screen.dart';
import 'package:tictok_app/main.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  List<int> _items = [];

  final Duration _duration = Duration(milliseconds: 300);

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(_items.length, duration: _duration);
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
          index,
          (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: Container(color: Colors.red, child: _makeTile(index))),
          duration: _duration);
      _items.remove(index);
    }
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(),
      ),
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: _onChatTap,
      leading: CircleAvatar(
        radius: 25,
        child: Text('네로'),
        foregroundImage: NetworkImage(MYGITHUBIMAGE),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lynn $index',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '2:17pm',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: Text('last messsage blablalbl'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direct Message'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: AnimatedList(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        key: _key,
        itemBuilder: (context, index, Animation<double> animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child:
                SizeTransition(sizeFactor: animation, child: _makeTile(index)),
          );
        },
      ),
    );
  }
}
