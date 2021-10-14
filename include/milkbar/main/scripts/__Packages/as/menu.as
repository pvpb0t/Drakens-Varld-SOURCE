class as.menu extends MovieClip
{
   var Yslide = 60;
   function menu()
   {
      super();
      this.menu1StartY = this.menu1._y;
      this.m1StartY = this.menu_1._y;
      this.menu2StartY = this.menu2._y;
      this.m2StartY = this.menu_2._y;
      this.menu3StartY = this.menu3._y;
      this.m3StartY = this.menu_3._y;
      this.menu_1._alpha = 0;
      this.menu_2._alpha = 0;
      this.menu_3._alpha = 0;
      this.menu_1.onRelease = function()
      {
         this._parent.menuFun(1,"red");
      };
      this.menu_2.onRelease = function()
      {
         this._parent.menuFun(2,"yel");
      };
      this.menu_3.onRelease = function()
      {
         this._parent.menuFun(3,"blue");
      };
   }
   function menuFun(who, color, reset)
   {
      if(this["menu_" + who]._alpha >= 100 or reset)
      {
         var _loc3_ = new mx.transitions.Tween(this["menu_" + who],"_alpha",mx.transitions.easing.Regular.easeOut,this["menu_" + who]._alpha,0,0.4,true);
         var _loc6_ = new mx.transitions.Tween(this["menu_" + who],"_y",mx.transitions.easing.Regular.easeOut,this["menu_" + who]._y,this["m" + who + "StartY"],0.2,true);
         var _loc4_ = new mx.transitions.Tween(this["menu" + who],"_y",mx.transitions.easing.Regular.easeOut,this["menu" + who]._y,this["menu" + who + "StartY"],0.2,true);
         this._parent[color] = false;
      }
      else
      {
         _loc3_ = new mx.transitions.Tween(this["menu_" + who],"_alpha",mx.transitions.easing.Regular.easeOut,0,100,0.4,true);
         _loc6_ = new mx.transitions.Tween(this["menu_" + who],"_y",mx.transitions.easing.Back.easeOut,this["m" + who + "StartY"],this["m" + who + "StartY"] - this.Yslide,0.2,true);
         _loc4_ = new mx.transitions.Tween(this["menu" + who],"_y",mx.transitions.easing.Back.easeOut,this["menu" + who + "StartY"],this["menu" + who + "StartY"] - this.Yslide,0.2,true);
         this._parent[color] = true;
      }
      this._parent.setColor();
   }
}
