import 'package:api/model/stock_dividend_model.dart';
import 'package:api/model/stock_high_model.dart';
import 'package:api/model/stock_search_model.dart';
import 'package:api/model/weather_model.dart';
import 'package:api/services/weather_services.dart';
import 'package:api/widget/stock_service.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  String text = '';

  final SearchBarController _searchBarController = SearchBarController();
  String details = '';
  String time = '2021-12-14 20:00:00';
  String StockName = 'AAPL';
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

/*   getExtraDetails(){

    FutureBuilder<StockHigh>(
        future: Stocks().getStockHigh(StockName),
        builder: (BuildContext ctx,AsyncSnapshot snpsot) {

          final details = snpsot.data!.metaData!.the1Information.toString();
          return details;

        }
    );
  }*/
  Widget selected(String time, StockName) {
    return FutureBuilder<StockHigh>(
      future: Stocks().getStockHigh(StockName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                if (snapshot.data!.timeSeries5Min!["$time"] != null) {
                  return Column(
                    children: [
                      Text('OPEN : '
                          '${snapshot.data!.timeSeries5Min!['$time']!.the1Open}'),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Text('HIGH : '
                          '${snapshot.data!.timeSeries5Min!['$time']!.the2High}'),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Text('LOW : '
                          '${snapshot.data!.timeSeries5Min!['${time}']!.the3Low}'),
                      Text('CLOSE : '
                          '${snapshot.data!.timeSeries5Min!['${time}']!.the4Close}'),
                      Text('VOLUME : '
                          '${snapshot.data!.timeSeries5Min!['${time}']!.the5Volume}'),
                    ],
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget dividendDetails(String StockName) {
    return FutureBuilder<StockDividend>(
      future: Stocks().getStockDividenddetails(StockName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (BuildContext context, index) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text('Amount : '
                            '${snapshot.data!.results![index].amount}'),
                        subtitle: Text('Declare DAte : '
                            '${snapshot.data!.results![index].declaredDate}'),
                      ),
                      ListTile(
                        title: Text('EX-Date : '
                            '${snapshot.data!.results![index].exDate!}'),
                        subtitle: Text('recordDate : '
                            '${snapshot.data!.results![index].recordDate}'),
                      )
                    ],
                  );
                } else
                  return CircularProgressIndicator();
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget weatherDataDisplay() {
    return Container(
        child: FutureBuilder<Weather>(
      future: WeatherAPI().getWeatherReport(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.cnt!.toInt(),
              itemBuilder: (BuildContext context, index) {
                if (snapshot.hasData) {
                  return DataTable(
                    horizontalMargin: 1,
                    dataRowHeight: 20,

                      columns:   const [
                    DataColumn(label: Text('Id')),
                    DataColumn(label: Text('main')),
                    DataColumn(label: Text('description')),
                  ], rows: snapshot.data!.list![index].weather!.map((e) =>  DataRow(cells: <DataCell>[
                      DataCell(Text('${e.id}')),
                      DataCell(Text('${e.main}')),
                      DataCell(Text(e.description.toString())),
                  ])).toList(),);

                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  searchFunction() {
    var searchElement;
    FutureBuilder(
      future: Stocks().getSearch(text),
      builder: (ctx, snaps) {
        return ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Text(snaps.data.toString());
            });
      },
    );
    return searchElement;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(details),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 500,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: SearchBar<StockSearch>(
                onItemFound: searchFunction(),
                onSearch: searchFunction(),
                scrollDirection: Axis.vertical,
                searchBarController: _searchBarController,
                hintText: 'Enter The Stock Name',
              ),
            ),
            Container(padding: EdgeInsets.all(5),
              height: 150,
              child: weatherDataDisplay(),
            ),
            Text("Enter '${StockName}' details In Time in Fomrat of 2021-12-13 19:35:00"),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter the Company Symbol',
              ),
              onFieldSubmitted: (value1) {
                controller:
                _controller1;
                setState(() {
                  StockName = value1;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter the Time in Fomrat of 2021-12-13 19:35:00',
              ),
              onFieldSubmitted: (value) {
                controller:
                _controller;
                setState(() {
                  time = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _controller1;
                _controller;
                selected(time, StockName);
              },
              child: Text('Submit'),
            ),
            Container(
              child: Text(
                time,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              child: Text(
                'Symbol : ' + StockName,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: selected(time, StockName),
              height: 200,
            ),
            Container(
              alignment: Alignment.center,
              child: dividendDetails(StockName),
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
