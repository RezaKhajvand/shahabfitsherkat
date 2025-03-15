((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_27",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,D,B={
aSM(d,e,f,g,h,i,j,k,l){return new B.tL(f,d,g,j,h,l,e,k,i)},
iX:function iX(d,e){this.a=d
this.b=e},
tL:function tL(d,e,f,g,h,i,j,k,l){var _=this
_.c=d
_.d=e
_.f=f
_.w=g
_.x=h
_.y=i
_.ax=j
_.ay=k
_.a=l},
E9:function E9(d){this.d=d},
a3e:function a3e(d,e,f){this.b=d
this.c=e
this.a=f},
KO:function KO(d,e){this.a=d
this.b=e},
Kn:function Kn(d,e,f,g){var _=this
_.e=_.d=$
_.r=_.f=null
_.w=0
_.y=_.x=!1
_.z=null
_.Q=!1
_.as=d
_.i7$=e
_.dM$=f
_.bD$=g
_.c=_.a=null},
aEk:function aEk(d){this.a=d},
aEl:function aEl(d){this.a=d},
aEm:function aEm(d){this.a=d},
aEn:function aEn(d){this.a=d},
O_:function O_(){},
O0:function O0(){},
YV:function YV(d,e,f,g){var _=this
_.e=d
_.w=e
_.c=f
_.a=g}},C
J=c[1]
A=c[0]
D=c[2]
B=a.updateHolder(c[62],B)
C=c[132]
B.iX.prototype={
M(){return"DismissDirection."+this.b}}
B.tL.prototype={
a7(){var x=null
return new B.Kn(new A.aG(x,y.z),x,x,x)}}
B.E9.prototype={}
B.a3e.prototype={
vl(d){var x,w,v
switch(this.b.a){case 0:x=this.c
w=d.a
v=x.b.ag(x.a.gu()).a*w
if(v<0)return new A.z(w+v,0,w,d.b)
return new A.z(0,0,v,d.b)
case 1:x=this.c
w=d.b
v=x.b.ag(x.a.gu()).b*w
if(v<0)return new A.z(0,w+v,d.a,w)
return new A.z(0,0,d.a,v)}},
OS(d){return this.vl(d)},
Am(d){var x,w
if(d.b===this.b){x=d.c
w=this.c
w=!J.e(x.b.ag(x.a.gu()),w.b.ag(w.a.gu()))
x=w}else x=!0
return x}}
B.KO.prototype={
M(){return"_FlingGestureKind."+this.b}}
B.Kn.prototype={
au(){var x,w,v=this
v.aaF()
x=v.geI()
x.bW()
w=x.ct$
w.b=!0
w.a.push(v.gahX())
x.bW()
x.cO$.C(0,v.gahZ())
v.Kh()},
geI(){var x,w=this,v=w.d
if(v===$){w.a.toString
x=A.bA(null,D.P,null,null,w)
w.d!==$&&A.ai()
w.d=x
v=x}return v},
grk(){var x=this.geI().r
if(!(x!=null&&x.a!=null)){x=this.f
if(x==null)x=null
else{x=x.r
x=x!=null&&x.a!=null}x=x===!0}else x=!0
return x},
l(){this.geI().l()
var x=this.f
if(x!=null)x.l()
this.aaE()},
gjw(){var x=this.a.x
return x===C.O_||x===C.qa||x===C.fX},
nT(d){var x,w,v,u
if(d===0)return C.qc
if(this.gjw()){x=this.c.aj(y.o).w
$label0$0:{w=D.ap===x
if(w&&d<0){v=C.fX
break $label0$0}u=D.k===x
if(u&&d>0){v=C.fX
break $label0$0}if(!w)v=u
else v=!0
if(v){v=C.qa
break $label0$0}v=null}return v}return d>0?C.qb:C.O0},
gB7(){this.a.toString
C.a3e.h(0,this.nT(this.w))
return 0.4},
gVO(){var x=this.c.gq()
x.toString
return this.gjw()?x.a:x.b},
af6(d){var x,w=this
if(w.x)return
w.y=!0
x=w.geI().r
if(x!=null&&x.a!=null){x=w.geI().x
x===$&&A.b()
w.w=x*w.gVO()*J.eA(w.w)
w.geI().fV()}else{w.w=0
w.geI().su(0)}w.a8(new B.aEk(w))},
af7(d){var x,w,v=this
if(v.y){x=v.geI().r
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
case 2:switch(v.c.aj(y.o).w.a){case 0:x=v.w+x
if(x>0)v.w=x
break
case 1:x=v.w+x
if(x<0)v.w=x
break}break
case 3:switch(v.c.aj(y.o).w.a){case 0:x=v.w+x
if(x<0)v.w=x
break
case 1:x=v.w+x
if(x>0)v.w=x
break}break
case 6:v.w=0
break}if(J.eA(w)!==J.eA(v.w))v.a8(new B.aEl(v))
x=v.geI().r
if(!(x!=null&&x.a!=null))v.geI().su(Math.abs(v.w)/v.gVO())},
ai_(){var x,w=this
if(w.a.ay!=null){x=w.geI().x
x===$&&A.b()
w.Q=x>w.gB7()
w.nT(w.w)
x=w.geI().x
x===$&&A.b()
w.a.ay.$1(new B.E9(x))}},
Kh(){var x=this,w=J.eA(x.w),v=x.geI(),u=x.gjw(),t=x.a
if(u){t.toString
u=new A.h(w,0)}else{t.toString
u=new A.h(0,w)}t=y.A
x.e=new A.aY(y.v.a(v),new A.av(D.h,u,t),t.i("aY<aK.T>"))},
aeU(d){var x,w,v,u,t=this
if(t.w===0)return C.oh
x=d.a
w=x.a
v=x.b
if(t.gjw()){x=Math.abs(w)
if(x-Math.abs(v)<400||x<700)return C.oh
u=t.nT(w)}else{x=Math.abs(v)
if(x-Math.abs(w)<400||x<700)return C.oh
u=t.nT(v)}if(u===t.nT(t.w))return C.aie
return C.aif},
af5(d){var x,w,v,u=this
if(u.y){x=u.geI().r
x=x!=null&&x.a!=null}else x=!0
if(x)return
u.y=!1
if(u.geI().gb_()===D.a_){u.wp()
return}x=d.a
w=x.a
v=u.gjw()?w.a:w.b
switch(u.aeU(x).a){case 1:if(u.gB7()>=1){u.geI().cY()
break}u.w=J.eA(v)
u.geI().qC(Math.abs(v)*0.0033333333333333335)
break
case 2:u.w=J.eA(v)
u.geI().qC(-Math.abs(v)*0.0033333333333333335)
break
case 0:if(u.geI().gb_()!==D.K){x=u.geI().x
x===$&&A.b()
if(x>u.gB7())u.geI().c4()
else u.geI().cY()}break}},
Br(d){return this.ahY(d)},
ahY(d){var x=0,w=A.w(y.q),v=this
var $async$Br=A.r(function(e,f){if(e===1)return A.t(f,w)
while(true)switch(x){case 0:x=d===D.a_&&!v.y?2:3
break
case 2:x=4
return A.K(v.wp(),$async$Br)
case 4:case 3:if(v.c!=null)v.ns()
return A.u(null,w)}})
return A.v($async$Br,w)},
wp(){var x=0,w=A.w(y.q),v,u=this,t
var $async$wp=A.r(function(d,e){if(d===1)return A.t(e,w)
while(true)switch(x){case 0:if(u.gB7()>=1){u.geI().cY()
x=1
break}x=3
return A.K(u.B0(),$async$wp)
case 3:t=e
if(u.c!=null)if(t)u.aqH()
else u.geI().cY()
case 1:return A.u(v,w)}})
return A.v($async$wp,w)},
B0(){var x=0,w=A.w(y.e),v,u=2,t=[],s=[],r=this,q,p
var $async$B0=A.r(function(d,e){if(d===1){t.push(e)
x=u}while(true)switch(x){case 0:x=r.a.f!=null?3:4
break
case 3:r.x=!0
q=r.nT(r.w)
u=5
x=8
return A.K(r.a.f.$1(q),$async$B0)
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
case 1:return A.u(v,w)
case 2:return A.t(t.at(-1),w)}})
return A.v($async$B0,w)},
aqH(){var x,w=this,v=w.a,u=v.y
if(u==null){if(v.w!=null){x=w.nT(w.w)
w.a.w.$1(x)}}else{v=A.bA(null,u,null,null,w)
v.bW()
v.cO$.C(0,w.gajD())
v.bW()
u=v.ct$
u.b=!0
u.a.push(new B.aEm(w))
w.f=v
v.c4()
w.a8(new B.aEn(w))}},
ajE(){var x=this,w=x.f.gb_(),v=x.a
if(w===D.a_){w=v.w
if(w!=null)w.$1(x.nT(x.w))}else v.toString},
I(d){var x,w,v,u,t,s,r,q,p=this,o=null
p.Av(d)
x=p.a
w=x.d
v=p.r
if(v!=null){x=p.gjw()?D.a0:D.aL
u=p.z
return new B.YV(x,new A.as(u.a,u.b,w,o),v,o)}v=p.e
v===$&&A.b()
t=A.avV(new A.j7(x.c,p.as),v,o,!0)
if(w!=null){x=A.a([],y.u)
if(p.e.gb_()!==D.K){v=p.gjw()?D.aL:D.a0
u=p.e
x.push(A.b_6(0,A.xa(w,D.J,new B.a3e(v,u,u))))}x.push(t)
t=new A.ej(D.bC,o,D.bn,D.J,x,o)}if(p.a.x===C.qc)return t
x=p.gjw()?p.gSS():o
v=p.gjw()?p.gST():o
u=p.gjw()?p.gSR():o
s=p.gjw()?o:p.gSS()
r=p.gjw()?o:p.gST()
q=p.gjw()?o:p.gSR()
return A.hN(p.a.ax,t,D.R,!1,o,o,o,o,u,x,v,o,o,o,o,o,o,o,o,o,o,q,s,r)}}
B.O_.prototype={
c3(){this.d6()
this.cW()
this.eV()},
l(){var x=this,w=x.bD$
if(w!=null)w.K(x.geJ())
x.bD$=null
x.aT()}}
B.O0.prototype={
au(){this.aR()
if(this.grk())this.t4()},
ee(){var x=this.i7$
if(x!=null){x.aq()
x.dX()
this.i7$=null}this.lt()}}
B.YV.prototype={
I(d){var x,w,v=this,u=null,t=v.e
switch(t.a){case 0:x=new A.fe(0,-1)
break
case 1:x=new A.fe(-1,0)
break
default:x=u}w=t===D.a0?Math.max(A.hl(y.v.a(v.c).gu()),0):u
t=t===D.aL?Math.max(A.hl(y.v.a(v.c).gu()),0):u
return A.xa(new A.d_(x,t,w,v.w,u),D.J,u)}}
var z=a.updateTypes(["~()","~(fj)","~(fk)","~(eb)","W<~>(hn)"])
B.aEk.prototype={
$0(){this.a.Kh()},
$S:0}
B.aEl.prototype={
$0(){this.a.Kh()},
$S:0}
B.aEm.prototype={
$1(d){return this.a.ns()},
$S:9}
B.aEn.prototype={
$0(){var x,w,v,u=this.a
u.z=u.c.gq()
x=u.f
x.toString
w=y.v
v=y.g
u.r=new A.aY(w.a(new A.aY(w.a(x),new A.eE(C.R8),y.n.i("aY<aK.T>"))),new A.av(1,0,v),v.i("aY<aK.T>"))},
$S:0};(function aliases(){var x=B.O_.prototype
x.aaE=x.l
x=B.O0.prototype
x.aaF=x.au})();(function installTearOffs(){var x=a._instance_1u,w=a._instance_0u
var v
x(v=B.Kn.prototype,"gSS","af6",1)
x(v,"gST","af7",2)
w(v,"gahZ","ai_",0)
x(v,"gSR","af5",3)
x(v,"gahX","Br",4)
w(v,"gajD","ajE",0)})();(function inheritance(){var x=a.mixinHard,w=a.inheritMany,v=a.inherit
w(A.e7,[B.iX,B.KO])
v(B.tL,A.I)
v(B.E9,A.q)
v(B.a3e,A.xp)
v(B.O_,A.P)
v(B.O0,B.O_)
v(B.Kn,B.O0)
w(A.cf,[B.aEk,B.aEl,B.aEn])
v(B.aEm,A.c1)
v(B.YV,A.t8)
x(B.O_,A.dS)
x(B.O0,A.oQ)})()
A.be(b.typeUniverse,JSON.parse('{"tL":{"I":[],"d":[]},"a3e":{"a5":[]},"Kn":{"P":["tL"]},"YV":{"I":[],"d":[]}}'))
var y={v:A.y("bo<C>"),n:A.y("eE"),o:A.y("dl"),u:A.y("m<d>"),z:A.y("aG<P<I>>"),A:A.y("av<h>"),g:A.y("av<C>"),e:A.y("A"),q:A.y("~")};(function constants(){C.O_=new B.iX(1,"horizontal")
C.qa=new B.iX(2,"endToStart")
C.fX=new B.iX(3,"startToEnd")
C.O0=new B.iX(4,"up")
C.qb=new B.iX(5,"down")
C.qc=new B.iX(6,"none")
C.R8=new A.cY(0.4,1,D.ai)
C.a3e=new A.aa(D.bS,[],A.y("aa<iX,C>"))
C.oh=new B.KO(0,"none")
C.aie=new B.KO(1,"forward")
C.aif=new B.KO(2,"reverse")})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_27",e:"endPart",h:b})})($__dart_deferred_initializers__,"xW/2yWOlt9JFCrZ0AwoX1D2PDwA=");