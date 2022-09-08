
import 'package:amazon_design/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<Books>> getBooks() async
  {
    var booksList = <Books>[];
    var b1 = Books(bookId: 1,bookImageName: "blood.jpg", bookName: "Ateş ve Kan", bookAuthor: "George R.R Martin", starNumber: 4.5, bookPrice: 94,bookPrice2: 92,deliveryDate: "Teslim Tarihi: 2-5 Eylül ");
    var b2 = Books(bookId: 2, bookImageName: "buz.png", bookName: "Buz ve Ateşin Dünyası ", bookAuthor: "George R.R Martin", starNumber: 5, bookPrice: 116,bookPrice2: 61, deliveryDate: "Teslim Tarihi: 3-6 Eylül");
    var b3 = Books(bookId: 3, bookImageName:"sondilek.jpg", bookName: "Son Dilek", bookAuthor: "Andrzej Sapkowski", starNumber: 4, bookPrice: 61,bookPrice2: 60, deliveryDate: "Teslim Tarihi: 4-8 Eylül");
    booksList.add(b1);
    booksList.add(b2);
    booksList.add(b3);
    return booksList;

  }

  var textFController = TextEditingController();
  var swControl = false;
  double numHeight = 0;
  double numWidth = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF8fdedb),
        leading: const Icon(Icons.arrow_back,color: Colors.black,),
        elevation: 0,
        title: Container(
          width: double.infinity, // ?
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(6)),
            child:Center(
              child: TextField(
                cursorHeight: numHeight,
                cursorWidth: numWidth,
                controller: textFController,
                style:  const TextStyle(fontSize: 16),
                decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  suffixIcon: Icon(Icons.center_focus_strong_outlined,color: Colors.grey,),
                  border: InputBorder.none,
                  hintText: "Amazon.com.tr'de Ara",
                 //   contentPadding: EdgeInsets.only(left: 5)
                ),
                keyboardType: TextInputType.text,

            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
      child:Column(
          children: [
            IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("images/prime.png",width: 50,height: 50,),
                  SizedBox(width: 20,height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SwitchListTile(
                          value: swControl,
                         // controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? check){
                            setState(() {
                              swControl = check!;
                            });

                          },
                      ),
                    ),
                  ),
                  const Spacer(),
                   const VerticalDivider(
                      color: Color(0xFFe7e7e7),
                      thickness: 1,
                    ),

                   const Padding(
                     padding: EdgeInsets.only(left: 5),
                     child: Text("Filtreler",style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.w100,fontSize: 16,color: Color(0xFF2294c1)),),
                   ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.keyboard_arrow_down_rounded,color: Color(0xFF2294c1),),
                  ),

                ],
              ),
            ),
            ),
            const Divider(
              color: Color(0xFFe7e7e7),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: FutureBuilder<List<Books>>(
                future: getBooks(),
                builder: (context,snapshot){
                  if(snapshot.hasData)
                    {
                      var booksList = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: booksList!.length,
                          itemBuilder: (context,index)
                          {
                          var book = booksList[index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 0,
                              child: Row(
                                children: [

                                  SizedBox(width: 170,height: 156
                                      ,child: Image.asset("images/${book.bookImageName}")),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 38,right: 5),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(book.bookName,style: const TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.w500,color: Colors.black,fontSize: 16, ),textAlign: TextAlign.left,maxLines: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(book.bookAuthor,style: const TextStyle(color: Colors.grey,fontSize: 16, ),),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: RatingBar.builder(
                                      initialRating: book.starNumber,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 15,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                          children : [
                                            Text("${book.bookPrice}",style: const TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.w500,color: Colors.black,fontSize: 18,),),

                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Text("${book.bookPrice2}",style: const TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.w100,color: Colors.black,fontSize: 16,),),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text("TL",style: TextStyle(color: Colors.black,fontSize: 16,),),
                                            ),

                                          ],
                                      ),
                                    ),
                                    Text(book.deliveryDate,style: const TextStyle(color: Colors.grey,fontSize: 16, ),),

                                  ],
                                ),
                              ),
                                ],
                              ),
                            ),
                          );
                          },
                      );
                    }else{
                    return const Center();
                  }
                }

              ),
            ),

          ],
        ),
      ),
    );
  }
}
