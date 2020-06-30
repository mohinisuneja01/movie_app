import 'package:flutter/material.dart';
import 'package:movieapp/model/movies.dart';



class MovieDetailsThumbnail extends StatelessWidget {
  @override
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack( alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:NetworkImage(thumbnail),fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          height: 80,
        ),

      ],

    );
  }
}

class MovieDetailHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeaderWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster:movie.images[0].toString()),
          SizedBox(width: 16),
          Expanded(
            child: MovieDetailsHeader(movie:movie),
          )
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 170,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}
class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year} . ${movie.genre}".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w400,color: Colors.cyan),),
        Text("${movie.title}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 32.0),),
        Text.rich(TextSpan(style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                  text:movie.plot,
                  style: TextStyle(color: Colors.indigo)
              ),
              TextSpan(
                  text: "More...",
                  style: TextStyle(color: Colors.cyan)
              )]))
      ],
    );
  }
}


class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),

      child: Column(
        children: <Widget>[
          MovieFields(fields:"Cast",value:movie.actors),
          MovieFields(fields:"Directors",value:movie.director),
          MovieFields(fields:"Awards",value:movie.awards),
        ],
      ),
    );
  }
}

class MovieFields extends StatelessWidget {
  final String fields;
  final String value;

  const MovieFields({Key key, this.fields, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$fields :" ,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black38),),
          Flexible(child: Text(value,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.black),))
        ],

      ),
    );
  }
}
class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12.0),
      child: Container(
        height: 0.5,

        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 12.0),
          child: Text("More Movie Posters".toUpperCase(),style: TextStyle(fontSize: 14,color: Colors.black26),),
        ),
        Container(
          height: 180,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(posters[index]),fit: BoxFit.cover)
                    ),
                  ),
                ),
                separatorBuilder: (context,index)=>SizedBox(width: 8.0,),
                itemCount: posters.length),
          ),
        )

      ],
    );
  }
}
