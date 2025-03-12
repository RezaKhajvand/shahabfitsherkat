((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_49",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={oI:function oI(d,e){this.a=d
this.b=e},
acq(d,e,f,g,h,i,j,k,l){var x,w,v=null
if(g==null)x=v
else x=g
if(l!=null||j!=null){w=e==null?v:e.zB(j,l)
if(w==null)w=B.eD(j,l)}else w=e
return new A.t8(d,k,x,i,w,f,h,v,v)},
to:function to(d,e){this.a=d
this.b=e},
uF:function uF(d,e){this.a=d
this.b=e},
t8:function t8(d,e,f,g,h,i,j,k,l){var _=this
_.r=d
_.x=e
_.y=f
_.z=g
_.Q=h
_.c=i
_.d=j
_.e=k
_.a=l},
a1d:function a1d(d,e){var _=this
_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=null
_.e=_.d=$
_.bC$=d
_.b7$=e
_.c=_.a=null},
aAi:function aAi(){},
aAj:function aAj(){},
aAk:function aAk(){},
aAl:function aAl(){},
aAm:function aAm(){},
aAn:function aAn(){},
aAo:function aAo(){},
aAp:function aAp(){},
b_j(){var x=new Float64Array(4)
x[3]=1
return new A.qz(x)},
qz:function qz(d){this.a=d}},D
B=c[0]
C=c[2]
A=a.updateHolder(c[52],A)
D=c[53]
A.oI.prototype={
f0(d){return B.CC(this.a,this.b,d)}}
A.to.prototype={
f0(d){var x=B.ku(this.a,this.b,d)
x.toString
return x}}
A.uF.prototype={
f0(a8){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2=new B.eS(new Float64Array(3)),a3=new B.eS(new Float64Array(3)),a4=A.b_j(),a5=A.b_j(),a6=new B.eS(new Float64Array(3)),a7=new B.eS(new Float64Array(3))
this.a.a_X(a2,a4,a6)
this.b.a_X(a3,a5,a7)
x=1-a8
w=a2.mf(x).Z(0,a3.mf(a8))
v=a4.mf(x).Z(0,a5.mf(a8))
u=new Float64Array(4)
t=new A.qz(u)
t.ds(v)
t.z1()
s=a6.mf(x).Z(0,a7.mf(a8))
x=new Float64Array(16)
v=new B.b9(x)
r=u[0]
q=u[1]
p=u[2]
o=u[3]
n=r+r
m=q+q
l=p+p
k=r*n
j=r*m
i=r*l
h=q*m
g=q*l
f=p*l
e=o*n
d=o*m
a0=o*l
a1=w.a
x[0]=1-(h+f)
x[1]=j+a0
x[2]=i-d
x[3]=0
x[4]=j-a0
x[5]=1-(k+f)
x[6]=g+e
x[7]=0
x[8]=i+d
x[9]=g-e
x[10]=1-(k+h)
x[11]=0
x[12]=a1[0]
x[13]=a1[1]
x[14]=a1[2]
x[15]=1
v.cb(s)
return v}}
A.t8.prototype={
a7(){return new A.a1d(null,null)}}
A.a1d.prototype={
n6(d){var x,w,v=this,u=null,t=v.CW
v.a.toString
x=y.b
v.CW=x.a(d.$3(t,u,new A.aAi()))
t=y.f
v.cx=t.a(d.$3(v.cx,v.a.x,new A.aAj()))
w=y.d
v.cy=w.a(d.$3(v.cy,v.a.y,new A.aAk()))
v.db=w.a(d.$3(v.db,v.a.z,new A.aAl()))
v.dx=y.e.a(d.$3(v.dx,v.a.Q,new A.aAm()))
w=v.dy
v.a.toString
v.dy=t.a(d.$3(w,u,new A.aAn()))
w=v.fr
v.a.toString
v.fr=y.w.a(d.$3(w,u,new A.aAo()))
w=v.fx
v.a.toString
v.fx=x.a(d.$3(w,u,new A.aAp()))},
I(d){var x,w,v,u,t,s,r,q=this,p=null,o=q.gfs(),n=q.CW
n=n==null?p:n.ag(o.gu())
x=q.cx
x=x==null?p:x.ag(o.gu())
w=q.cy
w=w==null?p:w.ag(o.gu())
v=q.db
v=v==null?p:v.ag(o.gu())
u=q.dx
u=u==null?p:u.ag(o.gu())
t=q.dy
t=t==null?p:t.ag(o.gu())
s=q.fr
s=s==null?p:s.ag(o.gu())
r=q.fx
r=r==null?p:r.ag(o.gu())
return B.br(n,q.a.r,C.m,p,u,w,v,p,p,t,x,s,r,p)}}
A.qz.prototype={
ds(d){var x=d.a,w=this.a,v=x[0]
w.$flags&2&&B.aD(w)
w[0]=v
w[1]=x[1]
w[2]=x[2]
w[3]=x[3]},
a5Q(d){var x,w,v,u,t,s=d.a,r=s[0],q=s[4],p=s[8],o=0+r+q+p
if(o>0){x=Math.sqrt(o+1)
r=this.a
r.$flags&2&&B.aD(r)
r[3]=x*0.5
x=0.5/x
r[0]=(s[5]-s[7])*x
r[1]=(s[6]-s[2])*x
r[2]=(s[1]-s[3])*x}else{if(r<q)w=q<p?2:1
else w=r<p?2:0
v=(w+1)%3
u=(w+2)%3
r=w*3
q=v*3
p=u*3
x=Math.sqrt(s[r+w]-s[q+v]-s[p+u]+1)
t=this.a
t.$flags&2&&B.aD(t)
t[w]=x*0.5
x=0.5/x
t[3]=(s[q+u]-s[p+v])*x
t[v]=(s[r+v]+s[q+w])*x
t[u]=(s[r+u]+s[p+w])*x}},
z1(){var x,w,v,u=Math.sqrt(this.gyO())
if(u===0)return 0
x=1/u
w=this.a
v=w[0]
w.$flags&2&&B.aD(w)
w[0]=v*x
w[1]=w[1]*x
w[2]=w[2]*x
w[3]=w[3]*x
return u},
gyO(){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return w*w+v*v+u*u+t*t},
gG(d){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return Math.sqrt(w*w+v*v+u*u+t*t)},
mf(d){var x=new Float64Array(4),w=new A.qz(x)
w.ds(this)
x[3]=x[3]*d
x[2]=x[2]*d
x[1]=x[1]*d
x[0]=x[0]*d
return w},
ak(a5,a6){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h=this.a,g=h[3],f=h[2],e=h[1],d=h[0],a0=a6.gaDp(),a1=a0.h(0,3),a2=a0.h(0,2),a3=a0.h(0,1),a4=a0.h(0,0)
h=C.c.ak(g,a4)
x=C.c.ak(d,a1)
w=C.c.ak(e,a2)
v=C.c.ak(f,a3)
u=C.c.ak(g,a3)
t=C.c.ak(e,a1)
s=C.c.ak(f,a4)
r=C.c.ak(d,a2)
q=C.c.ak(g,a2)
p=C.c.ak(f,a1)
o=C.c.ak(d,a3)
n=C.c.ak(e,a4)
m=C.c.ak(g,a1)
l=C.c.ak(d,a4)
k=C.c.ak(e,a3)
j=C.c.ak(f,a2)
i=new Float64Array(4)
i[0]=h+x+w-v
i[1]=u+t+s-r
i[2]=q+p+o-n
i[3]=m-l-k-j
return new A.qz(i)},
Z(d,e){var x,w=new Float64Array(4),v=new A.qz(w)
v.ds(this)
x=e.a
w[0]=w[0]+x[0]
w[1]=w[1]+x[1]
w[2]=w[2]+x[2]
w[3]=w[3]+x[3]
return v},
aa(d,e){var x,w=new Float64Array(4),v=new A.qz(w)
v.ds(this)
x=e.a
w[0]=w[0]-x[0]
w[1]=w[1]-x[1]
w[2]=w[2]-x[2]
w[3]=w[3]-x[3]
return v},
h(d,e){return this.a[e]},
m(d,e,f){var x=this.a
x.$flags&2&&B.aD(x)
x[e]=f},
j(d){var x=this.a
return B.n(x[0])+", "+B.n(x[1])+", "+B.n(x[2])+" @ "+B.n(x[3])}}
var z=a.updateTypes(["oI(@)","jC(@)","to(@)","uF(@)"])
A.aAi.prototype={
$1(d){return new A.oI(y.k.a(d),null)},
$S:z+0}
A.aAj.prototype={
$1(d){return new D.jC(y.m.a(d),null)},
$S:z+1}
A.aAk.prototype={
$1(d){return new B.mR(y.r.a(d),null)},
$S:242}
A.aAl.prototype={
$1(d){return new B.mR(y.r.a(d),null)},
$S:242}
A.aAm.prototype={
$1(d){return new A.to(y.a.a(d),null)},
$S:z+2}
A.aAn.prototype={
$1(d){return new D.jC(y.m.a(d),null)},
$S:z+1}
A.aAo.prototype={
$1(d){return new A.uF(y.E.a(d),null)},
$S:z+3}
A.aAp.prototype={
$1(d){return new A.oI(y.k.a(d),null)},
$S:z+0};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.av,[A.oI,A.to,A.uF])
w(A.t8,B.y5)
w(A.a1d,B.oJ)
x(B.c1,[A.aAi,A.aAj,A.aAk,A.aAl,A.aAm,A.aAn,A.aAo,A.aAp])
w(A.qz,B.q)})()
B.be(b.typeUniverse,JSON.parse('{"oI":{"av":["hH?"],"aK":["hH?"],"aK.T":"hH?","av.T":"hH?"},"to":{"av":["a_"],"aK":["a_"],"aK.T":"a_","av.T":"a_"},"uF":{"av":["b9"],"aK":["b9"],"aK.T":"b9","av.T":"b9"},"t8":{"J":[],"d":[]},"a1d":{"P":["t8"]}}'))
var y=(function rtii(){var x=B.x
return{k:x("hH"),a:x("a_"),r:x("io"),m:x("cG"),E:x("b9"),b:x("oI?"),e:x("to?"),d:x("mR?"),f:x("jC?"),w:x("uF?")}})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_49",e:"endPart",h:b})})($__dart_deferred_initializers__,"4WnD0rQRRq/6ZVVgZKoU/l+EKok=");