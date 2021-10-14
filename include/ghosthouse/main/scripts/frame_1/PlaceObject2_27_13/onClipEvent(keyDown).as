onClipEvent(keyDown){
   tempLet = 0;
   if(_parent["char" + _parent.curLetter]._y > 0)
   {
      if(_parent["char" + _parent.curLetter].char.char.txt.text.charCodeAt() == Key.getCode() or _parent["char" + _parent.curLetter].char.char.txt.text.charAt() == "Å" && Key.getCode() == 221 or _parent["char" + _parent.curLetter].char.char.txt.text.charAt() == "Ä" && Key.getCode() == 222 or _parent["char" + _parent.curLetter].char.char.txt.text.charAt() == "Ö" && Key.getCode() == 192)
      {
         _parent["char" + _parent.curLetter].char.gotoAndPlay("good");
      }
      else
      {
         _parent.removeBad("char" + _parent.curLetter);
      }
   }
}
