((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_5",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={aAF:function aAF(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},aAG:function aAG(){},aAH:function aAH(d,e,f,g,h,i){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i},aAE:function aAE(){},AB:function AB(d,e,f,g,h){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h},AC:function AC(d,e,f){var _=this
_.b=_.w=null
_.c=!1
_.uq$=d
_.cX$=e
_.aF$=f
_.a=null},a_m:function a_m(d,e,f,g,h,i,j){var _=this
_.eK=d
_.y1=e
_.y2=f
_.dz$=g
_.af$=h
_.cM$=i
_.b=_.dy=null
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
_.dx=$},
anX(d,e,f,g,h,i,j){var x,w=null
if(i==null){x=d==null
x=x?C.fP:w}else x=i
return new A.VE(e,new B.Ju(f,g,!0,!0,!0,B.ba3(),w),h,C.a0,!1,d,w,x,w,j,w,0,w,g,C.W,w,w,C.J,C.ax,w)},
VE:function VE(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w){var _=this
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
a0D:function a0D(d,e,f){this.f=d
this.d=e
this.a=f}}
B=c[0]
C=c[2]
A=a.updateHolder(c[22],A)
A.aAF.prototype={
a56(d){var x=this.c
return d.xu(this.d,x,x)},
j(d){var x=this
return"SliverGridGeometry("+C.b.c4(B.a(["scrollOffset: "+B.m(x.a),"crossAxisOffset: "+B.m(x.b),"mainAxisExtent: "+B.m(x.c),"crossAxisExtent: "+B.m(x.d)],y.x),", ")+")"}}
A.aAG.prototype={}
A.aAH.prototype={
a5k(d){var x=this.b
if(x>0)return Math.max(0,this.a*C.d.jB(d/x)-1)
return 0},
ahA(d){var x,w,v=this
if(v.f){x=v.c
w=v.e
return v.a*x-d-w-(x-w)}return d},
Ga(d){var x=this,w=x.a,v=C.e.av(d,w)
return new A.aAF(C.e.jY(d,w)*x.b,x.ahA(v*x.c),x.d,x.e)},
a_L(d){var x
if(d===0)return 0
x=this.b
return x*(C.e.jY(d-1,this.a)+1)-(x-this.d)}}
A.aAE.prototype={}
A.AB.prototype={
Pk(d){var x=this,w=x.c,v=x.a,u=Math.max(0,d.w-w*(v-1))/v,t=x.e
if(t==null)t=u/x.d
return new A.aAH(v,t+x.b,u+w,t,u,B.kU(d.x))}}
A.AC.prototype={
j(d){return"crossAxisOffset="+B.m(this.w)+"; "+this.a9t(0)}}
A.a_m.prototype={
f7(d){if(!(d.b instanceof A.AC))d.b=new A.AC(!1,null,null)},
sa5G(d){var x,w=this
if(w.eK===d)return
if(B.C(d)===B.C(w.eK)){x=w.eK
x=x.a!==d.a||x.b!==d.b||x.c!==d.c||x.d!==d.d||x.e!=d.e}else x=!0
if(x)w.aa()
w.eK=d},
tT(d){var x=d.b
x.toString
x=y.t.a(x).w
x.toString
return x},
bG(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6=this,a7=null,a8=y.z.a(B.p.prototype.ga7.call(a6)),a9=a6.y1
a9.R8=!1
x=a8.d
w=x+a8.z
v=w+a8.Q
u=a6.eK.Pk(a8)
t=u.b
s=t>1e-10?u.a*C.d.jY(w,t):0
r=isFinite(v)?u.a5k(v):a7
if(a6.af$!=null){q=a6.a_p(s)
a6.q6(q,r!=null?a6.a_q(r):0)}else a6.q6(0,0)
p=u.Ga(s)
if(a6.af$==null)if(!a6.KT(s,p.a)){o=u.a_L(a9.gtS())
a6.dy=B.kB(a7,!1,a7,a7,o,0,0,o,a7)
a9.qg()
return}n=p.a
m=n+p.c
t=a6.af$
t.toString
t=t.b
t.toString
l=y.c
t=l.a(t).b
t.toString
k=t-1
t=y.t
j=a7
for(;k>=s;--k){i=u.Ga(k)
h=i.c
g=a6.a1S(a8.xu(i.d,h,h))
f=g.b
f.toString
t.a(f)
e=i.a
f.a=e
f.w=i.b
if(j==null)j=g
m=Math.max(m,e+h)}if(j==null){h=a6.af$
h.toString
h.hl(p.a56(a8))
j=a6.af$
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
break}i=u.Ga(k)
e=i.c
a0=a8.xu(i.d,e,e)
a1=j.b
a1.toString
g=h.a(a1).aF$
if(g!=null){a1=g.b
a1.toString
a1=l.a(a1).b
a1.toString
a1=a1!==k}else a1=!0
if(a1){g=a6.a1Q(a0,j)
if(g==null){d=!0
break}}else g.hl(a0)
a1=g.b
a1.toString
t.a(a1)
a2=i.a
a1.a=a2
a1.w=i.b
m=Math.max(m,a2+e);++k
j=g}t=a6.cM$
t.toString
t=t.b
t.toString
t=l.a(t).b
t.toString
a3=d?m:a9.Mv(a8,s,t,n,m)
a4=a6.xA(a8,Math.min(x,n),m)
a5=a6.Dd(a8,n,m)
a6.dy=B.kB(a5,a3>a4||x>0||a8.f!==0,a7,a7,a3,a4,0,a3,a7)
if(a3===m)a9.R8=!0
a9.qg()}}
A.VE.prototype={
a_b(d){return new A.a0D(this.R8,this.RG,null)}}
A.a0D.prototype={
aW(d){var x=new A.a_m(this.f,y.v.a(d),B.D(y.e,y.g),0,null,null,B.a9())
x.aV()
return x},
aZ(d,e){e.sa5G(this.f)},
Mu(d,e,f,g,h){var x
this.a9u(d,e,f,g,h)
x=this.f.Pk(d).a_L(this.d.gi5())
return x}}
var z=a.updateTypes([]);(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.K,[A.aAF,A.aAG,A.aAE])
w(A.aAH,A.aAG)
w(A.AB,A.aAE)
w(A.AC,B.fM)
w(A.a_m,B.mH)
w(A.VE,B.Ej)
w(A.a0D,B.mK)})()
B.fb(b.typeUniverse,JSON.parse('{"AC":{"fM":[],"ov":[],"eh":["y"],"lh":[],"d7":[]},"a_m":{"mH":[],"dg":[],"ae":["y","fM"],"p":[],"as":[],"ae.1":"fM","ae.0":"y"},"VE":{"am":[],"d":[]},"a0D":{"mK":[],"au":[],"d":[]}}'))
var y={x:B.Z("x<k>"),g:B.Z("y"),z:B.Z("mJ"),t:B.Z("AC"),v:B.Z("we"),c:B.Z("fM"),e:B.Z("l")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_5",e:"endPart",h:b})})($__dart_deferred_initializers__,"dMpeljfgiJTK7GQTQb88W7MruN8=");