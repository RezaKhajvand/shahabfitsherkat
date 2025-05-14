((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_53",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var C,B,A={pR:function pR(){},
eB(d){return new A.a59(d)},
a59:function a59(d){this.a=d},
aix:function aix(){},
bjV(d){if(B.e.ao(d,4)===0)if(B.e.ao(d,100)===0)return B.e.ao(d,400)===0
else return!0
else return!1},
bjU(d,e){if(e===2)return A.bjV(d)?29:28
else return D.a01[e-1]},
aZ3(d,e,f,g,h){var x,w,v,u
if(d<1925675||d>3108616)throw C.e(A.eB(y.b))
if(e>23)throw C.e(A.eB("Hour is out of bounds. [0..23]"))
if(f>59)throw C.e(A.eB("Minute is out of bounds. [0..59]"))
if(g>59)throw C.e(A.eB("Second is out of bounds. [0..59]"))
if(h>999)throw C.e(A.eB("Millisecond is out of bounds. [0..999]"))
x=4*d
w=x+139361631+B.e.cG(B.e.cG(x+183187720,146097)*3,4)*4-3908
v=B.e.cG(B.e.ao(w,1461),4)*5+308
x=B.e.cG(B.e.ao(v,153),5)
u=B.e.ao(B.e.cG(v,153),12)+1
return new A.G0(d,B.e.cG(w,1461)-100100+B.e.cG(8-u,6),u,x+1,e,f,g,h)},
aZ4(d,e,f,g,h,i,j){var x,w,v="Gregorian date is out of computable range."
if(d<560||d>3798)throw C.e(A.eB(v))
if(e<1||e>12)throw C.e(A.eB("Gregorian month is out of valid range."))
x=A.bjU(d,e)
if(f<1||f>x)throw C.e(A.eB("Gregorian day is out of valid range."))
if(d===560){if(e>=3)w=e===3&&f<20
else w=!0
if(w)throw C.e(A.eB(v))}if(g>23)throw C.e(A.eB("Hour is out of bounds. [0..23]"))
if(h>59)throw C.e(A.eB("Minute is out of bounds. [0..59]"))
if(i>59)throw C.e(A.eB("Second is out of bounds. [0..59]"))
if(j>999)throw C.e(A.eB("Millisecond is out of bounds. [0..999]"))
w=B.e.cG(e-8,6)
return new A.G0(B.e.cG((d+w+100100)*1461,4)+B.e.cG(153*((e+9)%12)+2,5)+f-34840408-B.e.cG(B.e.cG(d+100100+w,100)*3,4)+752,d,e,f,g,h,i,j)},
G1(d){return A.aZ4(C.HN(d),C.aYl(d),C.aYh(d),C.aYi(d),C.aYk(d),C.aYm(d),C.aYj(d))},
G0:function G0(d,e,f,g,h,i,j,k){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j
_.w=k},
b5F(d){var x,w,v,u,t,s,r,q,p=[-61,9,38,199,426,686,756,818,1111,1181,1210,1635,2060,2097,2192,2262,2324,2394,2456,3178],o=d+621,n=p[0]
if(d<-61||d>=3178)throw C.e(C.Y("should not happen"))
for(x=-14,w=0,v=1;v<20;++v,n=u){u=p[v]
w=u-n
if(d<u)break
x=x+B.e.cG(w,33)*8+B.e.cG(B.e.ao(w,33),4)}t=d-n
x=x+B.e.cG(t,33)*8+B.e.cG(B.e.ao(t,33)+3,4)
if(B.e.ao(w,33)===4&&w-t===4)++x
s=B.e.cG(o,4)
r=B.e.cG((B.e.cG(o,100)+1)*3,4)
q=B.e.ao(B.e.ao((w-t<6?t-w+B.e.cG(w+4,33)*33:t)+1,33)-1,4)
if(q===-1)q=4
return new A.aKL(q,o,20+x-(s-r-150))},
b5G(d,e,f,g,h){var x,w,v,u
if(d<1925675||d>3108616)throw C.e(A.eB(y.b))
if(e>23)throw C.e(A.eB("Hour is out of bounds. [0..23]"))
if(f>59)throw C.e(A.eB("Minute is out of bounds. [0..59]"))
if(g>59)throw C.e(A.eB("Second is out of bounds. [0..59]"))
if(h>999)throw C.e(A.eB("Millisecond is out of bounds. [0..999]"))
x=A.aZ3(d,e,f,g,h).b
w=x-621
v=A.b5F(w)
u=d-A.aZ4(x,3,v.c,e,f,g,h).a
if(u>=0)if(u<=185)return new A.z1(d,w,1+B.e.cG(u,31),B.e.ao(u,31)+1,e,f,g,h)
else u-=186
else{--w
u+=179
if(v.a===1)++u}return new A.z1(d,w,7+B.e.cG(u,30),B.e.ao(u,30)+1,e,f,g,h)},
aKL:function aKL(d,e,f){this.a=d
this.b=e
this.c=f},
z1:function z1(d,e,f,g,h,i,j,k){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j
_.w=k},
VG:function VG(d){this.a=d}},D
C=c[0]
B=c[2]
A=a.updateHolder(c[54],A)
D=c[131]
A.pR.prototype={
gOE(d){var x=this,w=x.ga1x(),v=x.ga2r(),u=x.gPT()
return C.da(0,w,0,x.ga2o(),v,u)},
k(d,e){if(e==null)return!1
return e instanceof A.pR&&this.bT(0,e)===0},
gF(d){return B.e.gF(this.guT())^B.e.gF(this.gOE(0).a)},
bT(d,e){var x=this
if(x===e)return 0
else if(x.guT()===e.guT())return B.e.bT(x.gOE(0).a,e.gOE(0).a)
else if(x.guT()>e.guT())return 1
else return-1},
$ici:1}
A.a59.prototype={
j(d){return"DateException: "+this.a},
$icg:1}
A.aix.prototype={
ga4h(){var x,w=this.a.ga4g()
if(w<0)throw C.e(C.Y("date.year = "+w+" < 0"))
if(w>9999)throw C.e(C.Y("date.year = "+w+" > 9999"))
x=B.e.j(w)
switch(x.length){case 4:return x
case 3:return"0"+x
case 2:return"00"+x
case 1:return"000"+x
default:return"0000"}}}
A.G0.prototype={
a3S(){var x=this
return C.b1g(x.b,x.c,x.d,x.e,x.f,x.r,x.w)},
vm(){var x=this
return A.b5G(x.a,x.e,x.f,x.r,x.w)},
j(d){var x=this
return"Gregorian("+x.b+", "+x.c+", "+x.d+", "+x.e+", "+x.f+", "+x.r+", "+x.w+")"},
a3(d,e){return this.xv(e)},
ae(d,e){return this.xv(-e)},
xv(d){var x=this
if(d===0)return x
else return A.aZ3(x.a+d,x.e,x.f,x.r,x.w)},
guT(){return this.a},
ga4g(){return this.b},
ga1x(){return this.e},
ga2r(){return this.f},
gPT(){return this.r},
ga2o(){return this.w}}
A.aKL.prototype={}
A.z1.prototype={
a3N(){var x=this
return A.aZ3(x.a,x.e,x.f,x.r,x.w)},
j(d){var x=this
return"Jalali("+x.b+", "+x.c+", "+x.d+", "+x.e+", "+x.f+", "+x.r+", "+x.w+")"},
a3(d,e){return this.xv(e)},
ae(d,e){return this.xv(-e)},
xv(d){var x=this
if(d===0)return x
else return A.b5G(x.a+d,x.e,x.f,x.r,x.w)},
guT(){return this.a},
ga4g(){return this.b},
ga1x(){return this.e},
ga2r(){return this.f},
gPT(){return this.r},
ga2o(){return this.w}}
A.VG.prototype={}
var z=a.updateTypes([]);(function inheritance(){var x=a.inheritMany,w=a.inherit
x(C.D,[A.pR,A.a59,A.aix,A.aKL])
x(A.pR,[A.G0,A.z1])
w(A.VG,A.aix)})()
C.bV(b.typeUniverse,JSON.parse('{"pR":{"ci":["pR"]},"a59":{"cg":[]},"G0":{"ci":["pR"]},"z1":{"ci":["pR"]}}'))
var y={b:"Julian day number is out of computable range."};(function constants(){var x=a.makeConstList
D.a01=C.a(x([31,0,31,30,31,30,31,31,30,31,30,31]),C.S("o<l>"))})()};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_53",e:"endPart",h:b})})($__dart_deferred_initializers__,"zQrGmbuube0RDzPx/TlEg8eQh0g=");