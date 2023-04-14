class WineType {
  late String id;
  late String name;
  late List<String> idList = [];
  late List<String> nameList = [];
  late List<String> descList = [];

  WineType(List<dynamic> list, int index) {
    id = list[index]["id"];
    name = list[index]["name"];
    var len = list[index]["members"].length;
    for (var i = 0; i < len; i++) {
      idList.add(list[index]["members"][i]["id"]);
      nameList.add(list[index]["members"][i]["name"]);
      descList.add(list[index]["members"][i]["description"]);
    }
  }
}
