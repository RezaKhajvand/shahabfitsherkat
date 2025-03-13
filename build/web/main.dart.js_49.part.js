((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_49",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={oC:function oC(d,e){this.a=d
this.b=e},
abZ(d,e,f,g,h,i,j,k,l){var x,w,v=null
if(g==null)x=v
else x=g
if(l!=null||j!=null){w=e==null?v:e.za(j,l)
if(w==null)w=B.eW(j,l)}else w=e
return new A.t1(d,k,x,i,w,f,h,v,v)},
tf:function tf(d,e){this.a=d
this.b=e},
uz:function uz(d,e){this.a=d
this.b=e},
t1:function t1(d,e,f,g,h,i,j,k,l){var _=this
_.r=d
_.x=e
_.y=f
_.z=g
_.Q=h
_.c=i
_.d=j
_.e=k
_.a=l},
a0P:function a0P(d,e){var _=this
_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=null
_.e=_.d=$
_.bz$=d
_.b5$=e
_.c=_.a=null},
azK:function azK(){},
azL:function azL(){},
azM:function azM(){},
azN:function azN(){},
azO:function azO(){},
azP:function azP(){},
azQ:function azQ(){},
azR:function azR(){},
aZx(){var x=new Float64Array(4)
x[3]=1
return new A.qs(x)},
qs:function qs(d){this.a=d}},D
B=c[0]
C=c[2]
A=a.updateHolder(c[52],A)
D=c[54]
A.oC.prototype={
eW(d){return B.Cf(this.a,this.b,d)}}
A.tf.prototype={
eW(d){var x=B.lk(this.a,this.b,d)
x.toString
return x}}
A.uz.prototype={
eW(a8){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2=new B.eN(new Float64Array(3)),a3=new B.eN(new Float64Array(3)),a4=A.aZx(),a5=A.aZx(),a6=new B.eN(new Float64Array(3)),a7=new B.eN(new Float64Array(3))
this.a.a_i(a2,a4,a6)
this.b.a_i(a3,a5,a7)
x=1-a8
w=a2.ma(x).a1(0,a3.ma(a8))
v=a4.ma(x).a1(0,a5.ma(a8))
u=new Float64Array(4)
t=new A.qs(u)
t.dn(v)
t.yD()
s=a6.ma(x).a1(0,a7.ma(a8))
x=new Float64Array(16)
v=new B.b8(x)
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
v.ca(s)
return v}}
A.t1.prototype={
a2(){return new A.a0P(null,null)}}
A.a0P.prototype={
mW(d){var x,w,v=this,u=null,t=v.CW
v.a.toString
x=y.b
v.CW=x.a(d.$3(t,u,new A.azK()))
t=y.f
v.cx=t.a(d.$3(v.cx,v.a.x,new A.azL()))
w=y.d
v.cy=w.a(d.$3(v.cy,v.a.y,new A.azM()))
v.db=w.a(d.$3(v.db,v.a.z,new A.azN()))
v.dx=y.e.a(d.$3(v.dx,v.a.Q,new A.azO()))
w=v.dy
v.a.toString
v.dy=t.a(d.$3(w,u,new A.azP()))
w=v.fr
v.a.toString
v.fr=y.w.a(d.$3(w,u,new A.azQ()))
w=v.fx
v.a.toString
v.fx=x.a(d.$3(w,u,new A.azR()))},
G(d){var x,w,v,u,t,s,r,q=this,p=null,o=q.gfl(),n=q.CW
n=n==null?p:n.ae(o.gm())
x=q.cx
x=x==null?p:x.ae(o.gm())
w=q.cy
w=w==null?p:w.ae(o.gm())
v=q.db
v=v==null?p:v.ae(o.gm())
u=q.dx
u=u==null?p:u.ae(o.gm())
t=q.dy
t=t==null?p:t.ae(o.gm())
s=q.fr
s=s==null?p:s.ae(o.gm())
r=q.fx
r=r==null?p:r.ae(o.gm())
return B.bn(n,q.a.r,C.m,p,u,w,v,p,p,t,x,s,r,p)}}
A.qs.prototype={
dn(d){var x=d.a,w=this.a,v=x[0]
w.$flags&2&&B.aB(w)
w[0]=v
w[1]=x[1]
w[2]=x[2]
w[3]=x[3]},
a5a(d){var x,w,v,u,t,s=d.a,r=s[0],q=s[4],p=s[8],o=0+r+q+p
if(o>0){x=Math.sqrt(o+1)
r=this.a
r.$flags&2&&B.aB(r)
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
t.$flags&2&&B.aB(t)
t[w]=x*0.5
x=0.5/x
t[3]=(s[q+u]-s[p+v])*x
t[v]=(s[r+v]+s[q+w])*x
t[u]=(s[r+u]+s[p+w])*x}},
yD(){var x,w,v,u=Math.sqrt(this.gyn())
if(u===0)return 0
x=1/u
w=this.a
v=w[0]
w.$flags&2&&B.aB(w)
w[0]=v*x
w[1]=w[1]*x
w[2]=w[2]*x
w[3]=w[3]*x
return u},
gyn(){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return w*w+v*v+u*u+t*t},
gF(d){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return Math.sqrt(w*w+v*v+u*u+t*t)},
ma(d){var x=new Float64Array(4),w=new A.qs(x)
w.dn(this)
x[3]=x[3]*d
x[2]=x[2]*d
x[1]=x[1]*d
x[0]=x[0]*d
return w},
ai(a5,a6){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h=this.a,g=h[3],f=h[2],e=h[1],d=h[0],a0=a6.gaCn(),a1=a0.h(0,3),a2=a0.h(0,2),a3=a0.h(0,1),a4=a0.h(0,0)
h=C.c.ai(g,a4)
x=C.c.ai(d,a1)
w=C.c.ai(e,a2)
v=C.c.ai(f,a3)
u=C.c.ai(g,a3)
t=C.c.ai(e,a1)
s=C.c.ai(f,a4)
r=C.c.ai(d,a2)
q=C.c.ai(g,a2)
p=C.c.ai(f,a1)
o=C.c.ai(d,a3)
n=C.c.ai(e,a4)
m=C.c.ai(g,a1)
l=C.c.ai(d,a4)
k=C.c.ai(e,a3)
j=C.c.ai(f,a2)
i=new Float64Array(4)
i[0]=h+x+w-v
i[1]=u+t+s-r
i[2]=q+p+o-n
i[3]=m-l-k-j
return new A.qs(i)},
a1(d,e){var x,w=new Float64Array(4),v=new A.qs(w)
v.dn(this)
x=e.a
w[0]=w[0]+x[0]
w[1]=w[1]+x[1]
w[2]=w[2]+x[2]
w[3]=w[3]+x[3]
return v},
aa(d,e){var x,w=new Float64Array(4),v=new A.qs(w)
v.dn(this)
x=e.a
w[0]=w[0]-x[0]
w[1]=w[1]-x[1]
w[2]=w[2]-x[2]
w[3]=w[3]-x[3]
return v},
h(d,e){return this.a[e]},
n(d,e,f){var x=this.a
x.$flags&2&&B.aB(x)
x[e]=f},
k(d){var x=this.a
return B.m(x[0])+", "+B.m(x[1])+", "+B.m(x[2])+" @ "+B.m(x[3])}}
var z=a.updateTypes(["oC(@)","ju(@)","tf(@)","uz(@)"])
A.azK.prototype={
$1(d){return new A.oC(y.k.a(d),null)},
$S:z+0}
A.azL.prototype={
$1(d){return new D.ju(y.m.a(d),null)},
$S:z+1}
A.azM.prototype={
$1(d){return new B.mC(y.r.a(d),null)},
$S:241}
A.azN.prototype={
$1(d){return new B.mC(y.r.a(d),null)},
$S:241}
A.azO.prototype={
$1(d){return new A.tf(y.a.a(d),null)},
$S:z+2}
A.azP.prototype={
$1(d){return new D.ju(y.m.a(d),null)},
$S:z+1}
A.azQ.prototype={
$1(d){return new A.uz(y.E.a(d),null)},
$S:z+3}
A.azR.prototype={
$1(d){return new A.oC(y.k.a(d),null)},
$S:z+0};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.au,[A.oC,A.tf,A.uz])
w(A.t1,B.xX)
w(A.a0P,B.oE)
x(B.c_,[A.azK,A.azL,A.azM,A.azN,A.azO,A.azP,A.azQ,A.azR])
w(A.qs,B.p)})()
B.bb(b.typeUniverse,JSON.parse('{"oC":{"au":["hy?"],"aG":["hy?"],"aG.T":"hy?","au.T":"hy?"},"tf":{"au":["a_"],"aG":["a_"],"aG.T":"a_","au.T":"a_"},"uz":{"au":["b8"],"aG":["b8"],"aG.T":"b8","au.T":"b8"},"t1":{"G":[],"c":[]},"a0P":{"N":["t1"]}}'))
var y=(function rtii(){var x=B.r
return{k:x("hy"),a:x("a_"),r:x("ib"),m:x("cE"),E:x("b8"),b:x("oC?"),e:x("tf?"),d:x("mC?"),f:x("ju?"),w:x("uz?")}})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_49",e:"endPart",h:b})})($__dart_deferred_initializers__,"TwWQLGmF6FnXV2TqaBvjMG8db7I=");