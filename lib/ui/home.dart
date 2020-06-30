import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movieapp/model/movies.dart';
//import 'package:movieapp/model/questions.dart';
import 'package:movieapp/ui/movie_ui/movie_ui.dart';


class MovieListView extends StatelessWidget {
  final List<Movie> movieList=Movie.getMovies();
  final List movies=[
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,

      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context,int index){
            /*  return Card(
          elevation: 10.0,
          shadowColor: Colors.blue,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieList[index].images[0]),
                    fit: BoxFit.cover
                  ),
                 // color: Colors.blue,
                  borderRadius: BorderRadius.circular(14)
                ),
              ),
            ),
            trailing: Container(child: Icon(Icons.thumb_up)),
            title: Text(movieList[index].title),
            subtitle: Text("${movieList[index].director}"),
            //onTap: ()=> debugPrint("Movie: ${movies[index]}"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>MovieListViewDetails(movieName: movieList[index].title,movie: movieList[index],)));
            },

          ),
        ); */
            return Stack(children:<Widget>[
              MovieCard(movieList[index], context),
              Positioned(
                  top: 10.0,
                  child: Movieimage(movieList[index].images[0]))
            ]);
          }),
    );
  }
  Widget MovieCard(Movie movie,BuildContext context)
  {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 45.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 50.0,right: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(child: Text(movie.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Colors.white),)),
                      Text("Ratings: ${movie.imdbRating}/10",style: mainTextStyle(),)
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Released: ${movie.released}",style: mainTextStyle(),),
                      Text("${movie.runtime}",style: mainTextStyle(),),
                      Text("${movie.rated}",style: mainTextStyle(),)


                    ],
                  )
                ],

              ),
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>MovieListViewDetails(movieName: movie.title,movie: movie,)));

      },
    );

  }
  TextStyle mainTextStyle(){
    return TextStyle(
        fontSize: 13.0,
        color: Colors.grey
    );
  }
  Widget Movieimage(String imageUrl){
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ?? 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmaurocuppone.files.wordpress.com%2F2014%2F03%2Fnot-here-x-sito-21.jpg&imgrefurl=https%3A%2F%2Fmaurocuppone.wordpress.com%2Fcategory%2Fnot-here%2F&tbnid=BabxSDEExDoA0M&vet=12ahUKEwiw-PGGs-HpAhUXG3IKHYt4BioQMygCegUIARDdAQ..i&docid=MoZmwc-wuWgjnM&w=1400&h=933&q=not%20here&ved=2ahUKEwiw-PGGs-HpAhUXG3IKHYt4BioQMygCegUIARDdAQ'),
              fit: BoxFit.cover
          )
      ),
    );

  }

}




class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: Text("Movies"),

      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0],),
          MovieDetailHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          Spacer(),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images,)
        ],
      ),
/*      body: Container(
       // color: Colors.white,
        child: Center(
          child: RaisedButton(
            color: Colors.grey,
            child:  Text("Go Back ${this.movie.director}"),
            onPressed: (){
            Navigator.pop(context);
            },
          ),
        ),
      ),*/
    );

  }

}

