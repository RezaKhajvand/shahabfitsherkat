((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_5",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={aBx:function aBx(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},aBy:function aBy(){},aBz:function aBz(d,e,f,g,h,i){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i},aBw:function aBw(){},AS:function AS(d,e,f,g,h){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h},AT:function AT(d,e,f){var _=this
_.b=_.w=null
_.c=!1
_.uv$=d
_.cX$=e
_.aG$=f
_.a=null},a_T:function a_T(d,e,f,g,h,i,j){var _=this
_.eL=d
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
aoP(d,e,f,g,h,i,j){var x,w=null
if(i==null){x=d==null
x=x?C.fQ:w}else x=i
return new A.W5(e,new B.JS(f,g,!0,!0,!0,B.bbl(),w),h,C.a1,!1,d,w,x,w,j,w,0,w,g,C.W,w,w,C.J,C.ax,w)},
W5:function W5(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w){var _=this
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
a19:function a19(d,e,f){this.f=d
this.d=e
this.a=f}}
B=c[0]
C=c[2]
A=a.updateHolder(c[22],A)
A.aBx.prototype={
a5r(d){var x=this.c
return d.xz(this.d,x,x)},
j(d){var x=this
return"SliverGridGeometry("+C.b.c4(B.a(["scrollOffset: "+B.m(x.a),"crossAxisOffset: "+B.m(x.b),"mainAxisExtent: "+B.m(x.c),"crossAxisExtent: "+B.m(x.d)],y.x),", ")+")"}}
A.aBy.prototype={}
A.aBz.prototype={
a5F(d){var x=this.b
if(x>0)return Math.max(0,this.a*C.d.jC(d/x)-1)
return 0},
ahY(d){var x,w,v=this
if(v.f){x=v.c
w=v.e
return v.a*x-d-w-(x-w)}return d},
Gn(d){var x=this,w=x.a,v=C.e.av(d,w)
return new A.aBx(C.e.jZ(d,w)*x.b,x.ahY(v*x.c),x.d,x.e)},
a02(d){var x
if(d===0)return 0
x=this.b
return x*(C.e.jZ(d-1,this.a)+1)-(x-this.d)}}
A.aBw.prototype={}
A.AS.prototype={
Pz(d){var x=this,w=x.c,v=x.a,u=Math.max(0,d.w-w*(v-1))/v,t=x.e
if(t==null)t=u/x.d
return new A.aBz(v,t+x.b,u+w,t,u,B.kV(d.x))}}
A.AT.prototype={
j(d){return"crossAxisOffset="+B.m(this.w)+"; "+this.a9P(0)}}
A.a_T.prototype={
f9(d){if(!(d.b instanceof A.AT))d.b=new A.AT(!1,null,null)},
sa60(d){var x,w=this
if(w.eL===d)return
if(B.E(d)===B.E(w.eL)){x=w.eL
x=x.a!==d.a||x.b!==d.b||x.c!==d.c||x.d!==d.d||x.e!=d.e}else x=!0
if(x)w.aa()
w.eL=d},
tY(d){var x=d.b
x.toString
x=y.t.a(x).w
x.toString
return x},
bG(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6=this,a7=null,a8=y.z.a(B.w.prototype.ga7.call(a6)),a9=a6.y1
a9.R8=!1
x=a8.d
w=x+a8.z
v=w+a8.Q
u=a6.eL.Pz(a8)
t=u.b
s=t>1e-10?u.a*C.d.jZ(w,t):0
r=isFinite(v)?u.a5F(v):a7
if(a6.af$!=null){q=a6.a_H(s)
a6.q7(q,r!=null?a6.a_I(r):0)}else a6.q7(0,0)
p=u.Gn(s)
if(a6.af$==null)if(!a6.L6(s,p.a)){o=u.a02(a9.gtX())
a6.dy=B.kC(a7,!1,a7,a7,o,0,0,o,a7)
a9.qh()
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
for(;k>=s;--k){i=u.Gn(k)
h=i.c
g=a6.a2b(a8.xz(i.d,h,h))
f=g.b
f.toString
t.a(f)
e=i.a
f.a=e
f.w=i.b
if(j==null)j=g
m=Math.max(m,e+h)}if(j==null){h=a6.af$
h.toString
h.hm(p.a5r(a8))
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
break}i=u.Gn(k)
e=i.c
a0=a8.xz(i.d,e,e)
a1=j.b
a1.toString
g=h.a(a1).aG$
if(g!=null){a1=g.b
a1.toString
a1=l.a(a1).b
a1.toString
a1=a1!==k}else a1=!0
if(a1){g=a6.a29(a0,j)
if(g==null){d=!0
break}}else g.hm(a0)
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
a3=d?m:a9.MK(a8,s,t,n,m)
a4=a6.xF(a8,Math.min(x,n),m)
a5=a6.Do(a8,n,m)
a6.dy=B.kC(a5,a3>a4||x>0||a8.f!==0,a7,a7,a3,a4,0,a3,a7)
if(a3===m)a9.R8=!0
a9.qh()}}
A.W5.prototype={
a_t(d){return new A.a19(this.R8,this.RG,null)}}
A.a19.prototype={
aW(d){var x=new A.a_T(this.f,y.v.a(d),B.D(y.e,y.g),0,null,null,B.a9())
x.aV()
return x},
aZ(d,e){e.sa60(this.f)},
MJ(d,e,f,g,h){var x
this.a9Q(d,e,f,g,h)
x=this.f.Pz(d).a02(this.d.gi5())
return x}}
var z=a.updateTypes([]);(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.K,[A.aBx,A.aBy,A.aBw])
w(A.aBz,A.aBy)
w(A.AS,A.aBw)
w(A.AT,B.fN)
w(A.a_T,B.mP)
w(A.W5,B.EC)
w(A.a19,B.mS)})()
B.fc(b.typeUniverse,JSON.parse('{"AT":{"fN":[],"oE":[],"ei":["y"],"lj":[],"d7":[]},"a_T":{"mP":[],"dh":[],"ae":["y","fN"],"w":[],"at":[],"ae.1":"fN","ae.0":"y"},"W5":{"am":[],"d":[]},"a19":{"mS":[],"aw":[],"d":[]}}'))
var y={x:B.Z("x<k>"),g:B.Z("y"),z:B.Z("mR"),t:B.Z("AT"),v:B.Z("wq"),c:B.Z("fN"),e:B.Z("l")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_5",e:"endPart",h:b})})($__dart_deferred_initializers__,"DIHp8jS+RLS4hHkdvcnsHqu3wlo=");