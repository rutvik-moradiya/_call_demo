import 'package:api/model/job_model.dart';
import 'package:api/model/pincode_model.dart';
import 'package:api/model/states_model.dart';
import 'package:api/services/demo_services.dart';
import 'package:api/ui/stock_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  Future<PincodeArea>? _pincodearea;
  List<StatesNames> stateList = [];
  List<PincodeArea> areaList1 = [];

  String? id;
  String? name;
  String? releaseDate;
  String? manufacturer;

  Future<dynamic>? futureObj;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  var list;
  String pincode = '395011';

  // void getStates() async {
  //   String urlState = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';
  //   var resp = await http.get(Uri.parse(urlState));
  //   var stateJsonData = jsonDecode(resp.body);
  //   stateList = stateJsonData.map((model) => States.fromJson(model)).toList();
  //
  //   // StatesName statesObject= StatesName(
  //   //   states : stateJsonData['states'],
  //   //   ttl : stateJsonData['ttl'] as int,
  //   //
  //   // );
  //   // stateList.add(statesObject);
  // }

  // Future getArea(String Pincode) async {
  //   var items;
  //   String urlPin = 'https://api.postalpincode.in/pincode/${Pincode}';
  //
  //   var resp = await http.get(Uri.parse(urlPin));
  //   List<void> newdata= [];
  //   setState(() {
  //
  //     var  stateJsonData = json.decode(resp.body);
  //      items =stateJsonData[0]['PostOffice'][0].toString();
  //
  //     PincodeArea data=PincodeArea.fromJson(json.decode(resp.body)[0] as Map<String,dynamic>);
  //     // areaList1.addAll(stateJsonData[0]['PostOffice'] as List<PostOffice> );
  //     // areaList1.addAll(items);
  //     print(data.postOffice![1].toString());
  //     print(items);
  //     // for(int i=0; i<data.postOffice!.length;i++){
  //     //   print(data.postOffice![i].name);
  //     //   newdata =data.postOffice![i] as List<void>;
  //     // }
  //          // PostOffice localAreaData = PostOffice.fromJson(data.postOffice) as Map<String,dynamic>;
  //     // print(localAreaData);
  //
  //     // areaList1.addAll(items);
  //          // .map((model) => PostOffice.fromJson(model)).toList();
  //   });
  //   // PincodeArea statesObject= PincodeArea(
  //   //   message : stateJsonData['message'],
  //   //   status : stateJsonData['status'] ,
  //   //   postOffice : stateJsonData['postOffice'] ,
  //   //
  //   // );
  //   // stateList.add(statesObject);
  //
  //    // return newdata ;
  //   return items;
  //
  // }

  //
  // Future<PincodeArea> getArea(String pincode) async {
  //    String url = 'https://api.postalpincode.in/pincode/${pincode}';
  //    var _responce  = await http.get(Uri.parse(url));
  //    return  PincodeArea.fromJson(json.decode(_responce.body)[0]);
  //  }
  @override
  void initState() {
    // getStates();
    // _pincodearea = API_Manager().getDetails();
    super.initState();
    // futureObj = getArea(pincode);

    // getNews();
  }

  Future<dynamic> showPopup() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Container(
                  height: 500,
                  width: 100,
                  child: FutureBuilder<NameJob>(
                      future: SwaggerDemo().getDataJob(),
                      builder: (BuildContext ctx, snapshot) {
                        if (snapshot.hasData) {
                          return   ListTile(
                            title:
                            Text('${snapshot.data!.name}'),subtitle: Text('${snapshot.data!.createdAt}'),);

                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }))
            ],
            content: Text('data'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return stateList != null
        ? Scaffold(
            appBar: AppBar(
              title: Text('JsonData'),
              actions: [],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                              validator: (id) {
                                if (id!.isEmpty) {
                                  const Text('iD');
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _controller,
                              style: const TextStyle(
                                letterSpacing: .5,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              onFieldSubmitted: (value) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  labelText: 'ID',
                                  icon: Icon(Icons.perm_identity))),
                          TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  const Text('please enter Name');
                                }
                              },
                              keyboardType: TextInputType.name,
                              controller: _controller1,
                              style: const TextStyle(
                                letterSpacing: .5,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              onFieldSubmitted: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Name', icon: Icon(Icons.person))),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.length > 6 || value.isEmpty) {
                                        const Text(
                                            'please enter Date of Manufacture');
                                      }
                                    },
                                    controller: _controller2,
                                    style: const TextStyle(
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        releaseDate = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        labelText: 'ManufactureDate',
                                        icon: Icon(Icons.date_range))),
                              ),
                              /*  Container(
                                width: MediaQuery.of(context).size.width * .2,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showPopup();
                                  },
                                  child: Text('Check'),
                                ),
                              ),*/
                            ],
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  const Text('please enter Details of Company');
                                }
                              },
                              keyboardType: TextInputType.name,
                              controller: _controller3,
                              style: const TextStyle(
                                letterSpacing: .5,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              onFieldSubmitted: (value) {
                                setState(() {
                                  manufacturer = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Name', icon: Icon(Icons.person))),
                          ElevatedButton(
                              onPressed: () {
                                id = _controller.text;
                                name = _controller1.text;
                                // releaseDate = _controller2.text;
                                // manufacturer = _controller3.text;
                                // SwaggerDemo().makePost();
                                SwaggerDemo().addJob(id!, name);
                                print('tapped');
                                showPopup();
                              },
                              child: Text('Submit')),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: FutureBuilder(
                      future: SwaggerDemo().getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      title: Text('Id :' + snapshot.data.id),
                                      subtitle:
                                          Text('Name :' + snapshot.data.name),
                                    ),
                                    // Text(snapshot.data[index].manufacturer.name),
                                    // Text(snapshot.data[index].manufacturer.phone),
                                    // Text(snapshot.data[index].manufacturer.homePage),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  /*  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: 500,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return DataTable(sortColumnIndex: 1,
                              // sortAscending: true,
                              columns: [
                                DataColumn(label: Text('Id')),
                                DataColumn(label: Text('State Name')),
                              ], rows: [
                            DataRow(cells: [
                              DataCell(Text("hello'")),
                              DataCell(Text(
                                  "stateList[index].states![index]['state_name']")),
                            ])
                          ]);
                          //   Padding(
                          //   padding: const EdgeInsets.all(14),
                          //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       // Container(child: Text('Person Profile  : ',style: GoogleFonts.abel(fontSize: 20,color: Colors.green), )),
                          //       //
                          //       // Container(child: Text('firstName : ' + list[index].firstName),),
                          //       // Container(child: Text('age : '+'${list[index].age}'),),
                          //       // Container(child: Text('lastName : '+list[index].lastName),),
                          //       // Container(child: Text('gender : ' + list[index].gender),),
                          //       // Container(child: Text('phoneNumbers  : ',style: GoogleFonts.abel(fontSize: 20,color: Colors.green), )),
                          //       // Column(
                          //       //   children: [
                          //       //     Text('Phone Number Type : ' + list[index].phoneNumbers[index]['type']),
                          //       //     Text('Phone Number  : ' + list[index].phoneNumbers[index]['number']),
                          //       //   ],
                          //       // ),
                          //       // Column(
                          //       //   children: [
                          //       //     Container(child: Text('Address  : ',style: GoogleFonts.abel(fontSize: 20,color: Colors.green), )),
                          //       //
                          //       //     Text('city : ' + list[index].address.city),
                          //       //     Text('streetAddress : ' + list[index].address.streetAddress),
                          //       //     Text('state : ' + list[index].address.state),
                          //       //     Text('postalCode : ' + list[index].address.postalCode),
                          //       //
                          //       //   ],
                          //       // ),
                          //       Container(child: Text('States  : ',style: GoogleFonts.abel(fontSize: 20,color: Colors.green), )),
                          //
                          //       Text('Total States : ' + '${stateList[index].ttl}'),
                          //        Text('States : ' + stateList[index].states[index]['state_name']),
                          //
                          //     ],
                          //   ),
                          // );
                        }),
                  ),*/
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.to(const StockScreen()),
            ),
          )
        : Center(child: CupertinoActivityIndicator());
  }
}
