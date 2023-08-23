import 'package:api_with_provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Api with provider", style: TextStyle(color: Colors.white),),
      ),

      body: Provider.of<ApiProvider>(context).isLoading?
      const Center(child: CircularProgressIndicator(color: Colors.blueGrey,),):

          ListView.builder(
              itemCount: Provider.of<ApiProvider>(context).apiResponse['data'].length,
              itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(Provider.of<ApiProvider>(context).apiResponse['data'][index]['avatar'].toString())
              ),

              title: Text(Provider.of<ApiProvider>(context).apiResponse['data'][index]['last_name'].toString()),
              subtitle: Text(Provider.of<ApiProvider>(context).apiResponse['data'][index]['email'].toString()),
            );
          })
    );
  }
}
