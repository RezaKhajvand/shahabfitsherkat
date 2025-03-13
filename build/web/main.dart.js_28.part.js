((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_28",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,D,B={
aS1(d,e,f,g,h,i,j,k,l){return new B.tE(f,d,g,j,h,l,e,k,i)},
iN:function iN(d,e){this.a=d
this.b=e},
tE:function tE(d,e,f,g,h,i,j,k,l){var _=this
_.c=d
_.d=e
_.f=f
_.w=g
_.x=h
_.y=i
_.ax=j
_.ay=k
_.a=l},
DQ:function DQ(d){this.d=d},
a2O:function a2O(d,e,f){this.b=d
this.c=e
this.a=f},
Kr:function Kr(d,e){this.a=d
this.b=e},
K_:function K_(d,e,f,g){var _=this
_.e=_.d=$
_.r=_.f=null
_.w=0
_.y=_.x=!1
_.z=null
_.Q=!1
_.as=d
_.hZ$=e
_.dN$=f
_.bw$=g
_.c=_.a=null},
aDN:function aDN(d){this.a=d},
aDO:function aDO(d){this.a=d},
aDP:function aDP(d){this.a=d},
aDQ:function aDQ(d){this.a=d},
NB:function NB(){},
NC:function NC(){},
Yv:function Yv(d,e,f,g){var _=this
_.e=d
_.w=e
_.c=f
_.a=g}},C
J=c[1]
A=c[0]
D=c[2]
B=a.updateHolder(c[62],B)
C=c[132]
B.iN.prototype={
K(){return"DismissDirection."+this.b}}
B.tE.prototype={
a2(){var x=null
return new B.K_(new A.aD(x,y.z),x,x,x)}}
B.DQ.prototype={}
B.a2O.prototype={
uW(d){var x,w,v
switch(this.b.a){case 0:x=this.c
w=d.a
v=x.b.ae(x.a.gm()).a*w
if(v<0)return new A.A(w+v,0,w,d.b)
return new A.A(0,0,v,d.b)
case 1:x=this.c
w=d.b
v=x.b.ae(x.a.gm()).b*w
if(v<0)return new A.A(0,w+v,d.a,w)
return new A.A(0,0,d.a,v)}},
Ok(d){return this.uW(d)},
zW(d){var x,w
if(d.b===this.b){x=d.c
w=this.c
w=!J.d(x.b.ae(x.a.gm()),w.b.ae(w.a.gm()))
x=w}else x=!0
return x}}
B.Kr.prototype={
K(){return"_FlingGestureKind."+this.b}}
B.K_.prototype={
aq(){var x,w,v=this
v.a9S()
x=v.geC()
x.bY()
w=x.cO$
w.b=!0
w.a.push(v.gah6())
x.bY()
x=x.cJ$
x.b=!0
x.a.push(v.gah8())
v.JO()},
geC(){var x,w=this,v=w.d
if(v===$){w.a.toString
x=A.bu(null,D.P,null,null,w)
w.d!==$&&A.ah()
w.d=x
v=x}return v},
gqW(){var x=this.geC().r
if(!(x!=null&&x.a!=null)){x=this.f
if(x==null)x=null
else{x=x.r
x=x!=null&&x.a!=null}x=x===!0}else x=!0
return x},
l(){this.geC().l()
var x=this.f
if(x!=null)x.l()
this.a9R()},
gjp(){var x=this.a.x
return x===C.NX||x===C.q1||x===C.fY},
nJ(d){var x,w,v,u
if(d===0)return C.q3
if(this.gjp()){x=this.c.af(y.o).w
$label0$0:{w=D.ap===x
if(w&&d<0){v=C.fY
break $label0$0}u=D.k===x
if(u&&d>0){v=C.fY
break $label0$0}if(!w)v=u
else v=!0
if(v){v=C.q1
break $label0$0}v=null}return v}return d>0?C.q2:C.NY},
gAJ(){this.a.toString
C.a3b.h(0,this.nJ(this.w))
return 0.4},
gVd(){var x=this.c.gt()
x.toString
return this.gjp()?x.a:x.b},
aeg(d){var x,w=this
if(w.x)return
w.y=!0
x=w.geC().r
if(x!=null&&x.a!=null){x=w.geC().x
x===$&&A.b()
w.w=x*w.gVd()*J.ew(w.w)
w.geC().fM()}else{w.w=0
w.geC().sm(0)}w.a5(new B.aDN(w))},
aeh(d){var x,w,v=this
if(v.y){x=v.geC().r
x=x!=null&&x.a!=null}else x=!0
if(x)return
x=d.c
x.toString
w=v.w
switch(v.a.x.a){case 1:case 0:v.w=w+x
break
case 4:x=w+x
if(x<0)v.w=x
break
case 5:x=w+x
if(x>0)v.w=x
break
case 2:switch(v.c.af(y.o).w.a){case 0:x=v.w+x
if(x>0)v.w=x
break
case 1:x=v.w+x
if(x<0)v.w=x
break}break
case 3:switch(v.c.af(y.o).w.a){case 0:x=v.w+x
if(x<0)v.w=x
break
case 1:x=v.w+x
if(x>0)v.w=x
break}break
case 6:v.w=0
break}if(J.ew(w)!==J.ew(v.w))v.a5(new B.aDO(v))
x=v.geC().r
if(!(x!=null&&x.a!=null))v.geC().sm(Math.abs(v.w)/v.gVd())},
ah9(){var x,w=this
if(w.a.ay!=null){x=w.geC().x
x===$&&A.b()
w.Q=x>w.gAJ()
w.nJ(w.w)
x=w.geC().x
x===$&&A.b()
w.a.ay.$1(new B.DQ(x))}},
JO(){var x=this,w=J.ew(x.w),v=x.geC(),u=x.gjp(),t=x.a
if(u){t.toString
u=new A.h(w,0)}else{t.toString
u=new A.h(0,w)}t=y.A
x.e=new A.aX(y.v.a(v),new A.au(D.h,u,t),t.i("aX<aG.T>"))},
ae3(d){var x,w,v,u,t=this
if(t.w===0)return C.oc
x=d.a
w=x.a
v=x.b
if(t.gjp()){x=Math.abs(w)
if(x-Math.abs(v)<400||x<700)return C.oc
u=t.nJ(w)}else{x=Math.abs(v)
if(x-Math.abs(w)<400||x<700)return C.oc
u=t.nJ(v)}if(u===t.nJ(t.w))return C.ai4
return C.ai5},
aef(d){var x,w,v,u=this
if(u.y){x=u.geC().r
x=x!=null&&x.a!=null}else x=!0
if(x)return
u.y=!1
if(u.geC().gaY()===D.a0){u.vX()
return}x=d.a
w=x.a
v=u.gjp()?w.a:w.b
switch(u.ae3(x).a){case 1:if(u.gAJ()>=1){u.geC().cU()
break}u.w=J.ew(v)
u.geC().qh(Math.abs(v)*0.0033333333333333335)
break
case 2:u.w=J.ew(v)
u.geC().qh(-Math.abs(v)*0.0033333333333333335)
break
case 0:if(u.geC().gaY()!==D.K){x=u.geC().x
x===$&&A.b()
if(x>u.gAJ())u.geC().bZ()
else u.geC().cU()}break}},
B1(d){return this.ah7(d)},
ah7(d){var x=0,w=A.x(y.q),v=this
var $async$B1=A.t(function(e,f){if(e===1)return A.u(f,w)
while(true)switch(x){case 0:x=d===D.a0&&!v.y?2:3
break
case 2:x=4
return A.J(v.vX(),$async$B1)
case 4:case 3:if(v.c!=null)v.ni()
return A.v(null,w)}})
return A.w($async$B1,w)},
vX(){var x=0,w=A.x(y.q),v,u=this,t
var $async$vX=A.t(function(d,e){if(d===1)return A.u(e,w)
while(true)switch(x){case 0:if(u.gAJ()>=1){u.geC().cU()
x=1
break}x=3
return A.J(u.AC(),$async$vX)
case 3:t=e
if(u.c!=null)if(t)u.apO()
else u.geC().cU()
case 1:return A.v(v,w)}})
return A.w($async$vX,w)},
AC(){var x=0,w=A.x(y.e),v,u=2,t,s=[],r=this,q,p
var $async$AC=A.t(function(d,e){if(d===1){t=e
x=u}while(true)switch(x){case 0:x=r.a.f!=null?3:4
break
case 3:r.x=!0
q=r.nJ(r.w)
u=5
x=8
return A.J(r.a.f.$1(q),$async$AC)
case 8:p=e
if(p==null)p=!1
v=p
s=[1]
x=6
break
s.push(7)
x=6
break
case 5:s=[2]
case 6:u=2
r.x=!1
x=s.pop()
break
case 7:case 4:v=!0
x=1
break
case 1:return A.v(v,w)
case 2:return A.u(t,w)}})
return A.w($async$AC,w)},
apO(){var x,w=this,v=w.a,u=v.y
if(u==null){if(v.w!=null){x=w.nJ(w.w)
w.a.w.$1(x)}}else{v=A.bu(null,u,null,null,w)
v.bY()
u=v.cJ$
u.b=!0
u.a.push(w.gaiL())
v.bY()
u=v.cO$
u.b=!0
u.a.push(new B.aDP(w))
w.f=v
v.bZ()
w.a5(new B.aDQ(w))}},
aiM(){var x=this,w=x.f.gaY(),v=x.a
if(w===D.a0){w=v.w
if(w!=null)w.$1(x.nJ(x.w))}else v.toString},
G(d){var x,w,v,u,t,s,r,q,p=this,o=null
p.A5(d)
x=p.a
w=x.d
v=p.r
if(v!=null){x=p.gjp()?D.Z:D.aH
u=p.z
return new B.Yv(x,new A.aq(u.a,u.b,w,o),v,o)}v=p.e
v===$&&A.b()
t=A.avn(new A.iY(x.c,p.as),v,o,!0)
if(w!=null){x=A.a([],y.u)
if(p.e.gaY()!==D.K){v=p.gjp()?D.aH:D.Z
u=p.e
x.push(A.aZn(0,A.x2(w,D.J,new B.a2O(v,u,u))))}x.push(t)
t=new A.ec(D.bA,o,D.bm,D.J,x,o)}if(p.a.x===C.q3)return t
x=p.gjp()?p.gSg():o
v=p.gjp()?p.gSh():o
u=p.gjp()?p.gSf():o
s=p.gjp()?o:p.gSg()
r=p.gjp()?o:p.gSh()
q=p.gjp()?o:p.gSf()
return A.id(p.a.ax,t,D.S,!1,o,o,o,o,u,x,v,o,o,o,o,o,o,o,o,o,o,q,s,r)}}
B.NB.prototype={
c1(){this.d5()
this.cR()
this.eR()},
l(){var x=this,w=x.bw$
if(w!=null)w.I(x.geD())
x.bw$=null
x.aQ()}}
B.NC.prototype={
aq(){this.aO()
if(this.gqW())this.rK()},
eb(){var x=this.hZ$
if(x!=null){x.an()
x.dW()
this.hZ$=null}this.lj()}}
B.Yv.prototype={
G(d){var x,w,v=this,u=null,t=v.e
switch(t.a){case 0:x=new A.fc(0,-1)
break
case 1:x=new A.fc(-1,0)
break
default:x=u}w=t===D.Z?Math.max(A.ha(y.v.a(v.c).gm()),0):u
t=t===D.aH?Math.max(A.ha(y.v.a(v.c).gm()),0):u
return A.x2(new A.d_(x,t,w,v.w,u),D.J,u)}}
var z=a.updateTypes(["~()","~(fg)","~(fh)","~(e6)","U<~>(hc)"])
B.aDN.prototype={
$0(){this.a.JO()},
$S:0}
B.aDO.prototype={
$0(){this.a.JO()},
$S:0}
B.aDP.prototype={
$1(d){return this.a.ni()},
$S:9}
B.aDQ.prototype={
$0(){var x,w,v,u=this.a
u.z=u.c.gt()
x=u.f
x.toString
w=y.v
v=y.g
u.r=new A.aX(w.a(new A.aX(w.a(x),new A.ez(C.R_),y.n.i("aX<aG.T>"))),new A.au(1,0,v),v.i("aX<aG.T>"))},
$S:0};(function aliases(){var x=B.NB.prototype
x.a9R=x.l
x=B.NC.prototype
x.a9S=x.aq})();(function installTearOffs(){var x=a._instance_1u,w=a._instance_0u
var v
x(v=B.K_.prototype,"gSg","aeg",1)
x(v,"gSh","aeh",2)
w(v,"gah8","ah9",0)
x(v,"gSf","aef",3)
x(v,"gah6","B1",4)
w(v,"gaiL","aiM",0)})();(function inheritance(){var x=a.mixinHard,w=a.inheritMany,v=a.inherit
w(A.eg,[B.iN,B.Kr])
v(B.tE,A.G)
v(B.DQ,A.p)
v(B.a2O,A.xh)
v(B.NB,A.N)
v(B.NC,B.NB)
v(B.K_,B.NC)
w(A.ci,[B.aDN,B.aDO,B.aDQ])
v(B.aDP,A.c_)
v(B.Yv,A.oD)
x(B.NB,A.dO)
x(B.NC,A.oL)})()
A.bb(b.typeUniverse,JSON.parse('{"tE":{"G":[],"c":[]},"a2O":{"a3":[]},"K_":{"N":["tE"]},"Yv":{"G":[],"c":[]}}'))
var y={v:A.r("bk<B>"),n:A.r("ez"),o:A.r("dh"),u:A.r("l<c>"),z:A.r("aD<N<G>>"),A:A.r("au<h>"),g:A.r("au<B>"),e:A.r("y"),q:A.r("~")};(function constants(){C.NX=new B.iN(1,"horizontal")
C.q1=new B.iN(2,"endToStart")
C.fY=new B.iN(3,"startToEnd")
C.NY=new B.iN(4,"up")
C.q2=new B.iN(5,"down")
C.q3=new B.iN(6,"none")
C.R_=new A.cW(0.4,1,D.ai)
C.a3b=new A.a9(D.bR,[],A.r("a9<iN,B>"))
C.oc=new B.Kr(0,"none")
C.ai4=new B.Kr(1,"forward")
C.ai5=new B.Kr(2,"reverse")})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_28",e:"endPart",h:b})})($__dart_deferred_initializers__,"/1YSYT93tFBMEAgHxJgI84Ls+nU=");