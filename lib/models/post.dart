class Post{
  String id,title,content,dateWritten,featuredImage;
  int userId,categoryId;
  int votesUp,votesDown;
  List<int> votersUp,votersDown;

  Post({this.id, this.title, this.content, this.dateWritten, this.featuredImage,
      this.userId, this.categoryId, this.votesUp, this.votesDown, this.votersUp,
      this.votersDown});


}