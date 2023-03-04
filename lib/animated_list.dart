import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final items =[];
  final GlobalKey<AnimatedListState> key= GlobalKey();

  void addItem(){
    items.insert(0, 'Item ${items.length + 1}');
    key.currentState!.insertItem(0,duration: const Duration(seconds: 1),
    );
  }

  void removeItem(int index)
  {
    key.currentState!.removeItem(index,
     (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text('Deleted',style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
     },
     duration: const Duration(milliseconds: 300),
     );
     items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter map'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 11, 76, 216),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 10,),
          IconButton(onPressed: addItem, icon: const Icon(Icons.add),
          ),
          Expanded(child: AnimatedList(key: key,
          initialItemCount: 0,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context,index,animation){
            return SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child:  Card(
                margin: const EdgeInsets.all(10),
                color: const Color.fromARGB(255, 11, 76, 216),
                child: ListTile(
                  title: Text(items[index],style: const TextStyle(fontSize: 24),
                
                  ),
                  trailing: IconButton(icon: const Icon(Icons.delete),
                  onPressed: (){
                    removeItem(index);
                  },
                  ),
                ),
              ),
            );
          },
          ),
          )
        ],
      ),

    );
  }
}












