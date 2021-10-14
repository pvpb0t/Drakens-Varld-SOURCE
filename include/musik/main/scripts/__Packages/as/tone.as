class as.tone extends MovieClip
{
   function tone()
   {
      super();
      this.shine._visible = false;
      this.toneType = this._name.substr(3,1);
   }
   function onRelease()
   {
      this.hiLight();
   }
   function hiLight()
   {
      if(this._parent.actTone != this._name)
      {
         this._parent[this._parent.actTone].active = false;
         this._parent[this._parent.actTone].shine._visible = false;
         this._parent.actTone = this._name;
         this.active = true;
         this.shine._visible = true;
      }
      else
      {
         this.active = false;
         this._parent.actTone = "";
         this.shine._visible = false;
      }
      this._parent.fadeBtns();
   }
}
