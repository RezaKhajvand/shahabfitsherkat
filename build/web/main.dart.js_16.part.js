((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_16",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={azl:function azl(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},azm:function azm(){},azn:function azn(d,e,f,g,h,i){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i},azk:function azk(){},Ay:function Ay(d,e,f,g,h){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h},Az:function Az(d,e,f){var _=this
_.b=_.w=null
_.c=!1
_.uE$=d
_.d4$=e
_.aD$=f
_.a=null},ZT:function ZT(d,e,f,g,h,i,j){var _=this
_.cm=d
_.ak=e
_.bK=f
_.dD$=g
_.ad$=h
_.cT$=i
_.b=_.fx=null
_.c=0
_.y=_.d=null
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ay=$
_.ch=j
_.CW=!1
_.cx=$
_.cy=!0
_.db=!1
_.dx=null
_.dy=!0
_.fr=null},
amV(d,e,f,g,h,i,j){var x,w=null
if(i==null){x=d==null
x=x?C.fI:w}else x=i
return new A.Vl(e,new B.Jf(f,g,!0,!0,!0,B.b8u(),w),h,C.Z,!1,d,w,x,w,j,w,0,w,g,C.T,C.bZ,w,C.G,C.av,w)},
Vl:function Vl(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w){var _=this
_.R8=d
_.RG=e
_.cy=f
_.c=g
_.d=h
_.e=i
_.f=j
_.r=k
_.w=l
_.x=m
_.y=n
_.z=o
_.Q=p
_.as=q
_.at=r
_.ax=s
_.ay=t
_.ch=u
_.CW=v
_.a=w},
a06:function a06(d,e,f){this.f=d
this.d=e
this.a=f}}
B=c[0]
C=c[2]
A=a.updateHolder(c[35],A)
A.azl.prototype={
a52(d){var x=this.c
return d.xE(this.d,x,x)},
j(d){var x=this
return"SliverGridGeometry("+C.b.co(B.a(["scrollOffset: "+B.m(x.a),"crossAxisOffset: "+B.m(x.b),"mainAxisExtent: "+B.m(x.c),"crossAxisExtent: "+B.m(x.d)],y.x),", ")+")"}}
A.azm.prototype={}
A.azn.prototype={
a5j(d){var x=this.b
if(x>0)return Math.max(0,this.a*C.c.ix(d/x)-1)
return 0},
ahv(d){var x,w,v=this
if(v.f){x=v.c
w=v.e
return v.a*x-d-w-(x-w)}return d},
Gq(d){var x=this,w=x.a,v=C.e.ao(d,w)
return new A.azl(C.e.k8(d,w)*x.b,x.ahv(v*x.c),x.d,x.e)},
a_L(d){var x
if(d===0)return 0
x=this.b
return x*(C.e.k8(d-1,this.a)+1)-(x-this.d)}}
A.azk.prototype={}
A.Ay.prototype={
Pr(d){var x=this,w=x.c,v=x.a,u=Math.max(0,d.w-w*(v-1))/v,t=x.e
if(t==null)t=u/x.d
return new A.azn(v,t+x.b,u+w,t,u,B.kQ(d.x))}}
A.Az.prototype={
j(d){return"crossAxisOffset="+B.m(this.w)+"; "+this.a9q(0)}}
A.ZT.prototype={
fb(d){if(!(d.b instanceof A.Az))d.b=new A.Az(!1,null,null)},
sa5E(d){var x,w=this
if(w.cm===d)return
if(B.H(d)===B.H(w.cm)){x=w.cm
x=x.a!==d.a||x.b!==d.b||x.c!==d.c||x.d!==d.d||x.e!=d.e}else x=!0
if(x)w.a_()
w.cm=d},
u4(d){var x=d.b
x.toString
x=y.t.a(x).w
x.toString
return x},
bP(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6=this,a7=null,a8=y.z.a(B.q.prototype.ga4.call(a6)),a9=a6.ak
a9.R8=!1
x=a8.d
w=x+a8.z
v=w+a8.Q
u=a6.cm.Pr(a8)
t=u.b
s=t>1e-10?u.a*C.c.k8(w,t):0
r=isFinite(v)?u.a5j(v):a7
if(a6.ad$!=null){q=a6.a_l(s)
a6.qj(q,r!=null?a6.a_m(r):0)}else a6.qj(0,0)
p=u.Gq(s)
if(a6.ad$==null)if(!a6.KW(s,p.a)){o=u.a_L(a9.gu3())
a6.fx=B.kz(a7,!1,a7,a7,o,0,0,o,a7)
a9.qu()
return}n=p.a
m=n+p.c
t=a6.ad$
t.toString
t=t.b
t.toString
l=y.c
t=l.a(t).b
t.toString
k=t-1
t=y.t
j=a7
for(;k>=s;--k){i=u.Gq(k)
h=i.c
g=a6.a1K(a8.xE(i.d,h,h))
f=g.b
f.toString
t.a(f)
e=i.a
f.a=e
f.w=i.b
if(j==null)j=g
m=Math.max(m,e+h)}if(j==null){h=a6.ad$
h.toString
h.hp(p.a52(a8))
j=a6.ad$
h=j.b
h.toString
t.a(h)
h.a=n
h.w=p.b}h=j.b
h.toString
h=l.a(h).b
h.toString
k=h+1
h=B.n(a6).i("ae.1")
f=r!=null
while(!0){if(!(!f||k<=r)){d=!1
break}i=u.Gq(k)
e=i.c
a0=a8.xE(i.d,e,e)
a1=j.b
a1.toString
g=h.a(a1).aD$
if(g!=null){a1=g.b
a1.toString
a1=l.a(a1).b
a1.toString
a1=a1!==k}else a1=!0
if(a1){g=a6.a1I(a0,j)
if(g==null){d=!0
break}}else g.hp(a0)
a1=g.b
a1.toString
t.a(a1)
a2=i.a
a1.a=a2
a1.w=i.b
m=Math.max(m,a2+e);++k
j=g}t=a6.cT$
t.toString
t=t.b
t.toString
t=l.a(t).b
t.toString
a3=d?m:a9.ME(a8,s,t,n,m)
a4=a6.xM(a8,Math.min(x,n),m)
a5=a6.Du(a8,n,m)
a6.fx=B.kz(a5,a3>a4||x>0||a8.f!==0,a7,a7,a3,a4,0,a3,a7)
if(a3===m)a9.R8=!0
a9.qu()}}
A.Vl.prototype={
a_9(d){return new A.a06(this.R8,this.RG,null)}}
A.a06.prototype={
aX(d){var x=new A.ZT(this.f,y.v.a(d),B.I(y.e,y.g),0,null,null,B.aa())
x.aW()
return x},
b_(d,e){e.sa5E(this.f)},
MD(d,e,f,g,h){var x
this.a9r(d,e,f,g,h)
x=this.f.Pr(d).a_L(this.d.gi7())
return x}}
var z=a.updateTypes([]);(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.D,[A.azl,A.azm,A.azk])
w(A.azn,A.azm)
w(A.Ay,A.azk)
w(A.Az,B.fM)
w(A.ZT,B.mB)
w(A.Vl,B.Ef)
w(A.a06,B.lA)})()
B.bV(b.typeUniverse,JSON.parse('{"Az":{"fM":[],"ow":[],"ef":["r"],"ll":[],"d6":[]},"ZT":{"mB":[],"dk":[],"ae":["r","fM"],"q":[],"ap":[],"ae.1":"fM","ae.0":"r"},"Vl":{"a6":[],"c":[]},"a06":{"lA":[],"at":[],"c":[]}}'))
var y={x:B.S("o<k>"),g:B.S("r"),z:B.S("mK"),t:B.S("Az"),v:B.S("ru"),c:B.S("fM"),e:B.S("l")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_16",e:"endPart",h:b})})($__dart_deferred_initializers__,"KElacJpmgfdpNzIHgn/njP6i9sk=");