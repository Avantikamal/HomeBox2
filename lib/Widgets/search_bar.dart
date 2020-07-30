import 'package:flutter/material.dart';
import 'package:homebox/screens/product_details.dart';

//class SearchBar extends StatefulWidget {
//  @override
//  _SearchBarState createState() => new _SearchBarState();
//}
//
//class _SearchBarState extends State<SearchBar> {
//  Widget appBarTitle = new Text(
//    "Search Example",
//    style: new TextStyle(color: Colors.white),
//  );
//  Icon icon = new Icon(
//    Icons.search,
//    color: Colors.black,
//  );
//  final globalKey = new GlobalKey<ScaffoldState>();
//  final TextEditingController _controller = new TextEditingController();
//  List<dynamic> _list;
//  bool _isSearching;
//  String _searchText = "";
//  List searchresult = new List();
//
//  _SearchBarState() {
//    _controller.addListener(() {
//      if (_controller.text.isEmpty) {
//        setState(() {
//          _isSearching = false;
//          _searchText = "";
//        });
//      } else {
//        setState(() {
//          _isSearching = true;
//          _searchText = _controller.text;
//        });
//      }
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _isSearching = false;
//    values();
//  }
//
//  void values() {
//    _list = List();
//    _list.add("apple");
//    _list.add("banana");
//    _list.add("beverages");
//    _list.add("aata");
//    _list.add("fruits");
//    _list.add("vegetables");
//    _list.add("care products");
//    _list.add("dairy");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        key: globalKey,
//        appBar: buildAppBar(context),
//        body: new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new Flexible(
//                  child: searchresult.length != 0 || _controller.text.isNotEmpty
//                      ? new ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: searchresult.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      String listData = searchresult[index];
//                      return new ListTile(
//                        title: new Text(listData.toString()),
//                      );
//                    },
//                  )
//                      : new ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: _list.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      String listData = _list[index];
//                      return new ListTile(
//                        title: new Text(listData.toString()),
//                      );
//                    },
//                  ))
//            ],
//          ),
//        ));
//  }
//
//  Widget buildAppBar(BuildContext context) {
//    return new AppBar(
//      backgroundColor: Colors.white,
//        elevation: 0.0,
//        centerTitle: true, title: appBarTitle, actions: <Widget>[
//      new IconButton(
//        icon: icon,
//        onPressed: () {
//          setState(() {
//            if (this.icon.icon == Icons.search) {
//              this.icon = new Icon(
//                Icons.close,
//                color: Colors.white,
//              );
//              this.appBarTitle = new TextField(
//                controller: _controller,
//                style: new TextStyle(
//                  color: Colors.black,
//                ),
//                decoration: new InputDecoration(
//                    prefixIcon: new Icon(Icons.search, color: Colors.white),
//                    hintText: "Search...",
//                    hintStyle: new TextStyle(color: Colors.black)),
//                onChanged: searchOperation,
//              );
//              _handleSearchStart();
//            } else {
//              _handleSearchEnd();
//            }
//          });
//        },
//      ),
//    ]);
//  }
//
//  void _handleSearchStart() {
//    setState(() {
//      _isSearching = true;
//    });
//  }
//
//  void _handleSearchEnd() {
//    setState(() {
//      this.icon = new Icon(
//        Icons.search,
//        color: Colors.black,
//      );
//      this.appBarTitle = new Text(
//        "Search Sample",
//        style: new TextStyle(color: Colors.black),
//      );
//      _isSearching = false;
//      _controller.clear();
//    });
//  }
//
//  void searchOperation(String searchText) {
//    searchresult.clear();
//    if (_isSearching != null) {
//      for (int i = 0; i < _list.length; i++) {
//        String data = _list[i];
//        if (data.toLowerCase().contains(searchText.toLowerCase())) {
//          searchresult.add(data);
//        }
//      }
//    }
//  }
//}

class Search extends SearchDelegate<String>{

  final products=[
    "fruits",
    "Vegetables",
    "mango",
    "apple",
    "Sugar",
    "Milk",
    "Eggs",
  ];

final recentProducts=["apple","aata","beverages"];

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear,color: Colors.black,), onPressed: ()=> query="")
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
       color: Colors.black, progress: transitionAnimation),
       onPressed: ()=> close(context,null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(

    );
//Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_details()));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
final suggestion=query.isEmpty? recentProducts : products.where((element) => element.startsWith(query)).toList();
return ListView.builder(itemBuilder:(context,index)=>
    ListTile(
      onTap:()=> showResults(context),
      leading: Icon(Icons.history),
      title: RichText(text: TextSpan(text: suggestion[index].substring(0,query.length),
      style: TextStyle(
        color: Colors.black,
fontWeight: FontWeight.bold  ),
      children: [
        TextSpan(
          text: suggestion[index].substring(query.length),
          style: TextStyle(
            color: Colors.grey
          )
      )
          ])),
    ),
    itemCount: suggestion.length,
);
  }
  
}



//import 'package:flutter/material.dart';
//
//class SearchBar extends StatefulWidget {
//  final List<String> list = List.generate(10, (index) => "Text $index");
//
//  @override
//  _SearchBarState createState() => _SearchBarState();
//}
//
//class _SearchBarState extends State<SearchBar> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        actions: <Widget>[
//          IconButton(
//            onPressed: () {
//              showSearch(context: context, delegate: Search(widget.list));
//            },
//            icon: Icon(Icons.search),
//          )
//        ],
//        centerTitle: true,
//        title: Text('Search Bar'),
//      ),
//      body: ListView.builder(
//        itemCount: widget.list.length,
//        itemBuilder: (context, index) => ListTile(
//          title: Text(
//            widget.list[index],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class Search extends SearchDelegate {
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    return <Widget>[
//      IconButton(
//        icon: Icon(Icons.close),
//        onPressed: () {
//          query = "";
//        },
//      ),
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    return IconButton(
//      icon: Icon(Icons.arrow_back),
//      onPressed: () {
//        Navigator.pop(context);
//      },
//    );
//  }
//
//  String selectedResult = "";
//
//  @override
//  Widget buildResults(BuildContext context) {
//    return Container(
//      child: Center(
//        child: Text(selectedResult),
//      ),
//    );
//  }
//
//  final List<String> listExample;
//  Search(this.listExample);
//
//  List<String> recentList = ["Text 4", "Text 3"];
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    List<String> suggestionList = [];
//    query.isEmpty
//        ? suggestionList = recentList //In the true case
//        : suggestionList.addAll(listExample.where(
//      // In the false case
//          (element) => element.contains(query),
//    ));
//
//    return ListView.builder(
//      itemCount: suggestionList.length,
//      itemBuilder: (context, index) {
//        return ListTile(
//          title: Text(
//            suggestionList[index],
//          ),
//          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
//          onTap: (){
//            selectedResult = suggestionList[index];
//            showResults(context);
//          },
//        );
//      },
//    );
//  }
//}