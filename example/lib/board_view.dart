import 'package:flutter/material.dart';
import 'package:crm_utils/crm_utils.dart';

class CRMBoardViewExample extends StatelessWidget {



  final List<CRMBoardListObject> _listData = [
    CRMBoardListObject(title: "List title 1"),
    CRMBoardListObject(title: "List title 2"),
    CRMBoardListObject(title: "List title 3")
  ];


  //Can be used to animate to different sections of the CRMBoardView
  CRMBoardViewController boardViewController = CRMBoardViewController();

  CRMBoardViewExample({super.key});



  @override
  Widget build(BuildContext context) {
    List<CRMBoardList> lists = [];
    for (int i = 0; i < _listData.length; i++) {
      lists.add(_createCRMBoardList(_listData[i]) as CRMBoardList);
    }
    return CRMBoardView(
      lists: lists,
      boardViewController: boardViewController,
    );
  }

  Widget buildCRMBoardItem(CRMBoardItemObject itemObject) {
    return CRMBoardItem(
        onStartDragItem: (int? listIndex, int? itemIndex, CRMBoardItemState? state) {

        },
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, CRMBoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].items![oldItemIndex!];
          _listData[oldListIndex].items!.removeAt(oldItemIndex);
          _listData[listIndex!].items!.insert(itemIndex!, item);
        },
        onTapItem: (int? listIndex, int? itemIndex, CRMBoardItemState? state) async {

        },
        item: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(itemObject.title!),
          ),
        ));
  }

  Widget _createCRMBoardList(CRMBoardListObject list) {
    List<CRMBoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildCRMBoardItem(list.items![i]) as CRMBoardItem);
    }

    return CRMBoardList(
      onStartDragList: (int? listIndex) {

      },
      onTapList: (int? listIndex) async {

      },
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _listData[oldListIndex!];
        _listData.removeAt(oldListIndex);
        _listData.insert(listIndex!, list);
      },
      headerBackgroundColor: const Color.fromARGB(255, 235, 236, 240),
      backgroundColor: const Color.fromARGB(255, 235, 236, 240),
      header: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  list.title!,
                  style: const TextStyle(fontSize: 20),
                ))),
      ],
      items: items,
    );
  }
}

class CRMBoardItemObject{

  String? title;

  CRMBoardItemObject({this.title}){
    title ??= "";
  }

}

class CRMBoardListObject{

  String? title;
  List<CRMBoardItemObject>? items;

  CRMBoardListObject({this.title,this.items}){
    title ??= "";
    items ??= [];
  }
}