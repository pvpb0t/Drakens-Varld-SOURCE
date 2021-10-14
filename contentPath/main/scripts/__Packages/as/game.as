class as.game
{
   var currentSquareX = 10;
   var currentSquareY = 10;
   var cameFromX = 0;
   var cameFromY = 0;
   var invStar1 = 0;
   var invStar2 = 0;
   var invStar3 = 0;
   var invStar4 = 0;
   var invStar5 = 0;
   var deadObjArr = new Array();
   function game(root)
   {
      root.attachMovie("fader","fader",100000);
      root.attachMovie("svartPlatta2","svartPlatta2",100003);
      root.attachMovie("svartPlatta3","svartPlatta3",100004);
      root.fader.gotoAndStop("black");
   }
   function deleteDeadObj(X, Y)
   {
      this.i = 0;
      while(this.i < this.deadObjArr.length)
      {
         removeMovieClip(this.deadObjArr[this.i]);
         this.i = this.i + 1;
      }
      trace("///////");
      this.deadObjArr = new Array();
      trace(this.deadObjArr);
      this.currentSquareX = this.currentSquareX + X;
      this.currentSquareY = this.currentSquareY + Y;
      trace("_" + this.currentSquareX + "_" + this.currentSquareY);
      trace(this.invStar1 + " star1");
      trace(this.invStar2 + " star2");
      trace(this.invStar3 + " star3");
      trace(this.invStar4 + " star4");
      trace(this.invStar5 + " star5");
      this.cameFromX = 0;
      this.cameFromY = 0;
      _root.man.dontWalk = false;
      gotoAndStop("_" + this.currentSquareX + "x" + this.currentSquareY);
   }
}
