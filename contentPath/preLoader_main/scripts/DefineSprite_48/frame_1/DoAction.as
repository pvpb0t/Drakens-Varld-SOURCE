function setHead(num)
{
   head.gotoAndStop(headType);
   _parent._parent.headType = headType;
}
function setTorso(num)
{
   armL.gotoAndStop(torsoType);
   armR.gotoAndStop(torsoType);
   torso.gotoAndStop(torsoType);
   _parent._parent.torsoType = torsoType;
}
function setLeg(num)
{
   legL.gotoAndStop(legType);
   legR.gotoAndStop(legType);
   _parent._parent.legType = legType;
}
headType = random(6) + 1;
torsoType = random(6) + 1;
legType = random(6) + 1;
setHead(headType);
setTorso(torsoType);
setLeg(legType);
