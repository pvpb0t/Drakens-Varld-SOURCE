btn_yes_Y = btn_yes._y;
btn_no_Y = btn_no._y;
btn_yes._y = btn_yes._y + 200;
btn_no._y = btn_no._y + 200;
btn_yes.onRelease = function()
{
   _parent.mask.play();
};
btn_no.onRelease = function()
{
   _parent._parent._parent.closeGame();
};
