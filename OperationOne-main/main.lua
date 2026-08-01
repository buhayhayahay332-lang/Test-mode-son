return ({["PvlVi"]=(function(ejz,pdj)return pdj;end),["WfIYA"]=(function(njO,LwD,Nv1)local CoZ,Qxu,Eqd,hbb=LwD[0x64D8],(((Nv1[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Nv1[1],LwD[0x49D0];local qxL=Eqd[1];do local Tnk,zwx=Qxu,(qxL[0x73CC] or 0);hbb[Tnk]=zwx;local avx=CoZ and CoZ[Tnk];if avx then avx[1]=zwx;end;end;end),["wAnP"]=(function(ajE,AwT,ovz)local jgz,Cx1,SiD,OwA=ovz[1],(((ovz[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,AwT[0x64D8],AwT[0x49D0];local Mx2,Fx3=jgz[2],jgz[1];do local Onj,IwO=Cx1,OwA[(Fx3[0x73CC] or 0)] / (Mx2[0x73CC] or 0);OwA[Onj]=IwO;local nvE=SiD and SiD[Onj];if nvE then nvE[1]=IwO;end;end;end),["VkKn"]=(function(muZ,dvI)local xc0,aqL=(muZ.BdvHJ)(muZ,dvI,1);local jdA;jdA,aqL=(muZ.BdvHJ)(muZ,dvI,aqL);return xc0 or "",jdA or "";end),["BmK"]=(function(ujD,VwP,AvX)local Cxt,GwB,ViK,sqF=(((AvX[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,VwP[0x49D0],VwP[0x64D8],AvX[1];local Qzt=sqF[1];do local TfL,cnn=#GwB[Cxt],Cxt;GwB[cnn]=TfL;local fy3=ViK and ViK[cnn];if fy3 then fy3[1]=TfL;end;end;end),["UG"]=(function(Tje,Upp)return Upp[8] or {};end),["YgL"]=(function(Ajt,fb_,qrU)return fb_[0x49D0][qrU];end),["I"]=(function(BnC,Nh5,NrK)local bbI,ncH=BnC.YgL,BnC.bbmac;local seQ=NrK[7];if type(seQ) ~= "number" then seQ=(BnC.M)(BnC,seQ or "",1) or 0;NrK[7]=seQ;end;if seQ == 0 then ncH(BnC,Nh5,{},0);return;end;local Dsb,Zfr=(((((NrK[1] or {})[1] or {})))[0x73CC] or 0),(((NrK[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;if (((((NrK[1] or {})[2] or {})))[0x73CC] or 0) ~= 0 then Dsb=(Nh5[0x4AB1] or (Zfr - 1)) - Zfr + 1;if Dsb < 0 then Dsb=0;end;end;local bgk={};for Sj5=1,Dsb do bgk[Sj5]=bbI(BnC,Nh5,Zfr + Sj5 - 1);end;ncH(BnC,Nh5,bgk,Dsb);end),["SuOgo"]=(function(c,ei3,EiO)local huB,TiI,kgj,bxH=ei3[0x49D0],ei3[0x64D8],EiO[1],(((EiO[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;local gxR,kxD=kgj[2],kgj[1];local k;do local peh=kxD;local C,ruG=peh[0x73CC] or 0,peh[0xDF3] or 0x2DE1;if ruG == 0x2E20 then k=huB[C];elseif ruG == 0x55FF then k=C;elseif ruG == 0x5FE7 then local pe7=peh[0x76E1];if pe7 == nil then c.sPBr=c.CWU.bxor(((C + 0x4109) * 797 + (c.ciiT or 0)) % 0x10000,0x8393);c.fJR=((C + ((((EiO[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (c.ciiT or 0)) % 4);pe7=ei3[0x540][C];c.sPBr=nil;if pe7 == c.Y then peh[0x76E1]=c.Y;k=nil;else peh[0x76E1]=pe7 == nil and c.Y or pe7;k=pe7;end;elseif pe7 == c.Y then k=nil;else k=pe7;end;elseif ruG == 0x51F5 then local ve8=peh[0x76E1];if ve8 == nil then c.sPBr=c.CWU.bxor(((C + 0x4109) * 797 + (c.ciiT or 0)) % 0x10000,0x8393);c.fJR=((C + ((((EiO[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (c.ciiT or 0)) % 4);ve8=ei3[0x540][C];c.sPBr=nil;if ve8 == c.Y then peh[0x76E1]=c.Y;k=nil;else peh[0x76E1]=ve8 == nil and c.Y or ve8;k=ve8;end;elseif ve8 == c.Y then k=nil;else k=ve8;end;else k=nil;end;end;local y;do local ver=gxR;local M,duK=ver[0x73CC] or 0,ver[0xDF3] or 0x2DE1;if duK == 0x2E20 then y=huB[M];elseif duK == 0x55FF then y=M;elseif duK == 0x5FE7 then local be9=ver[0x76E1];if be9 == nil then c.sPBr=c.CWU.bxor(((M + 0x4109) * 797 + (c.ciiT or 0)) % 0x10000,0x8393);c.fJR=((M + ((((EiO[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (c.ciiT or 0)) % 4);be9=ei3[0x540][M];c.sPBr=nil;if be9 == c.Y then ver[0x76E1]=c.Y;y=nil;else ver[0x76E1]=be9 == nil and c.Y or be9;y=be9;end;elseif be9 == c.Y then y=nil;else y=be9;end;elseif duK == 0x51F5 then local gte=ver[0x76E1];if gte == nil then c.sPBr=c.CWU.bxor(((M + 0x4109) * 797 + (c.ciiT or 0)) % 0x10000,0x8393);c.fJR=((M + ((((EiO[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (c.ciiT or 0)) % 4);gte=ei3[0x540][M];c.sPBr=nil;if gte == c.Y then ver[0x76E1]=c.Y;y=nil;else ver[0x76E1]=gte == nil and c.Y or gte;y=gte;end;elseif gte == c.Y then y=nil;else y=gte;end;else y=nil;end;end;local kaP=EiO[7];if type(kaP) ~= "number" then local ObW=(c.M)(c,kaP or "",1) or 0;kaP=c.CWU.bxor(ObW,0x5584);EiO[7]=kaP;end;local E;if kaP == 0x418C then E=k == y;elseif kaP == 0x5003 then E=k ~= y;elseif kaP == 0x586B then E=k > y;elseif kaP == 0x4712 then E=k >= y;elseif kaP == 0x1F7A then E=k < y;elseif kaP == 0x4D3C then E=k <= y;elseif kaP == 794 then E=k + y;elseif kaP == 0xD04 then E=k - y;elseif kaP == 0x7B5D then E=k * y;elseif kaP == 0x517 then E=k / y;elseif kaP == 0xA98 then local shN,vdx=type(y),type(k);if (vdx == "number" or vdx == "string") and (shN == "number" or shN == "string") then E=math.floor(k / y);else local bdz=getmetatable(k);local PsE=type(bdz) == "table" and rawget(bdz,"__idiv") or nil;if PsE == nil then local hhS=getmetatable(y);PsE=type(hhS) == "table" and rawget(hhS,"__idiv") or nil;end;E=PsE ~= nil and PsE(k,y) or math.floor(k / y);end;elseif kaP == 0x4E2A then E=k % y;elseif kaP == 0x59A then E=k ^ y;elseif kaP == 0x7ED5 then E=k .. y;elseif kaP == 0x3E6F then E=k and y;elseif kaP == 0x17E4 then E=k or y;end;do local NwI,Inx=E,bxH;huB[Inx]=NwI;local iv_=TiI and TiI[Inx];if iv_ then iv_[1]=NwI;end;end;end),["Q"]=(function(gd_,IbY,ekV)local NbP=gd_.VoQFv;local tkB,qaV,luQ=gd_.CWU,gd_.gN,gd_.xSW.string.byte;local akG,okK,ikQ,nkJ=0,0,0,0;if type(qaV) == "string" then akG=luQ(qaV,1) or 0;okK=luQ(qaV,2) or 0;ikQ=luQ(qaV,3) or 0;nkJ=luQ(qaV,4) or 0;end;local sfw,uuJ=(akG * 609 + okK * 257 + 0xA620) % 0x10000,(ikQ * 647 + nkJ * 131 + 0x5C11) % 0x10000;local SwN=(sfw - uuJ + 0x1B59) % 0x10000;local SbV=(akG * 17 + okK * 29 + ikQ * 43 + nkJ * 59 + 0x183E) % 0x10000;local HwS=(SwN + sfw * 3 + uuJ * 5 + SbV + 0xA55F) % 0x10000;local bq1=(HwS - SwN + sfw * 11 + uuJ * 13 + 844) % 0x10000;local kdE=HwS;NbP(gd_,IbY,(((ekV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,kdE);end),["vf"]=(function(xt4,doq,zs8)local Nyk,VsT=xt4.cyO,xt4.VoQFv;local svT,xg_=Nyk(xt4,doq,(((zs8[1] or {})[1] or {}))),doq[0x2AEC];local cuX=xg_[svT];if cuX == xt4.Y then VsT(xt4,doq,(((zs8[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,nil);elseif cuX ~= nil then VsT(xt4,doq,(((zs8[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,cuX);elseif svT == "limitedstack" then VsT(xt4,doq,(((zs8[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,true);elseif xg_ ~= xt4.uy then VsT(xt4,doq,(((zs8[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,nil);else VsT(xt4,doq,(((zs8[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,xt4.xSW[svT]);end;end),["Qe"]=(function(ojT,RwH,hvA)local HbB,HiL,tqD,Wx4=RwH[0x49D0],RwH[0x64D8],hvA[1],(((hvA[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;local hzc=tqD[1];do local Nnz,DwR=Wx4,false;HbB[Nnz]=DwR;local rvO=HiL and HiL[Nnz];if rvO then rvO[1]=DwR;end;end;end),["NbsId"]=(function(r8,RbG,lvN)local DbK=r8.VoQFv;local zc1=lvN[7];if type(zc1) ~= "string" then zc1="";end;local qdT,onQ=1,r8.CWU;local BsA;BsA,qdT=(r8.M)(r8,zc1,qdT);BsA=BsA or 1;local _c2,ijA=(r8.M)(r8,zc1,qdT or 1);_c2=onQ.bxor(_c2 or 0,0x6151);local RiU;RiU=(r8.BdvHJ)(r8,zc1,ijA or 1);if type(RiU) ~= "string" then RiU="";end;local Sn_=r8.r;local GsO,naT="",(type(Sn_) == "string" and #Sn_ or 0) % 0x10000;local uvS,zgE,cvH,loj,rhH,skX=r8.xSW.table.concat,{},r8.xSW.string.byte,(0xC257 + _c2 + naT + (2 * 0x31F3)) % 256,#GsO,r8.xSW.string.char;for hkZ=1,#RiU do local ai5;if rhH > 0 then ai5=cvH(GsO,((hkZ - 1) % rhH) + 1) or 0;else ai5=(naT + hkZ * 915 + _c2) % 256;end;local dk1=(_c2 + naT * 783 + hkZ * 915 + ai5 * 97 + loj + 2 * 0x31F3) % 256;local LbQ=(0xC257 + hkZ * 635 + loj * 915 + 2 * 0x6151) % 256;local JsS,pvC=cvH(RiU,hkZ) or 0,onQ.bxor(dk1,LbQ);zgE[hkZ]=skX(onQ.bxor(JsS,pvC));loj=((loj * 635) + JsS + pvC + ai5 + hkZ * 915 + 2 * 0xB0BC) % 256;end;local Ac5=uvS(zgE);DbK(r8,RbG,(((lvN[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,r8.xSW.string.sub(Ac5,BsA,BsA + 1));r8.gN=Ac5;end),["cCuO"]=(function(djH,FwM,zvG)local Wb1,iqC,WiV,Vx7=FwM[0x49D0],zvG[1],FwM[0x64D8],(((zvG[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;local rzm=iqC[1];do local RnT,PwY=Vx7,{};Wb1[RnT]=PwY;local TvJ=WiV and WiV[RnT];if TvJ then TvJ[1]=PwY;end;end;end),["aFNIp"]=(function(cjL,OvZ)return OvZ[0x73CC] or 0;end),["enxYq"]=(function(ww,LL,pf_)local KwG,dna,vfE,Gb6,bfT,Kb7,XwJ,kqo=ww.PvlVi,ww.ll or {},ww.uFs,ww.ynu,(ww.xSW.next or next),ww.Iz,ww.VoQFv,LL[0x136E];local Mxa,yoA=(((pf_[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,(pf_[7] or {});if type(yoA) ~= "table" or yoA[0x2728] == nil then yoA=(ww.mlpU)(ww,yoA or "");pf_[7]=yoA;end;local OO,Rhr=yoA[0x4156],yoA[0x2728];if OO == nil then local HoG=yoA[0x4EE6] or "";if HoG == "" then OO=false;else local rn1=Kb7(ww,HoG);OO=bfT(rn1) and rn1 or false;end;yoA[0x4156]=OO;end;local _=LL[0x40A0][Rhr];if not _ then local J=dna[Rhr];if not J then XwJ(ww,LL,Mxa,(function()end));return;end;if J[0x1B10] ~= nil then _=J;else _=vfE(ww,J[0x7C20],J[449],J[0x1B20]);end;LL[0x40A0][Rhr]=_;end;local Uhu,Gd0,LoJ,N,UoX,uni,Itu=LL[0x4140] or 0x49093,LL[0x40A0],LL[0x2AEC],LL[0x64D8],LL[157] or 0x3F165C,LL[0x49D0],LL[0x6435];local haO;local Ntc={};local function Fo1(jem)if not N then N={};LL[0x64D8]=N;end;local JlB=N[jem];if not JlB then JlB={uni[KwG(ww,jem)],jem,uni,true};N[jem]=JlB;end;return JlB;end;if OO then for _qr,ogn in bfT,OO do if ogn[1] == 0 then Ntc[_qr]=Fo1(ogn[2]);end;end;end;local function Iat(hyQ,omq)local mn6,hsY,zew,dtW,YeS={},{},_[0x1B20] or 0,{},1;if OO then for igs,ngh in bfT,OO do local Zrw;if ngh[1] == 0 then Zrw=Ntc[igs];else Zrw=Itu and Itu[ngh[2]] or nil;end;if not Zrw then Zrw={nil,0,nil,false};end;dtW[igs]=Zrw;end;end;for pjW=1,zew do mn6[KwG(ww,pjW - 1)]=hyQ[pjW];end;for Kxl=zew + 1,omq do hsY[YeS]=hyQ[Kxl];YeS=YeS + 1;end;hsY.n=YeS - 1;local nl1={[0x49D0]=mn6,[0x6435]=dtW,[0x540]=_[0x47BA],[0x3E9C]=(UoX - Uhu) + 1,[157]=UoX,[0x4140]=Uhu,[0x4AB1]=zew - 1,[0x136E]=hsY,[0x2AEC]=LoJ,[0x40A0]=Gd0,[0x1363]=_,[0x46E0]=haO,[0x64D8]={}};return nl1,_[0x1B10];end;haO=(function(...)local uko,wmH={...},select("#",...);local ll6,ni8=Iat(uko,wmH);return Gb6(ww,ll6,ni8);end);if ww.qPCl then ww.qPCl[haO]=(function(Lpy,YnD)if Lpy == ww.Mes then if YnD ~= nil then LoJ=YnD;return haO;end;return LoJ;end;return Iat(Lpy,YnD);end);end;XwJ(ww,LL,Mxa,haO);end),["g"]=(function(bmU,Ko8,vv)if Ko8 == nil or Ko8 == "" then return Ko8 or "";end;local Fpg=bmU.xSW;local Wpk,Ypq,pkd=Fpg.string.byte,Fpg.table.concat,Fpg.string.char;local Jd3,YfZ,YY=1,{},0;while Jd3 <= #Ko8 do local Pf0=Wpk(Ko8,Jd3);if not Pf0 then break;end;Jd3=Jd3 + 1;if Pf0 < 128 then local Fot=Pf0 + 1;if Jd3 + Fot - 1 > #Ko8 then return nil;end;for Zxf=0,Fot - 1 do YY=YY + 1;YfZ[YY]=pkd(Wpk(Ko8,Jd3 + Zxf));end;Jd3=Jd3 + Fot;else local AmK=(Pf0 - 128) + 3;local Xak;Xak,Jd3=(bmU.M)(bmU,Ko8,Jd3);if Xak == nil then return nil;end;local _rW=Xak + 1;if _rW <= 0 or _rW > YY then return nil;end;local usG=YY - _rW + 1;for ezn=1,AmK do local Gf3=YfZ[usG];if Gf3 == nil then return nil;end;YY=YY + 1;YfZ[YY]=Gf3;usG=usG + 1;end;end;if vv and vv ~= 0 and YY > vv then return nil;end;end;if vv and vv ~= 0 and YY ~= vv then return nil;end;return Ypq(YfZ);end),["LHP"]=(function(Sjn,Duq,Okq)do local Luj=(((((Okq[1] or {})[1] or {})))[0x73CC] or 0);local ocN=(Duq[157] or 0x3F165C) - (Duq[0x4140] or 0x49093);Duq[0x3E9C]=ocN + Luj;end;end),["pl"]=(function(Eth,GnM,Jol)local j=GnM and GnM[1];if not j then return;end;Eth.ll=GnM[2] or {};Eth.f=Eth.f or (Eth.d)(Eth);j[0x47BB]=j[0x47BB] or {};local gnm=0;if gnm ~= 0 then (Eth.XZPzC)(Eth,j[0x1B10],j[0x47BA],gnm);end;local Xhx,PeH,Esl={},{},{};PeH.n=0;local ylc=0;if Jol then local VeR,Xd4,Tsu,QnW=1,Eth.PvlVi,j[0x1B20] or 0,Jol.n or #Jol;for Ujl=1,QnW do local swn=Jol[Ujl];Xhx[(Xd4)(Eth,Ujl - 1)]=swn;if Ujl > Tsu then PeH[VeR]=swn;VeR=VeR + 1;end;end;PeH.n=VeR - 1;if QnW > 0 then ylc=QnW - 1;end;end;local hcD={[0x49D0]=Xhx,[0x6435]=Esl,[0x540]=j[0x47BA],[0x3E9C]=(0x3F165C - 0x49093) + 1,[157]=0x3F165C,[0x4140]=0x49093,[0x4AB1]=ylc,[0x136E]=PeH,[0x2AEC]=Eth.uy,[0x40A0]=j[0x47BB],[0x1363]=j,[0x64D8]={},[0x7ED2]=0};return (Eth.ynu)(Eth,hcD,j[0x1B10]);end),["D"]=(function(Cju,bpX)return bpX[0xDF3] or 0x2DE1;end),["oyxrb"]=(function(EE,qq,Gde)local mcW,kbS,eom,tof=EE.VoQFv,EE.ynu,EE.YgL,(EE.xSW.table and EE.xSW.table.unpack) or EE.xSW.unpack;if not tof then tof=(function(Zdn,Isf,GuS)Isf=Isf or 1;GuS=GuS or #Zdn;if Isf > GuS then return;end;return Zdn[Isf],tof(Zdn,Isf + 1,GuS);end);end;local x,tt,v,A=(((((Gde[1] or {})[2] or {})))[0x73CC] or 0),(((((Gde[1] or {})[1] or {})))[0x73CC] or 0),(((Gde[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Gde[7];if type(A) ~= "number" then A=(EE.uJyT)(EE,A or "",1) or -1;Gde[7]=A;end;local aaz=eom(EE,qq,v);local gij=EE.qPCl and EE.qPCl[aaz];if not gij and tt >= 0 and tt <= 3 and x >= 0 and x <= 3 then local DD,kix=qq[0x49D0],qq[0x64D8];local function Nvt(xnp,uwl)DD[xnp]=uwl;local Hvo=kix and kix[xnp];if Hvo then Hvo[1]=uwl;end;end;if x == 0 then if tt == 0 then aaz();elseif tt == 1 then aaz(DD[v + 1]);elseif tt == 2 then aaz(DD[v + 1],DD[v + 2]);else aaz(DD[v + 1],DD[v + 2],DD[v + 3]);end;qq[0x4AB1]=v - 1;return;end;local Mvd,Fvl,Wvu;if tt == 0 then Mvd,Fvl,Wvu=aaz();elseif tt == 1 then Mvd,Fvl,Wvu=aaz(DD[v + 1]);elseif tt == 2 then Mvd,Fvl,Wvu=aaz(DD[v + 1],DD[v + 2]);else Mvd,Fvl,Wvu=aaz(DD[v + 1],DD[v + 2],DD[v + 3]);end;Nvt(v,Mvd);if x >= 2 then Nvt(v + 1,Fvl);end;if x >= 3 then Nvt(v + 2,Wvu);end;qq[0x4AB1]=v + x - 1;return;end;local udp,U={},0;if tt < 0 then if A < 0 then A=0;end;for fxA=1,A do U=U + 1;udp[U]=eom(EE,qq,v + fxA);end;local tfl=qq[0x4AB1] or (v + A);for WkH=v + A + 1,tfl do U=U + 1;udp[U]=eom(EE,qq,WkH);end;else for wxO=1,tt do U=U + 1;udp[U]=eom(EE,qq,v + wxO);end;end;local function klp(...)local pwy=select("#",...);local pgb={["n"]=pwy};for Oj2=1,pwy do pgb[Oj2]=select(Oj2,...);end;return pgb;end;local stC;if gij then local auF,si9=gij(udp,U);stC=klp(kbS(EE,auF,si9));else stC=klp(aaz(tof(udp,1,U)));end;if x < 0 then for Ij3=1,stC.n do mcW(EE,qq,v + Ij3 - 1,stC[Ij3]);end;qq[0x4AB1]=v + stC.n - 1;elseif x > 0 then for Nj4=1,x do mcW(EE,qq,v + Nj4 - 1,stC[Nj4]);end;qq[0x4AB1]=v + x - 1;else qq[0x4AB1]=v - 1;end;end),["uvxQ"]=(function(Pjy,vwp,Yvc)local bwv,xiE,yxI,vgg=vwp[0x49D0],vwp[0x64D8],(((Yvc[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Yvc[1];local pxN,vxS=vgg[1],vgg[2];do local _nb,gwb=yxI,bwv[(pxN[0x73CC] or 0)] - (vxS[0x73CC] or 0);bwv[_nb]=gwb;local Pvm=xiE and xiE[_nb];if Pvm then Pvm[1]=gwb;end;end;end),["vH"]=(function(tnG,kt1)if kt1 == nil or kt1 == "" then return kt1 or "";end;local JqN=tnG.xSW;local XqS,gcQ=JqN.string.sub,"SYGVWlVUJh6gMU";local ziT=#gcQ;if #kt1 <= ziT or XqS(kt1,1,ziT) ~= gcQ then return kt1;end;local paM,YkR=(tnG.BdvHJ)(tnG,kt1,ziT + 1);local iaE;iaE,YkR=(tnG.M)(tnG,kt1,YkR);if not paM or iaE == nil or YkR ~= (#kt1 + 1) then return kt1;end;local afu=(tnG.g)(tnG,paM,iaE);return afu or kt1;end),["kBi"]=(function(Vjp,Vvf)local ggq=Vvf[1];return (type(ggq) == "table" and ggq[1]) or {};end),["NvS"]=(function(Bvw,TbM,qt2,kwg)local ouW=TbM[0x6435];local anK=ouW and ouW[qt2];if not anK then anK={nil,qt2,nil,false};if ouW then ouW[qt2]=anK;end;end;anK[1]=kwg;local Lsg=anK[3];if Lsg and anK[4] then Lsg[(Bvw.PvlVi)(Bvw,anK[2])]=kwg;end;end),["KWl"]=(function(Bjv,Rh8,Gvy)if not Rh8[0x49D0][(((Gvy[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD] then do local iuY=(((((Gvy[1] or {})[1] or {})))[0x73CC] or 0);local kcJ=(Rh8[157] or 0x3F165C) - (Rh8[0x4140] or 0x49093);Rh8[0x3E9C]=kcJ + iuY;end;end;end),["xc"]=(function(nuP,suV,cdv)local PkD=nuP.YgL;local _iA,ohA,Kvp,mdb=cdv[7],(((((cdv[1] or {})[1] or {})))[0x73CC] or 0),suV[0x49D0][(((cdv[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD],(((((cdv[1] or {})[2] or {})))[0x73CC] or 0);if type(_iA) ~= "number" then _iA=(nuP.M)(nuP,_iA or "",1) or 0;cdv[7]=_iA;end;if _iA ~= 0 then mdb=suV[0x4AB1] or (ohA - 1);end;local sob=0;for VkL=ohA,mdb do sob=sob + 1;Kvp[sob]=PkD(nuP,suV,VkL);end;end),["" .. "z"]=(function(i,vaF,Sej)local od9=bit32;Sej=Sej or (_ENV or (getfenv and getfenv()) or _G);local ti4=Sej.setmetatable or setmetatable;i.j=nil;i.xSW=Sej;i.Y={};i.ZcI={};i.Twbtx={};i.uy={};i.qPCl=ti4 and ti4({},{["__mode"]="k"}) or {};i.vw={};i.ciiT=0;i.Mes={};local h7,QtA=true,i.uy;if h7 then QtA._G=QtA;QtA.limitedstack=true;if ti4 then ti4(QtA,{["__index"]=Sej,["__metatable"]={}});end;end;local ihO,nhI=Sej.setfenv or setfenv,Sej.getfenv or getfenv;local function Cad(qwk)if type(qwk) ~= "number" then error("bad argument #1 to 'getfenv' (number expected)",3);end;local Usk=i.vw;local jwq=Usk[#Usk - qwk + 1];if not jwq then error("invalid stack level",3);end;return jwq;end;local function hog(Qvv)local qlv=i.qPCl and i.qPCl[Qvv];if qlv then return qlv(i.Mes);end;return nil;end;if h7 then QtA.getfenv=(function(jt3)if jt3 == nil then jt3=1;end;local Csq=type(jt3);if Csq == "number" then if jt3 == 0 then return i.uy;end;return Cad(jt3)[0x2AEC];elseif Csq == "function" then local Msj=hog(jt3);if Msj ~= nil then return Msj;end;if nhI then return nhI(jt3);end;end;error("invalid argument to getfenv",2);end);QtA.setfenv=(function(AiN,baW)baW=baW or i.uy;local Fsx=type(AiN);if Fsx == "number" then if AiN == 0 then i.uy=baW;return nil;end;local Eng=Cad(AiN);Eng[0x2AEC]=baW;local Otl=Eng[0x46E0];local jlb=Otl and i.qPCl and i.qPCl[Otl];if jlb then jlb(i.Mes,baW);end;return Otl;elseif Fsx == "function" then local xlg=i.qPCl and i.qPCl[AiN];if xlg then xlg(i.Mes,baW);return AiN;end;end;error("cannot change environment",2);end);end;local OiS=Sej.loadstring or Sej.load;if h7 and OiS then QtA.loadstring=(function(Jvb,qcX)local fdg,ZqH=OiS(Jvb,qcX);if type(fdg) == "function" and ihO then ihO(fdg,i.uy);end;return fdg,ZqH;end);QtA.load=QtA.loadstring;end;local gaY,IiH,BkU="A_zXNL]?owtgEc:u5lf+3m%qK|aR6*0J<,OiCZj928!;xF\"Db)Vn[y`SH^d(YrPQThB~M.IG#4@>U7e&$vpsW/={1}k",{},Sej.string.byte;for Hj6=1,#gaY do IiH[BkU(gaY,Hj6)]=Hj6 - 1;end;i.zLalg=IiH;local Wsz=od9 or Sej["bit32"] or ((function()local function GkC(mqK,fqQ)local Gjb,Kjg=0,1;for izd=1,32 do if mqK % 2 == 1 and fqQ % 2 == 1 then Gjb=Gjb + Kjg;end;mqK,fqQ,Kjg=(mqK - mqK % 2) / 2,(fqQ - fqQ % 2) / 2,Kjg * 2;end;return Gjb;end;local function eqR(wqJ,yqX)local Qjk,Jjq=0,1;for nzl=1,32 do if wqJ % 2 == 1 or yqX % 2 == 1 then Qjk=Qjk + Jjq;end;wqJ,yqX,Jjq=(wqJ - wqJ % 2) / 2,(yqX - yqX % 2) / 2,Jjq * 2;end;return Qjk;end;local function KkM(pqZ,vq0)local Xjj,Zjx=0,1;for szu=1,32 do if pqZ % 2 ~= vq0 % 2 then Xjj=Xjj + Zjx;end;pqZ,vq0,Zjx=(pqZ - pqZ % 2) / 2,(vq0 - vq0 % 2) / 2,Zjx * 2;end;return Xjj;end;local function Xvg(jxU,Rj7)if Rj7 >= 32 then return 0;end;return (jxU % 0x100000000) * (2 ^ Rj7) % 0x100000000;end;local function Zvk(xxC,Dj8)if Dj8 >= 32 then return 0;end;return i.xSW.math.floor((xxC % 0x100000000) / (2 ^ Dj8));end;local function QkF(zxM)return 0xFFFFFFFF - zxM % 0x100000000;end;return {["bxor"]=KkM,["band"]=GkC,["bor"]=eqR,["bnot"]=QkF,["lshift"]=Xvg,["rshift"]=Zvk};end))();i.CWU=Wsz;i.f=i.f or (i.d)(i);i.d=nil;i.r=vaF;local Ys_=i.jVYRx;if Ys_ then local ofc,Oyb=type(vaF) == "string" and #vaF or 0,type(i.KahX) == "string" and #i.KahX or 0;Ys_(true,(Oyb * 33 + ofc * 17 + 0xA4FE) % 0x7FFFFFFF);end;if i.KahX ~= nil and not i.nyec then i.nyec=(i.hh)(i,i.KahX,0);end;local qs5,ifm=Sej.error or error,(Sej.table and Sej.table.unpack) or Sej.unpack or unpack;local function nff(...)return {["n"]=select("#",...),...};end;local zlk,js6=false,i.nyec;local function wdk(_xF,ExW,TxY,JkW)if zlk then error("",0);end;zlk=true;local xwj=i.jVYRx;if xwj then xwj(false,_xF,ExW,TxY,JkW);end;i.gN=nil;end;local Iyg={[0x1978]=(function()local AbF=i.gN;i.gN=nil;return AbF;end),[0x36A1]=(function(AxP,OxV,IxB,XkY)wdk(AxP,OxV,IxB,XkY);return nff((i.KOky)(i,vaF,Sej));end),[0x5E57]=(function(NxG,SxK,HxQ,ZkP)wdk(NxG,SxK,HxQ,ZkP);return nff((i.n)(i,vaF,0));end)};local xs7=Sej.pcall or pcall;if type(xs7) ~= "function" then xs7=pcall;end;local jcZ,e0=xs7((function()return (i.pl)(i,js6,nff(i,vaF,Sej,false,Wsz,Iyg));end));i.gN=nil;local rok=i.vw;if rok then for RxJ=1,#rok do rok[RxJ]=nil;end;end;i.r=nil;i.HyeX=nil;i.YrqrO=nil;i.ciiT=nil;i.gN=nil;i.jVYRx=nil;i.wH=nil;i.JVQ=nil;i.B=nil;i.bmZJg=nil;if not jcZ or type(e0) ~= "table" then qs5("runtime error",0);end;if e0[1] ~= true then local t1=e0[2];if type(t1) ~= "string" or t1 == "" then t1="runtime error";end;qs5(t1,0);end;local ydq=e0[2];if type(ydq) ~= "table" then qs5("runtime error",0);end;return ifm(ydq,1,ydq.n or 0);end),["JtF"]=(function(tj_,_wz,evq)local DxX,Ew_,NiR,qgx=(((evq[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,_wz[0x49D0],_wz[0x64D8],evq[1];local LxZ,Ux0=qgx[1],qgx[2];do local Anq,TwE=DxX,Ew_[(LxZ[0x73CC] or 0)] + (Ux0[0x73CC] or 0);Ew_[Anq]=TwE;local tvj=NiR and NiR[Anq];if tvj then tvj[1]=TwE;end;end;end),["Hye" .. "X"]="KRI\\I_MVH^PYK^IWER%G|njrECAurH:v+RQO5QwmMj0FtID~Dl@*NF_AqgkjtzsKTN>d]HXJ`7,w0]t:_AOk{,7}_#bL4C^[)exZf!/,jcNU<O(%lIa4:(L]Wu|V%5m<$1}\"RAz]rwZg`!kh)(Bo2*O9)lN)jg\"`i93MCgXJ\"DX>63U+>z9XX?;9Nk4AVqNW|r&RJFaNAABFi!GimVB4r?=?Z&[M;4,wtz,|zFUATgQ~rD54ok$z/gySKu,Dnx6hK^2d?Z5d?G?{/XO_x6Jn[g^<B:D4Bu5_SX;uBVzAsA_t=\"e@ulg<Sh9B=[l1FMPAhX+uUzN/f}$AIAtzdK^FZw4[1RW7Cs8=93V(!yNsB%rJuCTN+<J=*&5_niAA~L^_.,hTG_r6v%x4gte[Fp^J?+D~:6YkhE2p5`gb^sl6;jw4Ez|HqF]fsuiB`J[!&?SL!B)*;k.#7cQ&=Xn5_FX_S_v$86%#?(`LvNLab~|FcLpkItW&6n_?hKjBXA;oAA8_DAmlb53P0BT2/@^avECp$Edz1nq_*JAATLq_AINOz,svY=(c`3*H1)d9;C1;LAVf22V~C[]THJ7joi:zIix;hM}_^q3SB9wr2(IvwOVn5l]Al_?,[N)j>8WXj55yh#dnAyIu]OAAOzjdqg.4:nKe+}*.(w/LlJ{43l&?jxzkm_s.aVgB56r<KzMUAAEO2bAK_HVC>>%{>T/R8\"^,A.O].u<NXG>zak>z#zC.c6owe]^L=eNA^z((Z_.cX#f5]Ar8^.JOIKKYT*?.xx8@{,HK}\"Dt\"%rkSJjP[v5h)1gT]s>1w_jOAArL:z;&hT8FGe2zDyt[Nk<F4L6MZfQC<FRN)sZw?BE1m0h^0@C;n@PD_OjPLs{&2|<?T$B`$8@HnzbH?+(ZAEsE>:ECS[E)#b|Nl\"\"5fEi[ZXnk!CQI?A6E`0F92f*Ij_}\"gtzkfF@9rwAb?Ktg!{$I8!)&JcdNT,/_ZX2^F|nUJ`{<srFMqA*XbH)uqE#<tHElvJUPD+0Y5PJzCWRg+_*4S&1v.h4nX#MH\"zl&wT(ZT3eNcZ8+1Y%(UOQ=s>>0aNV~;k[q@po.hipi+@mQmh_AJ?unD%QR@pY~kRsLfe~SLA9?b<29P0q/,[FMytIe`FAX8.jN3_I0ylHg`6Y[G;rE||hq{N_FqF~N1A4w8jOoLEuG{Zm:rWdzKH*H:?Gg]L8vFro$iV^YgOIe^%cl77JM1;6o@#hWc(~!O6jzCW@,q_keL?AG(?UaE{&P=Xga_F?_Wf!z^&.HcjgEN48RqgaF\"NEMY?aJt<O5wQ}mdV0HF]5#y>NS7Vrea34gcNqgY~iLq&D!,*oR[yBN|qnCi4LAu_6a<+\"Qdh87ExMYli^98XKH>,E_?&h=l+uI_@exGW5]LLP3z+gAH2Pj,Fmv=pS<(\"vHFM@Xqg0FREat&,MoQq:zqg0F6N@kox1MMiUrImmJ&6iAp!1HDgVw(7z+_f?U:_c4YL~L2~j7g{0F+*V1q`c)4JUtlk)L_Flzc<Q~ANMMY`wGzD81kO~hR2M={Y<K\"W:)Kkqew$POn=2oX8_Ai_e<|LoO4W\"DJ7+k\"32n*4D5tQc}g:i&mV}WnfI?9HAnau&.VHW;6GK:y>)ybu/~AE0+TN}9=Tkp4eiZbvxzV%sIaMmhtAe]Xqf4W^57b{FMYtW5%N22\"K{B$)JDSmQ[=C*fjAgD5$jAN9*>?(0@P[/#mqqAj0lroMsMkh.IAuehpmhq<|0DL|\"%Fk%O7)R]u{uRWw4bb{t:<Ok_!Hd+dZb1R#(;gCN9XA<5`02HP\"ev)ZDIs>0O>ND~d~Zzi&c_x=w;8S<.np<Rb!F`s`B%dfQ9^c6YFp.ICn/a.fewNCE/0A!O0]Ek%\"RLp.(\"u*[P(fLAml/vfkVVe7a6T5{Q:PQAafWrG_&3<&(_HJw7j_IAD=9q:9V47osdQzVC68wPxIT$cAywq(Kg&s,l4YSqM?\"%6F*NCM*)SWk7j`&{5@{_]zI:%!zF3_N\"W!E&I4n(A3y2*{st\"WfM+x80+^dqVXAAr~4L7lX?E50&\"wAAU,y]q;OLpJ&=\"*sC@gHNKHY%]t0fVJIq>8l+0{<_WrW)Zw)fuPBcRA,m/v#,i{tq](a[.u.rAArz**UmDN$8>{O!X0|uaxU\"7TXzCWWrlzk~!(SAhZ>gJAIz<x0]iDlszEHrDn{V#gEwdH2T(Z/y!c#h8^5thf.Vavs7z@G,c^mV;PD5?n.laZooJOx?>L2+dZ<5$5m9ndJ+XAN5J]]p$OP*;0:x`j#,mAdLh|_c(LW#g/]ABakf;g^g0J[W\"zG#D~|A,X7hd1:;dph0e,coc(KAHKT+6Dfk]<q9L/~!dH#8+tBN[D66>NPq;%.j3TXdwA::[NrVOkS?^x%Cj1D!}\":_iugugF2a@xYOCDSfD~Fk(FxM*V]sj;!%Bs=/k@:Nb.bJ<okp:6s_Ao;U@~pjL}NAtNQgJf0;[mBN(1G|;mBqxzV%{jZ_#kD~gi{`QN!;zk[k5Lm_.s{(j!mTw.pdkpg)Hi8|rAlryC*\"#s^LHwYN&iYQh+=_s(N],n&B1SqKBDFMDzKH6F.%6N($\"hAzk4[>21]Ahw$<uFU7:$D&=zpg6kDDKr|QnGXA0tF^c6WW[*|#<ufNkm7yr1b%YkOt1Ak(s/)Gm_H|)H/ZO6Qz*|U,0_I%>o\"iI&{>>s^^u$g9e0_AZLF)u4P&+xa`4H>N.,r%5zHHe_UsQ10A4%<&PgB%nQdZ)hwr`=RIpNtJS\"2d5J>#d_oWHl>+6Fza^FESRpaSuj+<hh%Z%]A`|NsF|@bY^oEmyxI6El/rBk`9y49KuVt=>k`!F4}*t{|D@A+?rwyolZ=vTMY2E=?/gN]7*O\"wU%[fYZKb}8rg+_MQg&d=EwU!uX^R|Pmi)@78ko5l=?dV*g+_*4v7!=>K)^<qJ&JL[WHQYZC[=YYj<&OX!oj_gQHB%[D8^NqNSt_Fq_?l._iVi3y?$OQ;D_[O:4bIWYr}g6Xha,/@@pcABt21v5k@!#[d@\">o~*_AJ_bV0|LCCUXiQ!.Q2gt0ZD$\"S~F4[C}A97EAU<5>sCU:#EoMDNDtP%Hu2Mh~DIy3WhkozFBw>L5XAK)PQLx1E;>p(9Pzd%lw>fuwIC`LztY)sfR;XAM_?GA+?`i0o0/+%D55_Fxkb:G~Kr^2=Z,][%4(I],Dsb_6y+~<@3U,n&d|;fl:LFA_Az|K&[u7To^B{Gvi]A5<L,4H%WAK?MDsg=]z9vaQA58o+wNWU,c4KI$mS(Zf^}LAcz3oHlfiTm*)LTlHZ{v}YNzRzkykaLNMW4!yzz1P/V}_i9UePobPf%@C.viXn9%%L5oUh_sqWruzr7$WLn1Iyqi%qgRFf;Z4JFe7%:`(Z&5|]$Immf2|yz)*s58AY~YWq_^~3`>f6EtYn5ME2D~)AA6F%Lpk)J*PxZL?gr3gp?bz,7~GtF*xyyNF%_:M5$$_AmzDgiNxoAkNlmn%El]|26g*wlpFFM6A?L.4Z_VIuDK>_FYkf?)F(#mFGU~!vLZzE6U,ULkbN:Q_$=V[kf1N,7UD+A$V7T0AYU`v]\"ppBz.f@}aO`Nc4Y%TfNCJwT6;)T>[|G,dJj.]P_A`t.)>z@BoLAJD~IoJg(ZH#N{6Ne)AAQk$%oH#xBPZq]6].9>%AptZ)>ztabNL3_FC_:M*^91/|%myi$#?ASL8c^@w3?;YJ4p%,XlBA+]^J>S%NmRZwc&JOF]UTTO:F<^%D*v8&uozOpf(Zii(`6Sg*mGdC;GtALXGXkZrdCD$?D~Ck=|^L2}p_Ag7.6,qDjOs&ZDh6KfJ)~|3`>aUHV?10I_)a>@/v#TTYg|~OUWXARXNEPVta}u#6Y<3B`y;X=0:66Xj%z_400muaUMrWKo8I1U>fr8mL@|FoK&}qqzylhTEzp=.Ug[>Cr%E?^XfuUm:AY6PjG%)rbsd|g|`yB\"]F%#ZwR#8@_^S){GmqiA_*nSQ~:p_.vha.wA\":Bdh~ODI:0b0{8g:DyM,Anur}Jg*bthS7`\"tAG?sGZ912I|Jw=KP4Y9]!\"86,SkRA+iZ)cALuJQ4!?C~LgNKW/lYf>RMWiJ^28m_Cdl}j43!nI&_VTDxqXzqcyC9m9.nVTsV}yol?_AX_%NjhC3wu=>edGL93%AL,~?wkWM~Q6(&KuItD\"4*A15}.n%kz{Z#u6D=R\"%VkMN]\"XQid(*M0SJ/U3WACOFi9(%ig|)+^x5uKYZpiEMZ_fE+!7}rCa_|Qsx8wD*zk%_eb1KKh(?>N8oXF%_>lWN+[)d0]0S3UGTP8^h1EG,]_i9]M6u^L^AsT#r/^<dNCc7Co{J31I^f;.#]{_!|C!SoagM4O389XI\")l/}[waxzkq_V5zcYf,xV}C~!H>osyAA6_RL{Pemzw6\"%y0xZddA78`Pq&xyTZ\"qq&AH+~W!dW1_vr7euz.XZX&?<%AA<_!COcbW^;rim4Nr?CD7EU3AXg#HKgFh8c\"lTMc;.,<F;FBO#s`fNN*Xtg]Mq(x5GEUjZ4Cgx6,MeCRn^^kji&x_zE_<\"&S3ulO3v2@w*{DXh*,PMj|:=D5oG7_rC9r^D)`F]cPZg[Gpha(a&NWuj\"s(KJT|ZX[|DNxw(Ds(EJZkGvUT/C,iPnC^lieeEA8X*)G,^QI_3t#Hw_i9^~f]U2SjSAsLtNQ+>e(o9wLPl+9E{gj7!\"@WoJRkK03+h)}9o`J7F5JOJAp_h_:w00RW<wo`Xk=A)@c|Dgp[v(.S67~wO?Gl93@A5<|ZzOUdulu%dbJ!B_,7(LVkx\"{Kp~s;K%%(umuYR3Z4A_0I>eLXIK@dUIWVgL0I6gm_AOv,kwQ)G6y&xjvC3(Iz4/srF_R;]r56+:TFs{pEI,axc?2p;C:f&?)SAA?_Yt1Ni<=ZX$]X@J+1[=R~nwJOEA;z*Zj]wwq,|&:AqK^Z6P;gjI~8G75Bb\"X+Z6vN.,6H!+/,xUBhmJ{$\"W%OE_IeG%X\"QgzYX=nEz1@&0b0:0UVXZX)@[x!F2vS#3U:I5XdPt?N:]jHbrQ9Qg]DSQ]+A!fN3nPq(>ls8;z\"n3}n)@]{~jNg_V@Bao\"N}Z=8.\"I%77i<K{[Jj?Ax3GRV~j:Z$Xy{/Omt`B)s>(MEAlX\"ezlS{e%Kv]C,h?9Hr3quPTcIe4,Kl_l:?)nh%agP^zMv*FA+u}Lyk(&e;DDo<PE[FV/(1#?B_)Jr,j_<!{NTr#$v+}A\"G7Aj&LH9u:P!LIe@,_fll7TzC*u:k%@YXBujp%\"+@YLa!+:Xn;g<Zzdf.=^?o<}JA0jL,dk4S%{u`lHj#/d*NxnnaCc?_IeS;PM]HbNoW3|qFSme[SL>NB_6xcw[%v$cX8qsFCFCWH]rWhwE66HKuS96luQhI8.=Jl[,N_tXk9k.QEMJ>&=^+Cv^U(u\"%*H2uFgOInPbqfFo7:Z(+QCYAL,+!=_}#jU.2ak\"H9tV0,&pc<I+N;_51Dh\"S2ueOlejFrof<OFRTBko;[wDZ/gOz(q[LD~JF+B$A2ab{S)O^.6hx,tO[_FLd;qv:g$w#N||tMCs?0OX_<,{\"b\"JRWuVN<:}gurhqF+_FqFI%Di^:^G<dSI=Uyh]AWoc|U+3A%CP*!&GToQZKhErW]zf!0HB:ngWZ6*5f2[{z2~D}uNP%o,gAWC;&q^w#dcAvIY`ntivdF@m<<fJztz0|}D|!|m*$H=&psFuiRc,)^D8DvtD~DkI[~qCkJ9=9O@Khh/G@;2Tyr;NF`kP9*,jJy2P/[\"E!ce6gg2iN8zMCPjJ&T/Z9[Xlv;O90x)(;3DpArwW[[9eIFp)v&8&Ur,sS3,Xf\"NrC_F%_1t%N_&V#kpei$ierk|F1<f_aA<rHATF|Ya;d)|3B+@!IUAYU1>\"zU~\"<j/EqcI7YoD|UCZY9/LD~7eC]#pgl.dozBYb9J&uXCWr%768F^K)DkCt2d.~#OwW!zkIA;Uj\"=6|o9L>l1KTN.Tzk9k,6T<?cBzs4$y=/wtR)}_za{0SD]F}8yS.]%nF.,,@9+5RA/,3Muq6qS,tY;0&DMOIH9/G>=lTNlrhTWDl6s9ZmsU$!QNw9Wia>D~JF!!r}sVmDX)IZ57u_aO[nAW[o2zqgZ9GX}5B&MKy!,f]sF#21_AB]\"ID95o6^H8)|j8Bz9Ie8rT@N>NzFhACS(D2:7NEMBpgF/AqR8cv=dJI=lA@z%jeLOa_.!paONAY_R()XumboH*%QUUJAhLvFV:`e;kS%y.&XPgKbQLPqB$gZl{~j{{^.rC~L:EEB8.@f)ctm6$LrBH:MrOVYD}o%<Z?!tfqNR\"nqVCTNnAtLySo]ee)+c9gNw)=;bM6zPO29&#b7aq}G\"rIZEYChGap9:=Jz_=tX!TJ/m(%X0CwLL;()C`wZdy_BEa0Gxi$Gu.w05KGDD^:WS_s4f6^ksp1#*}t4bd0^.9F1{(jIFSTU$@tgY[2AX4|O|JCRD!VU<!h,IW+0%b5S]}he~rs}Em+q@YPov1[4cwNb[UyRz1^j4QaJo*f(l@0cwHSo_L36CGwR+$1,GeWfBW5q({8eVEQlo)XU4piEEcXfeGbS_)Vo&99F]@k~W/A5FWh\"7jX#NbZlSwm@MWFb,{_Y]7`]=/|!+b:#!\"~9@}AlZ95zjb{}..[RQL3{[]A6cDcz7:v?6$^?~*FO3?veH_|;e(]<z:rw)Xs%HfQj*IEB<K$a}A:)<4F|EVa|Z\"Fo7[:Vwq/2<PIEKe}Wyq9NyH!/RP8gWh)}JEBX{&i5U+Di{7o25E^)s`kw`AAFsYqW%&;;Mf:U(UG!z\"vFcf(wNFK>##bE<z9&lTaZ$gT},a?Ef/!Qlv`gQJ/6[iMI;qIW7!HCzH3n%ao>>@EBd##Q&BeE/z2ts>{|CsQlmy$T3R!y!hm8]xpj)6xv8NLgIzZq?TZR3maS4.vViF_$!bOjEC4p0w{iM6`u&tmU2V<~2GW2=|c=h(_NnK:~*};@;nn:F5C>=:Anf0bLAkIe^mIr5!>RMbu*!];?@O(P]KSnF^bBELz2qL*5VgtU\"^u$#>3@8eA=rqTX@c9r]iLu7m.>~6_U_{)<zxZEqj(quSvC(=oBaqy#&S1hV+J7ha@a<#24BYAn[=e(JcAnz*!WGleq6@%_)dnHPJ+K%noCa5oX&33{34l@Kc7!CHCjfNqG0Wqf0G=>c3tvI{5Llxm?]iEGRor5T+P4g=?,Cz+I*ZJBOH3G%BT^S{aj]X\"}5B@zxLuuuN}dVGd#df\"Pg}a@j9X>pC9)3Km&z{muSIEr6I}YO8~DmCd$Z!Ny{h*.h7BI0|,4]9J`H{Vb^Fw\"f:=r$SbtK;$XUw<9#>VM*QAdgYlpnP;Sqoxix6(5Kd656@4E{F^%,DhNP1Bhd;FYxXw|p\"o<5+9IJ2jS69KqI~?4/Iq}GUS$9,.J>nJwH#Y^tg/*\"J;<IJQ}_}NeHzcMoO0bDmK|3bB>_g6!5gha{0>V&>j&bbRE;:=j,wrtAzqSe[OF/i{t(|T;GVl#y*Ol~?cz2;=ylmnYeS5DE?DW)oyp?!(:uq<$77p^:6jmW,?VMqR+(<ib:R7rP)71SlJM.1H~3m?YG},[kCxX~Vyuh/1LXCh;hdO=AMY_6maHBB>^Xae4Ag[f[C>8A@l&w?:r%cF#p6%~Hjv5``!ep8]%,b3*hF(Ja^+}wU.7$L^rE&zPT=};}N??;<`P8RDP*f;;vQEFvOxx>Z\"xe;bMR\"&{!g[.d]1Iw:p&k>bvu)r>qC.+=zhoW`:03Hs@XHTY&V@{*!03Mpn6o=oE\"yaaL8Qt=*cLzU?>BlxKjRYKM]HzKORNRd>0(x}j;j=}kIpgM37$3Ejn*(dsIY/cvFAaD}^wQ96vox(7]\"Y0&V`z5?olv4]`S8#Xc)Q?a>&dv(s!R_Vd51TyCYXu][O`I8ME1e^{!;xZew35feBZpie,;jjN_,DKD2%P3q@8*lM[q@Pc*V#X;o*J}^rav0R2x8Ux=Bn)L@7cdRr\"|l_t5YS*sUt}G87}9J>F8]5Z\"O`]>y;;yROc{J,!XQphWV,I75c+~WfxHdST_XUz:zpKdsq\"[8cuAYdj~D1SA$}pz+7fwmEfo]e8Fj7CBkzzU8~L>+MHeRxzX_._$ga04t#Y^/<2Kv}zR/a.c+R7KN=zPDt_mIq>A>1T9V}40N055+%`q{5>tXvy[gd*\"1kOB8(L29+:7H|?[#~%@DdcM@])N=7LePz0E^.64\"JZbVZgE6~Kc#pATeiV~+id!@rllNsR5))[r%?Q>s9UjI_,Cq5;5S=`SC4W^9Cf9^GwjIG0neUd&fE]n$uyWg>91qs047.Rqv&dgdp=4@KKo<\"Iau!9,C%Xx:#F*ET{(O!ZC3:Zt3fw%zri^.{:0HGcTF!{$#k!3[<EjIuj=S,O+g%}U*kl&qympe\";aw6@oxw2|LUfO{iZQ6Y#g69R9Ni2=dWPU]K>\"S6C,yp^4Ml\"BR6X%]N(=^<5`j%Q`$eTOd6pI8`Pmtzb2O>Fyt}L<f7CK)8q:K#@~MMzARb>E/xlhmB#?_u/]WW{f.J5%|E&>xIP$Wx=G,S~$pu$+:ta=}#Aj]p?.S3(w9&2$(i4/MHJ}xLo18IwVw:+X~:kVX;x,=z?pT;w)n#m<WexNSr\"|/%DHS6`c>]3fpPOl7@_u/Z%@nPkj)EB!y?]4}*Q#Om@jPR05g%|M`95#`&(UG$R2/q`;I=`?DiO;L]!P,rm/QoQS)OyUhy|6)]o7s8%1[*1G]Or]okMR`]s!;,zF\"%;]Ry3?PUAQEu03Q#E7l_y}8SO~MB}=r=/,&OADy,@Ti.qy8J.k\"l.d:/C4>Bduqe#EJu+C``mSByIjTtcym\"t.LA;~5JH8;N:ILz;{x*zTqaZjW&&=)f14:\"LQLkzBqY7io1MTKsO_fH.I.Fw2Y$O&]*pBKe$TAXu\"`S|i,UBu4#xr*q!V^/m|&};lewGQM<0m(/NKHUHjh}\"w}X&*^:wndML;VLMb!eO,Yu2gD6I?3`&/htC_rug$ZwAM/w9<~~;VUqL9:$Ke(zIuDBdG2Vz^xb+kb&GaPb\"?PNUt.jQ4xg(BQd=MSN5_;c?3XC>*J+1z$f_$Im8v.k$/@=q@~C8?*s1#5tH`8KZs/SiN,r[gC,w@rU]JY$C&DLKlB7LNw5N^h3baa*>$SGqEVV+Vbr5f%2i[0v}0R@|+pMxPQMq(;E,zn5MCzUNF=FU;{[NZhgpH#bt*P)~nbuT#eBT<o1d2(:+T]aW9LX#j7%yEMnpC):M\"){!s`vD>Z$5t+r:=XQTILcV$c3\"l?X1^EUtt|MPQc?f>,1T9Sw>fRc<0TeCpD1]K8stey+^}eWDCwW0GX+Q#6Z(PIBeu`;SJv+={9G{53NBLLZ{+e!@n>UY6c/O5)7AJ4iY9*(I/ijht^3)^B<{zH{duh+*]cOQI}{#kzMCJi\"$}ZPL)y<BkCh$j26]Z*U4|@e]40AT}TYD<kmQ}GF&pZz$*(7!WjCaEsHF\"`F8;Z~~8%6bQXPerZ8f0wYtQ4WfDn/Z;WN5#{4Wp{akfG^u:RK&Pa$D?`Jr,AH;gaE|YU1,>h]d0/EL*rYb7f0ZW{ypqKw4BTG50%NF]5B+Gv/qqodZx?=<pOSt#~s^MXs`(.l/,~bu,iHp=B?7}n~[%]PNOLnb;Ab8Why};&u<<F(5]Z5rwomQb9U{q(G0ZN)9pdjVp\"6Ol~}tGX?g<ji4I*~24fMA{y4[Z@:<,Tu%P`er]$uZhH,PsAXy{e?,!L:,F*j+No|rFNv8fc32b$rJ$^0K|z`r_YK2$Gk6faxo2iUCvmJP$z).So}B1O0j~qL]f==~YAL=mtBP<!zU4yBH}g~6|+?FSVI\"I}r4lu6kub!oI.*uFOVRDU)Tu_4J#Sv!TwSpX?`uz)Z]mYiyuiR5KYf@Zf*Cog%[c:DWGM<a{3bGXisCF7Pzl~F,$.=GNowH=PNBnI!i5^Pxi<:X56LrdBbMsD$`:ey>[lPswj(9p1$LBx&,XRd>=M.YC;XD{8JG0z[~_L^a~wzm&33EtSO9h@3D76cH7^/aY1m_G$L5x(b00*tB+X``)mwD;svdAxWRE.(!!>z.#WrqNR`Ewc=8OcRU6%bw.)}M_$Iq!)T0D7f~DY_c)]]{FU]$k2S!r?,~&=!HZ00D`j!5X:&\"emS`yLV$:BBY0]P;H=NZjjwgJO+/l^zrJ|mu+s}mF|4T55>kT7K?ADt%Mxty2T,w;CWVQ|EOz`]~Xh5P4zMP&TYBo2r!pe?._H$B(CoGfJX{{.TmH/(*6bXo@tbiv^kK(+Gt,$SX~Y$.2{s$7*47ysp+|Eo3qdOY>J|Zf7/(>UXSzDhyHjfTgV;]\"#]LxdGW*pJzg{xv:/OIbu#et,:?.W{^n^wH&2%.U@la>G~|TBTnwEErPR>eBm}z,}+ca}JFk:;u|.!y2l$)?2hqRZIjX3g8^gC.@VUuhoHZ2^e{.2_<+NBfZ.DT4R%{bVB+s=S;&17?YN,L^M}]r[.2Ij;WXN/sdS^OSPRJY=$&#}M{uM;:Y5|pM4jIc_n2YuF6^Yd59[<S%x@+LUA\"~ks_/)&7=w%EU_`|qtOY,0se\"Qw3\"Vc1nTr9won|$RpK6ED<^`/RU^n[Ag$30UC~DF^FEVb<8)|<G&bCnwfs)ZJTSJ#NiHItM\"tF@R}*f/`@gbC3Sq5_HZ$!Biwb<s\"<@*mERl$PPe|FZrU)BwvMp?U,9B`EO5E<0j2s8o@^By`Z1k\"oOt@E>%QJ,L<^@_9KBo&J>v4G[m&1NYk{+tI*H>l7/.I^/1Pu$8AqKXrw/;xW}^[G\"Y`;ArR/Dg7NoM:_Er7W6T1\"rReT,@8np/m$m?S[cpDgmU{I4bw7W1wp5.4ho6dCu\"3F[<0?l\"=CD4M}|>cCyc%<fR%|Z,;D.Zv)tT;S8NHvPD)9B61c0^BjA%UT>8{Nd*^4A1Kiy|:)7`9!k$<Z4pBnuhE7x0GWOnstGxMxjlmlZ4i@oUjZDI7Gaa?mYGT4<o(#5L&pilq/AM}38\"`D)>I>k%.*(\"oJ_+*A<hv}[64pjN+[hA@Q*&CfP<x0*=IOnDa56FC*%^q$\"Y4I=<n%q+`?HNVqN?~Rl>f]/p04k$ug>FDF_#EsJ[.(;4^#nSS5C9)2.GwM,O/`Kk\"HaRAHi#<(>e|U&MMYq!1nw6vtWY~O)`e=<\"Pb8MUmj7$TRehr$!ks=?LXc3}{MXhO@JGANUb&Q46*T\"T\"x)eS]:Ax&u+yYKJN}apfzS1I12v~3r_gad=JcZCMJ}&cWbbtI?9,+F:sO>rmV{v,D53FZbRSxpM7S05u:PITiMqLdbY=1q(K_{.;_LLqG#rAqM@.KILz+SQ/#TO:mM@gkI2>To8CE^),S>ZO<`,rZ{+PS2fLtHPge?|<bq{SBM^f!C<`bzgF&(Wdh+JJ<kp\"hp8r@8_{5y):mMUak&&c91|q23[{@Nj&ypc!~S5LT_^DRg(?UvVxFJ1:xeVYVc0>GUVz3r?N4_G(oUJz}|Toj%F%bFkc*6ziiv^d53n0vmaBk%[F:0AOT.JP8/F2Pfor?R6|5xlNc^K,2{p2~Z~<5MsF~Qk7,(pLU,d[;}VCB+]~>:IE;|8J|%Dy@3ol[~g{AbU0vW><!zaQmF7n(/H2JZ{LRh\"j0O}F;&ZIdZv$/UXe:n:wzGMOzVxYw7L)I*@#KBXdp}OsK&_A8liCQq+Emtk6,E%Gn5F8dp[4~Wfad8SX;%6wIs~vG[B9|`Kg)apq$K`qrx<I=FQU6L?ur?C1<Ko#L;p+kSk9NPy_1*\"YQX0zUHMt`+bcxG!U9(UQe&Yl9J;dh)9)|)=I;jSEj9F_C=u(pM.lCm!0Th}zR@B?XNyCv%HGr/U9yKF\"/DDP<y&g|DD_G(nlWCB\"XU^sYbTIB(d6{f?pM]:DD:&v[h7;f=Dd#+*DM\"3;2(i}(4L9e9b1I^K55f)vqi*v~/`;.n`n)tAoy_0*s#HJ+y(d~SP)1+$DY\"5,Ww%v1(UF_l%GII;(c}[.9lrvHgh,N?N$azm3<oKT7II_8b$[>Rx;bX%Lt@+stdL{B%,pbQb#D{ewQWkN)lt6LLh?=Q_7U3jLC_lQRB&bW@M[0y))_`@R5nDTg%dyJc2*>7Q7no$E[HV6OR@ECi2*?+J&ytmlmr.qva[#MF[@mb$mwzAdQ]`xxw6@|12Tz/J>]TlHLZ_|=[Xag]PJ_+$$w8E?/L{ZZp{BLZzd7GBvteWc|vdQv}UiMj:!EA[L@2tanv4<@|VmLe@=%XK|LkvL#N[F978>Sa~HVtc{J]>X3*nX[*cI*n)LEpXyi88H=m`)94dDHg*l#[\"x<0}$hJ~U2c\"HI(n>`sGemV+<t)BA?f.)n<O<8gaqf=iz(ICy0@#<u@5NkIh9SW,1L%:/>MzeW/7VKk]]{bp%y^.GG5bo$X2zq3eDw.ri>*6{*^Xd3=6y1w{NYdATVBKRV8\"$=Rh+mJ[d8%F:/Gz#:zx6{S@0@Xct9x2%#}x+`eiz:R[O`]`@Ryl8<czY>^,wohxGk7OY$.!*H0|*nzv7MR5+rdCVw80bhNsMy!0XZl[(ioy^.+SV(qmDt4S0JKef6$Dzr=12ia=vir\"ciX+R\"v=X]5|Z{i$5/pq.4m<*)Tx{)%Iv#kJL*4/}UWyCCtpM\"oY;lo`H&jLK94e@2;%6C.BqFn|6e*9(^~8zmSF>7|%Fp:{2W9N=G~{26*]J?t<3J~k}|xh1I[On^\"%4ty_%\"oC4d4(~D.k?Ah%*O}m(p%r?e>Xd*xzTA!naMn%rZu_eguzAUpY2~VVHSb=?r3m5Q)MK7,]LJ|U![mLfeptvU$sC9Sd5y\"1Ka4)d3`k^{=$y}=|1G87`n^L4=<RxTbL<XE8_KzU?s_^}Av=A>bz9oE6xNo]r^XpiU%NEPRO(At6mu^n(E/VN+dVvw\"TsC;@,]lx[J{LG=S}qA5B(F(anjH)QGJhOSnL9M9wJ*%G.@+{Ws$jwo)*k1Muv=%4,t3%r{z|~#YQGT{20rwl!I+PLxpwCyc91Hl1_M<sq;sk6v=_dCilHw|hnj+@|G5fQU0{M\"gi4X>pbXA(@(%1wlg+>r#E../|mc=Lv)~Ho%MsXi+ni)htKT}0`w$Tu{?$tWwN~!)h)q\"e_]%wW/bCQSehG>qv:k+8sS)h*UI^^PcB>6H{9[F?Y.5duZZh^Lp/ysF{>%pLKsM9HSLw|$5<SirYd;7ARHWtzhLejXdNUxz,c~#T*uX^R~NeEG8/.j%uw0$)Hm&`h*uXhEP9Nr:M`?,|jmnl\"sv,*N1Z_nL<M+c1}^[kn`lLH_$d$qno:8!.QQKM}a8,!]_~(yZmww~)c\"RiZ4Y}w1/cG<#1\"d3{G=2^}>]d8C6T~&$(Pu6=CV]A{RX5T0U^}Y8jey7(tlsW9F[qITh{ZCx3eZ!VCr:C_?5M496RJ_O_qjwu9W0#b.>kSTNQ5fnCFNj6qYP:A59:mb=+)E}aWvnd6Fc\"ALKPD[[{6]5:jwG;Ylynh47tm2\"w^\"8ux1%$l(1<*v!f%G5P,d5ghk\"6HVnA$@a_61k2qD7BS;y.;utM/T5Kd3&@m0m7/]!([r_ou%LJsl&/s,UIWSw8wZ#;udNTm8uJPUE`8b8C{H[R)R!v,|,;J8EwR2(~^$IXw/SP*){wJ>ax,H.SKpHQU~H>FsBj,Y[%}fhE`*IP?:XDV.;a(kEHRFSz3}o]pC@)Wo;U/B,,<`^3f~<VIq!Ug}nAT=QC.>8JE4uqxzN]+W/L(d5b~<p,vW<^8aRfUL#9gvBl*Ln,yy2T%qawCK[vVKrJ*6jo0x]=6ISks,^FzPt0]q(c6DU2<{VNV;,`pI,}1dw*}bauJ9i*,eSp9oG{TsE;gtC5Zkx<:mq~:E_P?m31CG0*yMXm[(Sy9YL>?~9%|Ut~WCH!Ko.z``tr$FoWy>Dp/]h8BRvY*w$f00s*WBTGZw*SyoaHELip\"d@Ew>XA`iPYc,=JBy~EK}ZF]ZARa5poUJ[ap=}phf}_!W~)]:Lp^E<dXo`$\"U=.@yOoQi.cx?h0W8cf\"dz$HY9Y0PDafuiWK^PlqfH7i1SH;ihxgOoEai:GpE@&+i8<a?GR^$7|,gjl!3J:8{7nX}7;9y!hlq9SeMh(B!4ue3:>3F9qdO|d>|uDi_t:2>>\"{1vf]3?dAl{zYr*pX{B]<t~j&Su%&QxU#M~X2Yl7>*p9$?Nn+iU~TX5TNY#W=}w(#~T3O]il1i%4T9H0=YS)5z.eZE[10e7)H4b~K>fJZRcrknv=_k\"uImQe)mgC1ry=zwzz@xOcNt,hwS<qq,@9lW#+=sOT$S#/=W7^&dG4xxQ_\"ydYyjW(NIIJGI?rWjoLD.bG8po=^vtK.,_Et6ql.Ad8?B&+sM&cT<S\")yF;B0.%NvC(M;gca<D=)}@rG6zlMzNG,8JA]M|$EV=prPM\"EFe33j}t8oaZ*3jBJd1~@@$x:(jOV?;IZ1HeXo{t^]b=I9REw2&A*EAP?TN$?ar_RvvkEO:>wDlYyd5Y<pc`fNb,qw%*uY97LN{>_@<w?nlC/1Cs^.9[#}GLV9GUJ4DLi%)I1wKZ&^S{ddc7d.ELtyTTRS5aX}R/Zd~7~T{A<Ou%XG@8d5#0SLTK~!qBj2[b8>z!^CP=U)t:=]0+NVC5V)+=\"`Six&eo*[A[23$bF.w)Zz_|.H+[kTe1:[9vlQ?xdJYbkr6Xj_3&:YH?`%=0cXpQCZJAS/vyCR*I9;_:C!?uJePo*egzo_Z^NCO)V|pO!oT=SblIGi57]vw.XkwTGpY%{bH@5tUK]R%\"cfcnvf|ZR.H.eL1`11^2PSi{&~vRUqC@tPZaC%R&VNUfGN`0Odd\"Q/Apn\"F?!4zgKbndi0:`dk:#3EGYuy#>]X,$AQ>dp.\"[%bi(Etme*!aO`(Fm;Zms!pBd<<W|le;mfe0wd+D#q(~Yf#O[K\"4mx<blcOl:6Ni0@bS^m<&{mv}%6Hnz6.L@nl^T6/TYzd;8rL*R3Im5yT*PgBat|c>5cJzTaAw%eB!Q}v(e>#^>N{W~~Zos%\"QoNI_0gM,2Pq]ZRcg#@`YnoFs@f,`;LmB%[2t5M_Q^ZG$0\"Q#v~\"VbZzslHW,SR#6Mc<$$Hi5RFb~FS<20BO=qpY}S14We(E>^Rd]2R!\"v*s,:CzHfsBz<q.tfh|Hcs~M@tt8XMj.pKtaYxGBOD\"ruH=YZ?7G,z#(SNJ#KGMEYU*FavP;vh+J4XVvuP&Ym{\"6*ndQ!D*su70Y{37QBXo|y5OhNNM+sZsMgMR)GXDo<iL*61^vO]UgP,kzf8~f~9&sW;JV_hmN*cwUUbYpA]kwHg>sGqLGDanuXkd3SEM^C+I{blc^e^ic0O$\"M^BTyquFaH[<,EbFfav4LTi]U\"\"&+exz;|j.QWejd3HEbldCMOKK#e8vGaLmf!fc?*Ux}9%JN_=Xg.m]N5O0$UUn`)%}plD{}nv=XB{V.GT|??>bP}>R!~k)Zo6y1?H.Y^qGjVaEa7wK|LodQ4$EM<e`Lu:~cRX7[u)H:y;j+oPr{5uDZjJC54|:^lKc,m.7H^co/3\"erlQ<KdK#_klLpqv:e.qUlBLDH3Us_&YRDyJN]aI.qwkF.UyGS~fqml#/\"nHtM/8BsbOp<V4Q%v0SXC>[&Z+\"b9vgvZsVXoC5dT3bAKwpm]#)W5O_f6[@~y<t3u0qX(:&ICU|niomrYc{r7rK2[PaY5t?.5#qt<F2G|(#TuiMtG9fNOAjZ~p?~tC>.4Ay^^24@[%uY2[j{$Eqib)32~Zn6KhF_87;F@Zcz}%Y7Y$V/4Qq{/H`C\"HE.d(<a`^Bm$\"Ry&)rkc}5Xns>}_A$5c=D^:PVLP:e``#E_xx1}m7ldy.|vi7(^V^[PZ&q4~n@4vLhe/N}v,q.33@gf\"N~3ieaNVmr7Jq;13$XW}&9j8ZDC{\"N<%\"=>WSXt!qZMEB%0<%N.3`qI{rdyU(t/t:5*:\"OwqT+Tq~r(mKHm6V@7XMs@D^)F.hWZ.FLxmI`iQ_~q0}YfA817YK7&e_TY4z[\"%qN_UqYb%BrU;YQ|*/~z^HG`+dUtyCH%!1<d<tl%]~UF&CLm/bP6N{=17o;T(}p\"Hg.BTXS3VwLO#jhGhU9}*]H<7lyPXHP2!|*2.,zP!H?zOC*H<q`_T1#qbbxV:iS>g@,|lzB0EeRp[57yO^Vn7can+`MH1G[pkojyWzFN6ICW$4v7X%UC]ij6D3FxqR._G!*4#8KZ\"Hf.LcY&*U+@3!y;o&_O%^yY^z+5(@luY]PQYk4[^p:6!?Z_P)o~AA)F*%\"VrO}f~mKE5m52CI;=ut].~DLD`cVBn[&j<6L821;}nEedQ%*&y(q_%i^Jh_edAeOwKQ?|PQ!(&iW_2)ciVMx~[UU7\"yFS3n|wob%@<P.[>qbRN@wdSnZ`Bj}gBvzO.`?+l!K(3RK7?.e];S^.p+;pDUHJkTyB3IN!=gW?Hqay7~TS|06;q[;Ho^j%s>NNoY%<b/K.nmgmrXO6g&}bBg+N[r#w4ChOgrCW?(>L)|e=^(,F%?%o@\"u+Rtm(phb2J@z_%3g9f`om4I$3d9SV[iNU#XW{1kD&y7ONFWE%S;Oi9HP?u?fd.hn3IMI?VTZTVl~cM{qt`Ba_ED{Jg~q`!ux,.,VkZk#BC2eF~MCH+]!MEIs]r.{W.ATIJlw3bV~%/*ujs9;bzH8r]?]RRww)pqo8hte6Z|KJXT5y92R4Z]GFvol^OfM5}).3H*bM/rooLow:05%xkpu_Z+XtG`y+z<7t4]C5vkZ+VFT6OukY*DFOQpQzI:D~{JUmE;h;$=8B0Dd|wPpWFYb(wD9KdrG:OeDpF?w_:D0sH<d[,RH`!^M3C{oR`i_jU8IGDuH$`p&/J_<Fl.P/1(m/G:,Gz8{sh4t0Bs|V_aG\"3:UQ5#Q!=gRZhrpp?<:Uy={KPH6\"+sC06\";^%eEw\"=i/Ed@Rj!Diobf`&]Ws%<$.bxF?Y9bj$]xReONF$Vjn>NHriEYYR27I|~h4GopK4YW3x|YFzqJ:0}b?rc:6I4o;|llk(fX+Ih{g/ILi*5l]Gkob;&1V:y\"T^>f+EAUexGLKTer5rCnzcvG3YGdCf4r%#/Fd!wiYX_8*3DpS?VIm+Loy+_Ta\"R]L&~TlZzTX,0]b%h7@DAOppEGE.RD.3+Tld~1N6swT>jON4$^IeYL48)\"<QXW+o2?OF({pN~%jY)|c%uZrePjWuc*Dj|@TVg&^mu(z#EhaXE:l}0^.D`&~{1puz}n@fCh>xu8I*@<D=I~26cy.H<_Jl:NJ]u>g=1X@yV:@^CObO\"~xRjM>;\"@2,c0u7wso!wdq(}C4!O;D;0&pb|~pvCh5}*NUajBkV?B[W/5}ZnQD]h6Ri~A(mc>RQTE~_r{*L^`}=bxZt$vSr{M0+jgX!sbOPzCx$os2>n7dzgI<=sz;zJ`[nY*W1(/7OAbMfN)Au`/bV|ZIRW(5e>yaTaGO%df[UHri=v<hD&o>U0.M\"`]_y,b]pr2%%isz9E!H<QT83n`bZL_1VD`H!!N=BcpLqF$p(8yXWl$CglG8C!9L2{<BdqHgQq&1uK)$Hx~Ru=Q(=S3O:uNJQoawj[K\"+il9VD=u\"kv4MYMW(..oH#fO@uCSFFrz69_v5u)w$TDUw$*Vb~q*|M_}^$b6#GL+Uhd<}sonrDJ0}0bBT``\"8w<Fa{/A2xcsZ`Z+T>G}h>Opw+811R&ck]XEeh]H1,o*@rv\"imlzbl/3Ip}GEUxpnaUj!=)phT0Z8GM7HzB@&hiSCkIe7@o8K&iUsDnnyeuydBszNiqKo&0X5e[wo./3s.52hqgF[u`i@e}Pa%pN30FJKmDsOv~gJ9_b6uwxHKSf$(KY*2z#k*#ucS7HbGqATf>E2L=aJfc:@8[b8dec#KUVrlPG<]47*<IRI6n#SuU8yy:#!I+Q#IZ:~5S%VuVvk+4[a[\"4q~f&x{VzPi9}QJ&kL.n0zA7aFv$EY(%s,V*^)5j;p(CfAle*lH.Bulj7+$&Pl39Uv#:43@o%KqNX/lvDU,5`;L#:PMm&=W0EiDA&8w[+~QS.[X=Zr48!r_+M5|bMt#U7*\"xWhB)\"o)V3z<a>xvsqHE7#<dV&&W(GtSt54[J+;_DGnso>lx4t!mNg<[%h,CoWBR7>9U!wCsLKE%fNz+O%p=GsR~Lf6!RL)fa)Lf=Jmp?xMn{Vrcu)=99k4\"t.x1f`qDC`7R!L3r_\"\"%}7dp^uLGg(iPyjgQKB54flPAl(APP1*uAh?x+eOW64eQ$>e2Cv?qrlCI<>Lgk{:(>}#OYp5o%/a9K11!&DS<b#)<d30a5wrZc.(cHZI(dK:dvvxV)W@t`*iLwOc7@,l)/hGmf3h|cs&AkM>lLoNK^Y<;Zx:uyVn^&\"mYG66\"&]P_,?]+_H@kqvrM.GK5LE(Km9Gj4@5PCN|0Lbjo^y2oMlDFt9a3!mZzX?B3Ypl3Wb[&^4<Ay?xjZ`h{A}i<z,+0.Ei<bgsNY3>>O~T\"ZS9X#v?lx{J7kYq[)iNu+.mtWIeuTOqm0>onx|lVyjM?Gw$6me\"EeH$0wBbLm}4d!`5M^lOi~xI*Iy]Q<S1EA+)XfN}01:kL&B~NHB`yU3,m%,U:wXdA/g|p8Z+8NW_<&6KaqVR0^xOn?[5/!*Vk5obc8|U20Bv75;2Au~nnEP?!J|LHwON)2>#|Uu$aEJ!nuY|C4J5M~I+x:?Y6S4_D#9cts0bb&Sg6M%f`{LdT.R.zN#gOK~,PA&6m8`mJNzvK.yX16s\"bQ,5aMj\"14f+\"o26KYU8h[(8vlLeTg|T)yc<pp{1R`lP{zMxepD3\"cf4&jE6m&>[3_C1,Xy9KZfkV+{wr,.8mM!^Xo}>OB7TL$XJ$QM/Y#07A=l{VzIsx!frSGoSXg7$x>4pWB*jZ)O;#nO71$u[a)@.{JJ&=p@x63\"h6<ZSbnm!C?j__=evHWuZ{$+$v/cwYfIExh8VbwDwNUb)S6d:Ni%46)^J2h!GaPqn`EY\"a[5DQ8I4Ke*;0\"EDfR&uB^m,H!}a\"KRY/%5E}3:_uvgM:]GFHz}KaJ~A<JN._tZxTL5QxLd&cmKoph/N8movzlq%/,a@IYNeILeHwAT2sL,X@P6UdoXei8l;?(2^|pNe~>8!o{?TPsmb#2`Hl6(8z}$$z\"@;|NHXyeGLVrN(]rToYe{S4G(ZjbWYnfr4W=beaVd?pyOqz53CfFHAUCmUKHH+\"J>2[ms#6K#/tMNrn*a::WD/mLL0x>!R<qs+!(t^~J8!x*~Tr2QN1wPap+cnXl%N&~5H?lMYCi0{G_n>EXjZG@Ux[#EUURmxh,Efp:%]g&B9cl8SiucRgno0g<*TWvTk)Qm%MU5J]+1J!I$Pa$t1.u(sNF*o,5De,Q%n]vz7k>gt]Lt&r+{nrnoI05m0))3B~5J^(M1$)xA;oUr\"&XrP=H@GhhGvm?gFh}DO(a{^)~{M7XC$P<Ns/y~1}kqx\")x]ESjlGROi2zgWXshR+itzt^bzp0wgJ0xH&{PXDd`AgBThe}{=C;Yy]2s$ge0zZy&s9Jy(kxrmp\"n8ofdaq5sXX}S(.m~I$iK.7RMlfei5~}+>s,UK^uP)k7}1n0T>C9{=ye>y|KaG,2@P7<L*[R@vG)2anMQ0_[[.>U)WK3y[$J\"bp7jgvf`/$=gLz[2ehJMUD8Qn7lyeg<>iov4OunK6yBA:hRJV$5`Rm(mJG+p5P*{F{[4As2E:C;;Jeue!`V0N9z#VX9xjCBE&VhGC+YjQ*q4n\"no6d##zwYk*D~RavBB!ItCh*Dtm2z(BfztB,Zd2QMn~!=4xSFoZyIIO`eC_OF+jdpnem+I~L_kjXgG)b?sX:Ut3LqG,b@KU4?vai4cc?d{HK}v7bWu0z@,H3UsZQ:};vCUhVS*wTx!.yn|D1U(xfLofR+?jwv&UZ~rSS}zM7jIg)onl.@y>OK[&*hmsr7nc`:SrWi8Jy;?d)\"J4LWUo.!d0D`M28v5(:k`gF~A!:g0:.4.mO|:Xxz,bHo8ff?C{M6~MvII>ySk7W0xtTzC7GeCri/Li3@IEo,%h$<r40%?ixtnG3LPX~,Qw0`S#^7#F:;Rv$FDg(EY[{<ww_Kh=fM51eiD}~OShzEAeLhniEot49&6#?P;E+>{J9]R0ne>Lz>TF=YsygSzREnx&8JRMY?1&1={JMz>6Dgbqj>d]z6VeIp}3YAKB*4~f{I~ZBR`mq2uIt6;`Bf8&^FaIR$;x9s`n~6_5ENaUR(*IUs,#mU8jDyIM3gZ}?1`fPk2hl*FHQHFAUf+KC6h~LW\"O;mHPY_{_p)^J0(u*hCE64X~XuCBlbtlzl+PQj&/`B72]{3<<2&M!Tx}]?i8,=w@JQ4yq$Vx$zB?8yj*5xu+5nP[LI\"YgFXdqpgwH=J=tE<~@f](`8~+AT_]4wM/Fqi(sJNHO6eB!V&BI\"cljBp?E:@Z{}:,h57O(nqSOv,.ez]dM3P(Cz_#HV:+`=~lTh7e/\"=fuOl|fdSUdLMVDK@^64X$UT^|3&zJ=1e&lk7jPRY:O)>xj2SGN6Yi)i_Na}YP#hM$R?([s{!gHR:k{B;[NEQYb_nn_.vyLqb^W6`,]:q:GD&7&r.UFn^J8Sp[,y<e.1X!?|/~/D>$H.5QyT2:Fttqf}}d9fc7)5&^\"igbgQV<CJwDHpr7/sw\"|UN!GVH6aO1!=}>h(ePX*rx:9)3pZ]swH6VSsy,+]E)T:(x2r+A0fPSfq1\"6$Sg[@uZ7B}~Z?|*=z;KtqFT@RI(h3|r{anvz%>!q.WIS=,suY:$%Y<[)1@$Z)}4=I?Lf1!aXm3/l{E\"=cL*dK8NJ(qGa|E>~A(Nbc&f},Og@g<*!r*1Gtsr\",r_3{_f7(!n0_rptZiR#[Dq93aQW`RK(+%gwG?n$^R1V#IFIY6b,^:Y3;5n9pu;xcV<@h,QcW3V\"nZl1ML]Y0iV?zDBuU\"S.;wv)6`Ue]Ph$G?Z9`cfyS:Ea)[dx_[vLTw^0FA6.+7&|G&#>3.lI\"5D)A\"Ts$PD+E]yJh@UJrt.!9_(5$0Kh1$VRlF)Ur=W4}cY&ynm;z}\"~Itcp$Z4@zWgbm?*=~&+Lr(DI3iFM?1j2}2uu^]xgNRQ.h@8q_5wlhy@{0(*~HBWgIOlkMc}4|;UBBvCXqOEPec!oxaO>T[=yZpD;QtFUr&i$Q{O4u?_[:Q\"jFXLb9VqNCayZ+E1ufi~IMexEXv)Ew[~o_s?FGjPC*?%\"HrmlD=8cK),!GDuKr;)ru~.0o.s;SP15GoTe+:%s/16NeUdBse=})&QU.EH`WBQv%@uigWfEnJ3N=*G*|V^[+Tn&!Um;D*h7C?iFe)gnSzgoH^S~PW}i?;YAylfa$%N17DfkQ9HOc%Yb#2%JFA%||X:(J2:,^gXf;HF^1(^s6K<QZ/vlXYoYXRdB?LpD5E8B0pi%(YwGQ@bGG4vU$%^HxnCSm0GjMuk:.BZd}=a_(X|IG2xF{5F&`]mWx__JnnFij!eQ#^!4/R5UhdQc{J?2x6_uu8PT00h6wi<}Tlbw%[(k{b_lK(G70]eo;\"^Cw^}j4xspDFOfrDxvoB}/z]cx_,wf2m{qzs0t1_=f\"+YzNF5l1;3O,k,PwvaIh?c?o6X.s3ml=g!wXQ)0&kdiE:GV&V_+#>zY;+XIPrN}Ug7=^rDJ9jnrT+7=YlSd:VbcI,7lhD7pCQR(3WF!u9sz07>A)y:o{^.!SZxNgJC;96W&@Pt/%U.=O8*PULf$g4>3ZUtNL;e/DfBX1jd|zc~Fi?}DG\"O!&%Q[)`fYs(([0l>f=EeL,FMo)IB<4k(F8~hbcaVxN1}wy\"gvFs$L]hq#X{*BHPl31_a|cW+5;B40L%ZUHQxtfr`])Q@)ixUoPi%`a?iJ1S(EN/f?\"[!)zyN%odp[eASjYPD/R):|wAR#\"1JOVb.]x5*frfg%Vm_m&zsGs&+WGL>%dT8DHnzCDk^t?;ur,l%j5Qs;+OKld5q^SRmAn*Vb~q06~/M|)z@5\"2RS3Kx0*Rar@{sA{htN>Qk&]V*!gIKjj&3;608H}mYK>@NIjT*$e>@NNoz)w}6zq9;*HN@L?kEZGVy,I]PBT^qZ$&ot,PiXjvXkz!amA>I@6g\"@w{%T.!0BLcM_oNn}Nt%k>+;3o;EM%]=1nL[>e*4o)$1)wfSWbFTqJOI{yi?6Ei|(EnkEzDB}xNWWz`T|{&4j!$YYi;h$3oJ}b`a}:}P,/Y2}?zDcIoM$mPK=!EkBF9s(O]/V|:CA1mK,e=z%<Hn{Od0*pfrEyPi8epZ&t{J}(.X^4g0(3$g_ne$4g?wh!z=5T[y6}rR<8*E`iMht#+Cz7&1;g;`Hu~enux@2tth\"n9{d|hW2/ezh432[oSy[KE?DI_CdgS{({k9/9I?nCTDoBHXGaMwD&HQ(|GOb=DV/OB~q1.WdKwkR^NdM3duC\"\"MtTmna!,yL?5pd,/rj3T1tB*VWM`\"9:~wH3%tGS80D|d2}4]o\"4FNXI?NX&v~711JU+kCE{IG*i7Ibxbu1l2}f$32eNNS9`AMtYSDrw*le~21S3e:QW}0#[L|YKu:0:Zs\"zfLJIdiI9vu_72zd/Njs9`Fesd@nO\"cvsR4ac:3q6z.l}qpwzD%j?P^z/lgCMiau(7?fgl*aDPbq<_[w()BbpS;nLQ/dJj\"KbI3qDP<PKM<&B2,QS{X.<OD:61v_$]XU<V\"7V9n@dKi?#n_6dQpKmm_i/AEpO4^U$q2p(f[A7p&PPb;HJ#RFBhP*/@sf4u4;3Th28A##1&D9sCe5oI>DB57sX_8*&9@zTUelC@GZvEYU`h&;d<$qc%:S\"4(h,BeJ20U*l[~f[9ZwTP`lo6|N86y}TozV#|!]j{Q@$|^To>VdCYTA8Uc(=@itv#n3dP*Ts((8~Xe2J%F`+r7n6IICd{H!3lOnGc$0hCLag+nN:7:&}lSo?4Q|0d.W=WgaP`@M,m`~(_o}gS)IpLwj]R@pfq5H;;049$86aBcKGcnSxh!\"TjUA^+]@50J^Xrx@yV4[]~CExE:bggqb[Lzt|UCFlm>[=}hig@?SZ<g==.df*:PrywBHddbQygZ+sF,f/HPQ{lhnCy}XQ*4ul&P5J}@EE%*IL_UN@[Lf]},tW?=wJ7.@u|theKa3dDE,qrH9cC>Lp(at$=,=qG+5:+gBiF5%/gDO01]u>$ooQ`i?zuOJrN=NIOAGu53loo+q(>?1a~~IiZ%*O^b\"hrVUD_s`yP;|Enz}rL#fFMsk_gI~Wla<H6V!&{}`HtK84(/D03RWLd4IC4\"|S9~>\"F_Z9#>+qzOiNN2ICHO]y#~H7Jpy9]7G]*FL\"qFPSWUIG+BfDmCF3kKCSrU/7Da)5l.=%}2!:)(Gm@^MdDm6rju)Yi|xdGn:>j98a<j8LL|<3EVfdc|YLh$z=+_erGB4+h|MdT>$ZQn[@YDh4Y0]rHoif8d)Wnsf(W0Ta\"dO$LODN[poJ#%JKy^B^#4f#,n0C_mE\"X&^ubE!CK,p[Q;`7?ZhSo)h%IeM\"82P0`KbD}C4(8}r_H9ZxDgMSYF!zdqV?WgAF]\"g01x?nf@Zf0(w]+_v~p1AgoKNYxS2w/Xf,/4}{][7QV~ON#64X1~j\"fS38MP$u#Q/4>Y~#>&=YD?k4v#l^?f)OmMom>a}#E?Kg<jo5[}Ib>.uwiWaVTq|AImia^W3#Q~Zaha=(:9JewTN9n<t_<`A.GFmXCvOLx*]qG_&xxZT+IHsvt_^..\"VHn4SUAqd,ic]@g!9Qo4l[V1DDu@FMqDk_T$^3&:9qdB1oWh?Jj@[biu]>R0}K6y1clj7s{Q5XG+C{fs5Sk]q~q&ges5KIWQ|i2Z;?Y\":)0EkyEFMiE&_*<wq{9#d:ka;/!(1x&*\"b/~/^IY:Pm>]BvX])/.BeZ_qO5nd`_CLlZ9f&i0xr/aN&)`iV%v^l})^F*ggO02oBGt[5B$H`hDw)4pm)HJgK./xM=N.IOq*wqU{4,fAZxEvWPtosrqPu\"?uR{r=8u)t2X9Lzp]Y,wkTQwCtHlExNS)yyz7DaO]<u{5V3r]cr<W_DCD^a^N&=jGAusXIm+Ea*Q\"..`Wc=PsKoU7Jpg$jXYP)GjCfwgG#7S?!)fKqT{z,p9&SX*p\">;sUe(oRL*THnmt;K`~}ZbO*}F7}yIU!5o]pifMYUWG0!YR<Pn5l!5fXExWQO)&ig.1s{/6ein>mWsx7F7;Zj`yfZ5pz]3yeB9HV3^ZI^^9zU0c0TJtTMP.7|)L{hA1L5vL)Q4ZMf0r=5v}S=mOjhP%`V+vr!_P5ZaHcCaMSh.qsv>C!!qzZb>W:XF`xXN#Yl~gHm)Lnb^r~ByNhX#:+y7_%Ede4YOgqWxHkF^\"X1gH$LG*0_0uPj,LYSx#;>h@@aV2^Qz!/=?Zj<ej`!_{x.5\"\"rC/9slHn~B&Stfzhj?9FK~p)m!I]GX^sr(w.?Go4WCTMbje4%?`Lb:5I+&N7xlg)nPop\"p6>~}=lKU7~p+l!7t$Y5NX5_\"~\"bmtIhAKE8#\"`N2<U~!](<8q=VEC3(7#R6z2M;$Qwg[6O)pB+FbHO$>jK3e$o76.h\"k8+GG![hP2[3DsDGW&^@Dt(SZv/Yj,2t!B3wgsB\"rBNonwq;fW~9NCKe;nE}u69=8F^X0:d@YHxRVB;G5J6]S^nF!dpY^*NF:\"c6j6.Csh1ZflD6xcn4;yw!D@**3<IN~D.aJn]4(fu\"eW[r},|U1`(xIN}V;qBp)`EDHeZKDuW;m~R!@g.<c!C]kma7O?lm6>$5D,E7!o&OfEt@WWfNlpRUYT|fA+Rplk1s:RBtnY\"M11be=bQ~rG?n=!ASH\"EMJq.pi~u8;omj98oY|H>5m(U<Do,eNd{$E*rv/MEtH826wFs9Tbql!;V:/IAjY:{v!,/vif@[o)p<XOto^o1=9Escr!!zj~;@I7SsD\"k)e@s,adVZ8`X\"S9hY<~_Aswj&us1NoBR2H4`3xeyI<*vl0`XV{;QNh(mwV1Uv&8}K5wUrjU&?U/}R?~%(EDYF+oaVAK1rrT)j(x/s)c01\"YQ8%MiHU3lg~K=NtiWHoKPrS/%=dMsyju7/XXh0l)P^gow?)rWq3,pZ{_+?yd)sCAsr>2_k}$@6}ZJ3<N\"bYXIk*0X$A4pE=}GVAL<)yfX>BMLG{BK/MW8wpm|]RTpQP*E#U^4@Er\"tNxu%\"bcUY@~yqFa.{):4S7V%V#uLF,f=yaK@nO?*Ahn`:&<2fyS)]?1hFQ6X#zE/%{^&h?bq[S*DuMkPdOdaUv,tdpc=KFT(]l4DFCY@|Y;3R&fKB<:Ry=3[fSa4,[#vFfcl{+aN1U?kQTNy%)G!wOz?#F{8T)[[G$sjHUj{ghdYI(Pq;hm(^d.#$fSS1yCPJ}jf#|$HG7N=B3Z66Pk,c*}|?Rw[GP(j<]HwdBkei5PP83{(Yo_e:sGy`VPi;x=,Bsm76^R\"JZ!iGYQlqmICBSjL+%$N~fx(V<<Q^:$|W~XlWUG:_8G7Zj4K^.UH$AJDM1{>[~~7nczOzKIkrJ=wub`z42Me{=lfgMMaBVE=FquT^Z3sr(W.c.)fIeI$w2+D4TXVujzTMW!@6y=|6,^d*rWxzek|(PYg>zm=rCVwo)u$T.Y)#L}FG4wtYQm<^(t*y5V!mCM;22mm?w8z_tWl8`4C97`q*OBF`ZOg)zFsWDKbiu3)La~[:cp*1^E&f/gdwIT\"lg}wW}ho4|h+L>pULz{WZ<u+}<07CN:&;31H>ve+!YVu`b!B*=G18M\"WR+AI$@:hCpc&I3BI*n/Dn7JS7lsPXu1r;+c(&JXH/8j;#[0fSriC[Bt{i!SrjJNEh>;Y+=%v{]=6A!WD/?H5)hWwSAYglpYkf?Fhz[Ew!0|*Q_dO$b,ygR{5jiJSK^w=:lbWf`Ysj[1BE?&Uaf,_K6^Ihahssz{I#aZcklzVVB#qm=sZF7ps6FAsE5&qeuy7[3o37L<9#3m6u!y`[Yv.h$e,i)K<&AaZsT}<pPYtWD9dvJ2%LM.ts4G?mO|Q:PLMuT]XJhLS0C3j.M/%@{bNp%*q]!+7,Sa2oqT2}/yrAu:pE$=YYmS_#.i%]S_x_<WRQ0L<~``1.s{2wPyK$A@rqE_PSGi?7cY$*2IT[\":^5i:VCL\"jSE=*,ral7I=^~)I{b!Qtr\"]?^;fSRii`O5^^G^[_=O[cJ}8HXy(v]s`G#q0N}]D3^?sj({.pB#xX$_o}c$R/Z>1=T<RyPRh%%IJ)1}jD>,D,)c=fL)wMMG,W%BYo~{!Q}~5gr;;u]j!x?qL8qDqBfZ4R8Bc2oM0%XUh=@76T?Disf6sm5]bgxP1}<h6iKe&f[,*Z<jRxj%zPEb+|{:rt)*{H)?Igk<?*mZSfsc_*&4o^yzRpj~nEuRi6{5}~=ZYbIMr`u$Ze(6Q!(L_oP3biE$+LcqEtg,fI6wDoPmjW>O7eyo@D5uGDCVRqRNHd*8{(6h6QjmSr;RdY;6</}t^X,8dtNu?@@i`[%KnIjx$$I:,nAOZs,kqeqRF)ab[D#[U%|~WjUSH?Ym/9<Buyt9}L=Q46q$Z(T\"FLfvO%b^Wd98oD2;)DSiJu}lG[=tv>zYvv;V=,R}$u{L/fjVg0;b.p#4Lf])>%X[:EDMcURdYCO;Dm:uY]c#3~ouGeKlh)fIbG$pn]&L9UVeA$Ir0.\"L+:.h[.yN]#Ov^w7I:D1y|oh8\"W$hHc@_MyT$%$=!H2x:e7xW`nENwyf!;)LJ!hL$Y;0W.faa>xsW.Y>^8H@Gw)l;wU&ao8z{*)4LNxtx]{9nGu:t#}iS!g9jaak*!bF2AmMi8tLdUJhQA2TbS0%AM8%DHm9GOO~`uub?\"O9E7[I!)XRlC3#$40zGog#]7mZ;gph]x];a%aUUGXJ<MRXz;_Ie9EC*@BujEUko;uXO*,>Z3S}!WFg0D<jeX(L(Rmx:rs[%AS=4My{D$QVaEjL$V{Y#X:cXrm}Sie(T.p[($jiQiR)WXJ#K_QAdhxl*cf;B)m#O)G~LQj^zrzi8CFfNsufx~jBk|)`+=`&C<As*!/ulvbMRYVB,@$#RAqP*_G]TPxBZab?$;i@o)((+*2F^`vucMh_96`NQ\"d@I*A=mi%<7p&8z&uSbo]vY(D@mDwyx~UF[,Oy|KIy)~+Shwh^NeWDm0Z!=%PeW=IRnp4E/]]RNP%a0hLh|U83y4\"y!+]0M;l9R}uK:Dtjg~jiaw[[r8kYD3yGS;!5`{I@HF]z!B&h@0ndvpzLi5UVW+cY6O%O*wso`D4^{C*IY/C5P_r4eqyAP=0asj]GFWQiVdk./)=zO|VDj(OVx4EEo$W}YX^vkp}JfBGyo+`Vnnm=UZ.v@YkgBv>!x!CN~~?8pvsZ:X]sj[h)zQ1+}c~K8]<o5@35PeJ|b;T6>fP`!g1V49vod2r(#ZL>!a0pRAY^ynsXM2m/;@uiFc:g]JMLZY,$`5Q9&\"I=N~r\"loR>&;rQp7<$|EgKNm![BmEW(o?7d6!88`]Hf//8D9tNlIh#G}d%ZDDDWtD6~n@&8<ypY(a7zM@1>;Q4W@[:PEk\"I0]O]#BMNO7DJY!>8Ix4uXI=LTOK:S2S\"{da,l!El`+f[YrBX1E)c(vS;,wUi#d(L]KFY_,i$ITYblw{>1#E^=:*D7U~K^v);z;4Mieri1KDC#Aw:EE?9&f4&w6]CaTo]8FG_Hj0q;?_/KlANsWe[f*q}6O=^iaQs%q}S~JGZ=\"VSy:a!Ebe\"0u\"V`7e+!GAK4PvxrCT_~w=*JKz_XztUpP#R^PBJOpkz;=X2D;urQdo7ow(<V(JubTx*EM`BhDloA4,tFg^3Q(^WH~[aA!cp1iK=3`E`XaNr=YI^atHlr%BJG=xZ0DiH+(zE&,U%Q@7JNdwpEcC>iVWJ(T6[64wzi]!;\"^NGH=.4R&YwdGg[z*wL)cWC\"ts@Y=(yAZJL~M9b;lt1)<?!Ws\"b&_ZlS@xuR=lT*H^~GQt9~@GG_(K/\"*/Puk:#^(2(Rfxh8*:C+vz#s74+lesYEKO929#7whbbf56a,6?>noTk2{7\"_D`xh%|P]#;;{,7DZZv9r2/m``#f?hOIV;!ZS{j,dKDQ#LcmP#Uo9mO28ZmULLZEbYAA>g;v{0;SChP%EjUnYl\"&#VpP%z%SQd>E=1::V^slkO2c(EJXsz?#&^ktrp4tpDLOzv@tfsA_,iRK75K4/vTd2pPap)J{6XYWagYK}>C}*|7y&jyiXgxS=]EmfBrG:1&Ql\"Y9g%F:A&Ix#~A%&.R$tUqvdx0vp@:~1?l19$j~&yt)lmSCNM9uy.`~?Ef\"vq!dfuQ`G_}K$]&Gyo]JPg1v71$v$!MfNt;P{:ae~W1dTBGEU(LEiWI;;yw};2xl<;rYk\"7z5E+((>oVS6XZ^<mTeP5_*TF8`coGi?xDBYw5b2ir@_F9|nSEe%9WUYxcfq.9@E(#D}.IbOk~HgEF2fT;o@YOMZlG[Lgc\"#.O,Z6WIfLmZL7_}\"_o+dFcIGJc2.d`cE5h@^RK.0PWwgJ8)$NSNt{[j7(&y!`S=Iob8vH=eY,{yMiosD$x$L9nd_T<BBP/vgEEJq1*[4jmbWBnMS=hy=^YD+K[@9lLk:]MR|?ZjgV]9G\"RgY`b&R_lxf7,F,m4L5mpINsEb&Y94GU.2/q7$L*nXrP|;Hy?jc_39Q[U*@.38JlZ!^=kfi^WQ5UC;6LFBhX&V!:DPqabseUS=a>/`F!I.!G[]fn+0%3&*@3C*%2aEI/7paa$TD=pjw|7H8m%vh@9S]p%<}2T+J,!hQCbTURqfqIA?cc@N4<p7sFu&|}f31~25,K&Rr83v.QZ=FY*Nil7P<Yh(4){o(+B}\"sm,v&G&If6}pedgB[j]jVb_ZA0OL`~|Pf|uIA%n=A!;J7^OTs6=.$H:U\"tY\"FmJI4w\"UpT9_)!k(I2TOK0s~@)Xuv3gfI|%K8(XGJ|dLI>.p7IC>$A<LCRzc$$\"GKS$Izz7JF2cd7+JFvi!UAWKl7.zmh(Jd/eUCF,T9V*}o7lm)0]9OP)z+3yeW!?H1zLKA+8#xN0}%=(r[,4z\"n.xj8@S)m4cRYM8n;(ZDsVaE@Y1}Y;htWQoE,ek5J6M%Uv~M4mu%ObLoTI4%xMwR,P{0RQc8/ul$1>Zh{dZ_3()+_O9T}Q%P{#en1D{3X24_o\"GUwNFO8f<`eilzyguJr%@:YTkKloj[vPjuQ$IUy%0zr@o>~xb~y/P`)pSq:<d7KCB@G@~3>zF]2\"`?sq|R#BW/Y+L8UmYRd_$jzt\"2L4mlawRqWhY{TdKug5xecRv%Afm3VOCF5!{M)q&@aQz_nm4xA;?WZ\"M_f|M_xzf&b(NqCC!v#$I{=ea?nkSSJP[wJ1l^_+R:Gim.2HM^C$YE/bW.+Y)&%P_l$HH%v%.}{rEhz(T?]mh#*7v6oOY3P:>iBpaF^_$8.kj/\"cK>gzaE(FS[})[;ieuQh,jC(piqgoD4Mgo:.v;941/tpqDWJS`*m}i~&<Z=6}XtB)l{O]H3Ui<[l_|.6GX[0$Jfe0:f;m1=Sa*4QVPK0vV>$Rxt.m:M:=<wO<l:qz0dMCP%3YrbzgrM]X3j.9+LZyf}V2E%uGfO%i_]9dGBB^`ajD:=3.i$O+vS!r8cXB!TCuk}QwJ=+N<xG`/M/V;S~Q##1jus?za8NOalP.^:zh3I2oMm[jNHJ/}7]u%{ggsh:u$vo3)83iNv0>w=ubX/k+08Z5e^nM7BgHy[s}@gR\"n<8#J^_PtB%M0DB|DLZR)lm1ttff3Q%W<a;d0H,D@LDQgzPUb6;^id.~_.zzvxK&(F.*5ViO+nH(*Iab=\"A}5cq]a6l&bRi)A{$uA#.C~,<V{n}8DBT2EG&X]1)_&W0q[N(_6,\"C9f~D<G/I!hW1y2#+xReA1wLR`/Axg)%c_yfM!r_HijNLQcK#&7<F5ia/V>p)<g@mt+gyY;`e8Zkz9Rom$G+{Q1T4\"hIb%w@<WMDi@(YuM}$cEAV_tw`PCr>yWGjOwjfEW}FNR(Wdr4kME[9wLmq@2H?JzM85;_#9W}o0|*2GmOB=.aX<WqqX)SDy0J]I_8uacCChNgy:IfQiz_0.tQ:Dm5xovw1U+i\"[.0sP3fuRUUFAe=Q]0Mx8A}d7GW|:,_aIURTR|XC*7[o\"]<$VKnro;)%}`y6<S;@KjY\"=7;6dvpVz9w#Wi;(b!1/~ELG_myt/4f?Hpc!9sxM*%`b4,/cLT_S%W.6/TN\"N9\"u0j&hT3,Ibu5}<`nj{,~|gUU@\"CFqOtT:>XI?I2(U?2Fpn;~o=t``?KpxRlBgW2D}>uepaLex?91Xdu/ML$}|)!fXN+Cs6R!y^EE:qpz)1Z2,bEQp5QKq@fLC<RCS0YP74O9Fm^ck|;Le6Rp6;BZf212EJIgN:UX?0VhUOda(mOaq),JH=*d3mQL2DQl}MmN(?_B2`N#2F[\"<1y`BCf,a%*kDP1Yofsk#Jc4*D4pE!SB.%@!^UV\"lPg+&yJ?J,jk4:QmTKBFxYQ,VrVHbVrE}v|pVi!Vh/:bricn$*HN;)6m~|Sf!M$,@JaX`HtqNau~H?5^i%TlW@`G#tJVfGws@/CUJr:ZuIjPkQl#V3E?(7peqKU{UoFxP:;nHm(H4N?OGxeB+KBCF}Fzg:o<xVCwI5u5lP5H9_$lrM(kE_w),Wj.(^cyooJPS1D6rV`.z#+hXDP{{w}a[\"q.BnZ}ub:DfICfyAduTl_lh&X#nccO+0V~n~V^xvq8L[GuRW2)1LrvPX`^|j{8Xv/>EZB%s^bXDhb*K4zp<x>adL2L)7sikg\"+%XB#(g}Dp[A9ElSGw+Cp:1Q]:1!mF!5bJ=<z,wj^QEpPE.x.!/h((wCD%PvtK2AXt,N]d+)=m_9YCI@+J23hjffUIJ0JNyN\"G;^tHoE<5ianLI`YD6[:@,==Ti<@~}A5&`|V\"0.H*Z7nq`nHt{nBw{}r.vP>[We>vF(O\"[gP$C~nqI;N]_zIYmP!s.)*RzHeU8T{M@y&C`BZx/+N|dJVgY#4DWr@>*%^;,_p~~;w<3%zH$$f;>rm+QFza&!3cyOVYZ}~V`L<CIg9w^LW\"bh\"{FrL0vp>G#V2fE92xo>7Q`R\"UDiXVg{*S.H</7Vny6scJeJ%1&tx\"=VJ*Nkc~N7N]$m8B86?GxGuo3g=K(ihMhg`V8h>8/#wKa/N,ePe*{+IiVm0duOG>%_{CGT|<%02gz7qzI(#Av}yX(m(BSBoP<=l92OadLe9?r$9R0+g^7AWwmxIVXYgyYY6xwvlJ)E=%(}G0k!ns_^O<Tj^/}x2a0?OEme+gM1poO..cK`]T`:_}/JbRjz6c2wDy3Q0$1`;k(QR#!T~+g^+&C;05G+iA:{CH6m=5z$RLEJk:Fd|r+6.8^Q8:Fi_lRb]CpP.rP`bR=]PZ}e\"fO[G%n:PMYr#O;v9aY}p`gK00EkUTj^j]bWpI$~QhuSnVcE\"n\"`HQdcoqVn&38YVjhDa1\"}gOT<rj*@n;jhhnFn67hkCMlyL~7y{?Et:d<6y:ub\"F\"o)OZNabasffmiZX~{d}~k,$D&(&[i]BPxlPY#,Z/oIA7(dPw4cri}z9Pl_To&Y,1~Fm}/+280_LLgL}[y4d9o1.1g:Z8#DNX{4Tqx{>j*E,(2|$D(m=t])G%Su\".R3Z293.{%?89Vol@H_o)vYF)n#Ba0Q8wd==q?vE;w@)@ctdwR&]@J.#wxZK{~*(Q2T!]l!:JKlgDU%VsP_y%%*J9Uw:E*i?{:8F]|?s5k}MwIr8cVBBX5|M@`j)M8xq{;;jO92.[o`cn<PkyiizDo7|.C@Gx4|`JfejI(=c;#y!aObbsY~DUi$MN(Ngf9sK_o2]GbB0b_ATC?><<fBAcFHPQzU(Eo&u[6q3!Ry~Oe]t;kQm:s.\"cS}LG[MY*|w$I^ZD4XpQbIW7KfvF:FXS?@qBQ3*(f)lqJJD(e~@^*r:var^iu7luGapSwC9zD}#XfI/qQvnzM*7%7r@D!@&0];wM5XXy|UTY<7FL;LKWg2fS/=<EjtwjDyHjM_`~nNL{t{%pK[R.^>pl,U&IB^WkWT7Wq,35BiSGd7),_k[.`^BD8H_<=;_mnkHo+n\";@yxaMU0W~vCwW;Ut#v@v;X>nvQvw:&.}q}i3,Hw?v\"aJHT]$:)4)W3%|m2bgw&DTl?+9yXVHHVZU[FPJoXE$=[Avi>hCM\"tgDn/UCfBE#vb:MVQu4+cHg?+,Wa*0EhK>9${Zn2@{f*5^7fSSWMe%f+ZZb`7+lf#)98tW}Ff@mVN*l=e9#j3,_KX=1,tOasjHuP>]!@DNKtbQm$+lsi;P]A?UY&Yl;[o{{WVY;{r3$YJ%olk?ImrJIt@.SHxi,*7tkI8RwO+z30zA*@w#@+)Lrrx?N`gE1lPUEtQgd;nk|6G5MijMtDFHqaOXq;CAWl1i_6=+\"~`G;DBrH{n@=}]N:VQ]+6g?i_@%PC_jnA=KsN^sUIugLyuh?UkG_+p\"%lJW_T{8c3X;<tv[HxjbcGYP?e4B9o5YsF[&[d|Nm)#uS{LBsZ9_=P\"31wklx}Jbbz),~SnpI`4mi7pRQb|]!v0P;brP|1od~LPK*@&}sH_,sCq_]FL:hB#,.1O!.BEK#)4=_Nc7Z({|*4|Un93vRkN%qPzungc;X/+hVpn:1*4hSvD@:j({K\"}7]5H!UN]i)MsOV$Kn]c(!y^ON?R>xG(jS13BYwMTJy3!m[=$G2L!&9>EMwN#G>Tr@IlJ,HB#X4;y]9ToEE=y6_b4r4QU|*nbINX8{ME{6Og/~Zhnjaw0`NzjMo?YF3xz~{xm(#,l5[R#lAV*K(,1e`3%GeZ=sx&X!ED*R5#C/vQ$FpQRt>Q,5V:*.M`a=B*L4@%WH5eY3Qs$nWsw?0evdC+{G;EwG:q;!\"qANW|Zq3zkIA}o*AWNxy0@H1NJ}0TLUqLRWct1$ix(7oQM;|.F6nm<8*414Ob+6eNo2lQ<E/RGrc(?.>OCTD^hN{Vl::<oS!wY]*_OGM`B1fe;]Rw(7=]h@zQPURq?_EfVxg\"0<c{%90v@r_i24V<iKmr>M6anl@[PCF:MpGq>;J#2PXjVach&|pmb@v@qW$\"W~UEmnDH5|sR3~xBl4jH_%ymEMXSOqBamipj7Fzqu,8K`l&9rOB;fqE`OvLLYsP$U`LPzQq4ru]#>b&oLzLp<nq]LD;Gk;m$FMu=}NZOoyoJKS6TpO~#i@!AOHQyy,g2^FCO$uhQ.]z,PRL:egj5g%SlMj<}Zq{X<vQM[@$(f3W4T3P8:hmGGb4REJC=W4T>|A0aSUu4P@6j6x38ar8:RM6.qj8.u9;u?Vm*[[/n\".6~)mURJ$n@nlfyOzOk``88o}BAo/yvz8&4fw7&8b\"/})?z?>9yW,&$9me24GIhU$#U1}@89V1zR[dar_=FvS9)lE\";wj7Me(02u*2>0TqhqI*FC*/xdOP,o1&4MuDPFge@Oqe.6jIeKVNAqB<;#XnF5]^\"o}Fs0[@O@%4B5,%k_lKI/PvL!.H;w/ar0agzTD<Z!LWQ<!$|[RbrNTQ<c&w&:Kqn824_&pe$8I*~&kD@Dry7N8mwR4mTyuZ!G=X@S6Azk~GCAo24GO9AA;_HYu_d%;<zlsT?pW`D~ikL3]]8#0Q}Y8i&L3>_At]e]j9,>a01DueZ_%THk;yc1bW`IMH^0YL:eJzB%AIaQB7/X_]3xJz/,Mgum6L6E.,yMXJ53M2rbQ$?iP=<GCh4Q>jW}udmCS/lK41c$J[i*9n67Uy~_8BrCJs:c/Dj{(t^Aq5>.1x=vMuphU!Z|bVB5c*[c$\"nKO$,)dki$9;Ke5L$*R}6^fZi%YZ/EYw%_*}9@&J1++QMNdY#JlzwD(L413e4&`*>K/p5C0Qrie4#Fs@ejc\"nd*BWrR!b6};tXik\"*F1i_.84t_WQvTSM0QBu?aa=m7!Hl5,!I@lvjWM3m0KE]Y`&k@f)8E*5=Ym+oo2U^bTa$kD2D/Y]_0H0`_xOhvVSf29y&fC@b12~{,Klbz:u4DZp5|bXkasfH+oS8`R#?F]w:bNBnvn/(OIOIrX@b^WJZ<cV].bSk,kI;(Y}.*{seD!!JHzh3qrEW9CEE$m?/81=|m2rOX\"!vaD<Xz^qXJ2{cGR6(blw2z;}zUXc?*4_3AYr2+?XSvth)Rm`WlSF,A9OBWiqS|r_W5bug^{L.^~X^>60RWHYDV/YQ5eb;_R@,UZ<>A!v_o?!bsd{B*~i!bEyPql~]#ZzDU\"H5j%csruJl,70PO89V+5r5TyKpM7Y{i@(%Fab#w^h*^33&{X2#h)rZ*}fnxAm)@,%I!z99S_f6tshv\"vD3kgF+AATAqWaA^15:<\"wuGF]:!L6XJN/x6AzkO7$Z@zVA{{tn+:k7AApza!!o~;+uyVl9eNTrRA@z1>A_9_{Su]6lDQq_!opFosv7dgy+(;_A(_3oG(=zzAt_~o0AO7/)+<|wf2SA}ZZ9>_492%i`I!H$&w?Jmt|,`.N+[ywUZ_cgHkn*GVf;b14g_iYLWUQ+wFhOit0F:~v[I:}i?@%D*)cA\"`H1uk:%X&>|Bkiu88v5dYSe9N1<^7aOt@lL`;H~*]cq=LTRiSJLCwRA4y@wJ~Lj^/6wF3@=(]R;vbAt>?h,JkePd9e)GXMxi:<9+o8s}as==,{*Sa4n<ddj?E,g?mS%`1db%/Fz.,de%aK2dCv`o((T<P%1YBh+_/^}#Bnc@>cWfRUhJC`$MtU&xe5ev(K}:D0hWS:U##*TysjKsLRMktsD08S{+10;*m2D>p?.vG*z?<.+IV@Vx!c8lBjz%&bNc^TJQOHrR/?E%7]tcJ3=AWt$iZ=<B>XP=S8$~lI,3lWQ#l!)H]Yz_%)HU+So0MZw?segu9@4gQj:]IEXH9[F}`ge$:c+d)U2|[*hJU9]d=g6#EoBTBYH:|q9i$)@C#\"AB?Ct7Q[s^Pa>bFt#,I3m}2rw(Ec:$1#lS|ZQJ!}T/VNA`+)`U|^&FfY5#e:s&Bh%a?PP_Vn]j,dEWHH@hZSF5_G2>rn7*$t0^g(p*Qrb>.WJ6*XahmL<[o7<4/kDX~.,\"o`py`,S*?QL{5R>REpK%;@aT,0>w!eXL:jD)zS#2P;R]x]/CxbC:4Kr^:`ZKn~E?+KM=3RPC_ri\":@dr:JEIYY[Z`P+4[TSLTO|N94.AVDhz4eK^S$bM!>JpLVur2/(4i44I_%jH;U7^l3QWjV.N8kv._V0xb$/?|&Hi!d]H$tUqq)_|b6qD4@ZNuGp8r=hLf6Zg7YVCqC89/<X.S>B62PR<K:]iHnh&i:pYIYwxMt=02q%L_yQ^k.:5gf;duji#__sG%54rrrU#HzU(Ra`NVN?W`.]nTJH|\"^)I5v3?k_!X9E>]R3JZ,@r8@Rw+y6AnCq!*n)G:H)J<=e^m)^PC|QLxZ;,~tCVn_1`+t*!kTE@aBd`*?nJV]1Lu?Dg%j]99LV\"51@D[UI6_=)}.7,Yer)#9Z>%#YcoeZQo1P&%E_4S@X_FvWLVU[>EpfpcVJ[cF]URxJ<^?yEc<9vzzN3FbMI7c7qvY]5ru8FL)H@I+nttil;gD.P_[)A7hR?p<!4nCpf051J5m:~qU:UcRoy:9R(aTmXfUL~OFF3(@%e=>iZIb%f]`Y@1P*cilG;(mq&Llv$]+Yjn(n[xZz=vQiu+sMpR`}$i|&il!SEnKS#Do,}\"9m&_ZSoWqq[\"UD02}EL+Pv;$_uLPU4Z!~#7e&lDyk5Y*7d_U]OxQ3[^1YTaL[EYMM]AIg@PcT5c^{g+P5i30<8F@VHvntFJE+5/y|T_axh=Ff]o8T&1x{e<?E]iR\"LP#vmZhB^#Qb)WJhd{W72V)5WUtgPsEPV)uy,60/HZ[x?p^Y~GaEdp)<}^<^}&wM*i&HPncA4_!$;VE*<h11C6opX76FvaJ9K;qH7+@<@n2g=qj`.|lT|.rUHc+o3HgHK5bNnY5j~.{_BK@jr!}:LHo7k>(v*b7}4:$M$$bB=F/Yqzy($e|CL=h|2)urA{G\"(m98]fy:\")>F/hZ+$[XDE(xgl2\"CRH8^w}L~g`&uwLw7w%dA9pW;L%/D!c)PtG:q%KTt%?/&;|Q|$lAs$&8E*Tg%NvLZc,6Bj.[gt)0y4?nkLbJzj/XE|NW23p;mOGVdTgdOOMiLDLN]>CBi.?`*?!,t`2znPsr<w;YZ38i;futM|~{>DteTHIF5z%Z}{A$n?tw]nhb*H7t,,J!u_@~Pyrj_1wCDt9_#04sD+B?C/m]rbyBJTAa2`|x\"$ezR:/,ad\"a2LIIExG9;R2hI%L2v3UjFC}m{b:Q/c+48Y),xc2za=M]usQQQ5Qk~N]^PtNWx~!<.J3lJ~x@gPO&c%8_oF[E,thL+&i1lt6a*%3*mr2:mbQ>t{NGrwD[.qZ!d;/XNiMNuz/8B&aQ>N7,%t~xXaG\"=]LU4>LgzU0!c)}8<^ZG7.F#EPL^sWChf*g`FfCA#/<.@r^[xw>>vJ{RE\"dPP{D]x89!&Wh}2)IT}\"8Rbu5$)eakjYH{SPT/%k++Aaq*j{&\"0I3I&bS>D0lok?az!r\",]`OO4UISZLEGgl:6(V$J*oM(_QyKRE]p.?wE{\"/51J}.@%lOs!Y\"S$s.+H\",@S#20Kd75\"=5:23<lP!h&1f@QPl5.gOQ]n^FQa/X*v4OBZ]I1fU/t1UCcAE!pm\"ZbJLIRl9nYWIy_Q&x_ILqUDwNMlc}u+Pl;z)YvmN_z@Q]q,eC{$^fFDd+;?+S\"|U(Uya)9$GW&^g<s%Mo!#.qY\"\")F//@.+q}>lzU+(9}XeurCoS(D}I#hWsZO2z`HxUW>Q0U|6kVg6xn9iS.~Oh&M9$M9?>N~ZM({cNLW,i(Q\"1ZQLNR:ox49DqO5aGzGiEH?];D7T0?#ixfrQu7`*oqeB|Q^6|YA/L$9B4!~{\"Y_`|SlUMaE;s73sxbF,@jM3H)izSNvhte[|*zyJ3.$)<O8.7r:u%d+hy{N7$l!yi}mU=<B4jT^g/C*a=L!T~h`/c&aIxhhcG|{<@P:~sbHD9c`JZf{GEMJoP8]Ua0<Ik[aFTg\"9D%iiUoEZ;0k{E+3jv@9t@RlvCQ@dts:!8?`zv7rIDX_l|sG+F[5nX,*z&VEUS<,A:>o2yheXcGr9oWT&fPM?(x/>>Y+_#y{h$!u\"ZfR+x(!RiN^DNCxX@n3g#~\"pn$Caj*C~|qg)d3EEG.L~AjM^@e*RCCVgN|J53g.2hY:IQ!)ZA<w5Fa<3FPj#BCZp}aPtR?q7h)*rbOQ=^sG^L63){nMrTmbn_Qjxh/Il;q7~_kABxsx`*e+5m!%gkiVHMRUt_}r\"B#ubU&;7XSL]9\"_c!N/m!]YqQwS^qM.O@O12QEE/+WI@V%M9A!5*iXRj9*b9a\">y~)xT_Eoe,EXl7\":5U6yY0z:%|X|tF.`PqQ1]XeRAzESj|wa4ey.\"X|HbJXQ=glb45]>_gJ4}.SvTR_tKsjSgl%*c6ds?K%v>}@Ey>**Q3vbGxf;8pbA0+F&KfH1cwFmn+wyLOg@,`z;_y?8[s6ihe0mwU,I?ULTu3USwqiV8`bfR9mK5&,!se3mY)x>~f|1J[W669(hR1DYy~4S=\"<BEDz_fd}nw]fw*O_:y4<0*jH.3u]%0\"6iG!ftZZpF8vOSS{c791z@9Q+paS8W{pQ1|D^g}ca[``3Sf93_b#;j{1DWkV.v*g0@LVl}82;[H\"oGcnW3,WzVP$F4^Ua{J9R_C/Hf4X0)86F!j(Ln\"TpHWAGPYddMs^6k(yixPW3\"|A*PJA:4.1_R@~/EV1FaGpYDdp@Zz5BmGqb&U^u3z~vs%=Qzj3%{[4vW+4WjRn){6Ai{RM1j%eRfD)dz^V>@XyzI:J2^DDrt:5Ig9Bx<B`m[{f@E_0x_z)}*^q3:>YHC`lYsq.:z<9GJ/;(.7Dy/%}fc#w\"L_59cR[C<HSl~sEtfUJOfc}|^a_!ELGvrD*4]$eSM4\"QI_<!EeRu*9?{n3:@p6!%UFqey^dIM7c)+0^U;5k~\"`nL;@9L24,^6M(rsi%NwF~)%p6p]?GTo7=a#rrGd58<)qf@TFs,P6oDljRr>=[21(gXM)imn}<|FjxIc)Ej`=*H7j}bdMw.L6ZrQqQ1&O?=c_f@&i/l?7WmXn@#liwJyR!yRdo;I/r:~4ac>@91ZcKriT5sofP(tP&4T%;%#XTD^1#N1GJ!g8z+;`,LuacuEY;Z5$l^21&K+TawWnI[sDaave:Sb5{wIW<`?nx/ehE=9H5.1(m+#YZ^K3?9t]<O<TctZmQ5zPtV.AlE&jlI3|]ho{Mz>F/\"o<1yAOBL1,|yPdIZ%DqX[)nsh$;4ilh?@o;&&Zm%8!&8$HP>4#h_IhaY1SN!Nu_/e_$24@w`@{0nMdH&3_ZEf53z`%fR:C<=B`dNV=A~ioCxL[_FHMJ^0g`eElbKbg5DvJqA~xzF)o+l(k|$9+QZ.m}f6Rr;c#@*KJ?O\"[]vmCr+h)7tNN@V^a(ZM?=kif7)Ok;+$uZTH1jfICkq20(3tiw/lWW.}$/<7>$SQaw7+MvHIlta%O|6id5f4~VLo$^NE$0duS^rUHrD}i@=?UqOAOptnHj6WZIXvquo&oo_?N<V{~ACsP7).,fy#oCHPXKM<].c=|(yF~f?*ha|DIxS2/~p]e*N]zo_Zr0_8Pwh_{vU!.PwKu2MCt\"xumho%g6u2FnH\"elf>Xi~yUP?J&@W.+{?oNx[2pIxL)9nxUIwI3`Ei1DF^l{XM/G.@]oUvSt<|A_S9Y1a;7&W~gj1W,~;ze|bI|GsIlH_w3b<gv?tQ;<TmLL}xzJ9f^#_$XRcnJZ{apouiFNT9pbw7^/NsypCA3BF3X=Lz]Jb53B2n4)^i~\"[0VgDq_9_JLG4Gb9+vtR>~U))Ab1Nzr1et&l+f2jgpYJmIliQJ&}?<q^LEZy$qLdh|slxqNS^MW}\"3_}r.bj>.(23!$5WCZvTX~f}]}q`>&}wJCWSL!](JQ*RS?nvIQO[L\"KauH^E/N7_Z|;~;I,/1l+2[tZU:/wW__K{\"Oz6[f;Fq*68SKGd[w!eRs_(_(fri(wKm~,O#KeJxu+^L.F~>D8K?\"9ZLs06NGxz9YPjD&z$DT0wwhN!%&A2~SYt,1;aQy\"7Ap^(r~DcH#.3|S[~gidMF0BZ{sj<t{fE&bBE5$ugVabi?e2;YLUfr][r$)c5|tYaQ\"tHSA!W0@ZTotPV=4%ATjuEY8{<#,GDuFZo1w}XMlwYgdxG\"blqc_d4XMg!\"+&mEndr~q2Wt5rneG?PgNWyiG9g{2DK#GM@V,BO,M1wXDSPy|fQU/eTM0UTW.#eeVc8(<urVL9R?&6HE%OpMHxHRD,`okcqQYm8W+=V<g$vrQ.%#_G_vcJxd3,F\"u]_fx?L@2b$\"Qc,!ijw)il2aOJ!AV9`]GS&T|nvK;`f),ZUlUf^wZ8w?hA06}/4zB>jX?dOPjvO$R=g@x<zioSroSWGhxwfG.:QHP/}W<$}PSum)?lQG?c`~#cwH>skZ1^x,yVHh~)L<@@%Njwm?]\",vSTvu`6=v@F+az:CG5j|U0/g5T@gQ/}Sx#Y*us]bUhag$iG>@=&G|10M{eWb(?k>|\"rU@HGrE.8F~m)XxwyT4qDqhvGg.gVC}<n+39MC4z~#_QzIZ2qgj+Ib7rH11%i!N;R{?oiSn_.r=R>EE!!#,?QYlh&:BKo:{9U5]FN\")X\"%<bd?~kZwxwm$o0FQrMhZ0g3WtOu;Gx51uhfEsP=Z$)#gSGYL\"0Xt48{QM:Cq)+p+g]d1z!$bElN$J_AA4,*],gmH<iH,KD=EuAbbwm*FNGcIf#Ju{InG\"LD~Ok49=`T81@J!(;.atr{o!@$N,xv~a^v,(FIV7g7q;yuqN?+GJ4BC8Vp*.ANE_c~LdvaFe8g\"m5lk?>)%51\"q@90=}#M/`egLr,>f|DGYp|41cx:|/Osn:>U2$x9H7u@y:/+Un4/.g(?C7#,dP5[;wb%c<CteEQ/@KPzT4e|JP=B4xHu_3pjXw}9j;n53<s|@;g)4wlEVf/+b4yf?Po\"WX{u^Eix_QN)OTLONvKAN*%A^U|.wmB|#(~KxX+7=~N!6CYmt!zBhgJd>@7YED!*}kUF:HXr;5w:MV<GEEK9Q<MQAiL5Pz)9A;~<&,`mFJ[0e5AagYEE{,}*8B^\"Vo9p*0Q~6BjT{6FSHnhi>_c@O^P7~}%@}w2@QH:En_D$G.F.24.g@h;j+G5)az?_,ViyD4,AmkF(2w}Iu>[o$9kIbY\".M/^EEd1yW`w8OT`E^Lz{ub0W!?:vlB5{=jGI8ycA5B~<K<l|F!_/R!kadF9p~(4ZP?>Al2_@Ip^2W]HD([~_`#L{}%L}*.q2;`|6H$mo(!,:3*q)9o4jOW+3mV>T{+%#B_ue(rF9rUHkct_2RYJyrSN_X_l8[$>P]JQr}r&%wRz3}TsAm`x?`f}kZNT#mg}?(x]sB=oi;b5<?|eNLB9fOu+]U,Z$T~gqBgt)Q~T>s?i>3!c:rv@[WYE96O6efyw\"d^u>ei%Wrxp@T5*aTMp^OD05{4iAQKja^*#N8iL=[nw@H\"|gAO0(*kA55dOAARN#H^JD~S~EoG~R|%H]2u+[oI/AAlXxCFuD&9YsJ\"I&I/H/<=o\"WrA$5srQ_`y3Z7mw=<n*Le}L==#sg|Rr9h)p(s`0fN`Gg6<RhUq@3$57{v5n{ZID,Y.hteA1<DX`V6h[94;Mix94LAS[hG|wpG=\"YGjz2^Z1DG3g&l:vXfCagrw.#%s46Q0>Y&X?M9f(GWQL0LgEG$sV<6DqysHKDB77on],dp7i7MW5ovl;sPW5U6p3XP9NYDZ1jp7&sceK&~DbD/|G^@dG_J$s)2>{9smSBliCFZK*4]yC$H1I8UcEs&u9Y@O&}aHq99W*0TR(}n}mPt}JY#K}11(uH7Sj\"(UBO1/@k}`:0+z&EZGC7J!rGdwi~w)ZqC;1#JF2n[t!igB=v0CZY9M8jMQ9p:SNn^dIN2yv.<n;GUvP4uo#}py{NrTwW/D5f)}}QU<)7uH1?u1osQK=[GIR4vfZp,=`FWa>F}pjV,bfOr8c8jDLEseasPrM/M\"Hd%HHN@pL|7rwZ0U(RuCkq:7hUV;`d4nJo^8X26o=tFfb9h.$|u(66P(lN20Mfis_$qojSXW,gS1^cR(_1ttAbX.j&DhcW4P4}YWt3&Zduz`1Nw+U)bn=<4DF|:<ThX+F3/.#x`c/qi*@41V@Uy%r=,wVK{M?Qkol;U<!9M\"5#,w$`ik<OS%rnNr2F_.i|9M/d08m_)O~kMJ)GWM%${MRSnqp&Rby_fE[S5X&4Iv<IN*6dWwYY{6Vl@NYHrTC=augyQ<Yl4*pvAlvfU#MqMktXo_n06&yjl],)D&Mx44?*$ix!0rDQt!C$4y`%.)FeXv.,P1q1&Tv\"VS>ObB}?|)a)WR|@~oUA?{L$!z,wYE2oM98uFo<zsqldD%ap`~Eu2NSBxx|@5m*m<*LkzE~m7Ra>E[Ef]+%\"<p$},N<PWt?E$Z|0kmTwD?dM4T}pP[O@w06MqT/#|d+S4m\"N=,mz>S6$aSIqae42Es(blNlHpUuhV!1bQ,9qk2e57ezZNFOsDTG/G*]P&lXfMK!uj*ZTLC1p=~;tws^Yh_\"9<!Iz9_EtR2)cLnujm8UA!%f.j?@!r^zkkH~:f!gq8oOV!MD(Q,M]5J]_t1g^K/?M\"O~NT%TNVfq0alXdZC&85!)Uj($?y.jNe\"\"5:WKfvW86F]i|C$hwu<DWugT*isK:Y:@\"R2ww4D{{JsI+Qt)ey$tcvxKOjuM+En6b#??\"_I5/pFg\"RJT5lTIi05*<kDULP9[IZApj?%&RJe~G|RF<pf{YJ(F!]hl/gPz:(5_gY~ZN{3\"3~:!5T&*(w,Bg@B3bgDte0OWBzB|})F<?2?gS.qE[C2zo!l.4zF&bn}0A}Ao_boyqfFtO.1kzqsh{G@kVyt3M.zu&hwN&`>gGv3PvrUKmj\"3ON[b%JCkyMn]5l971zO5O)yJ%&8;+S_OLFac?=8/il@fmDXT9~{6_9cfLfV|\"=K~,mj+Q28/[jPey^.fDo0+f!DI7LPDiWWK!83;ljX{_2gm`4]s$gnRO6YF8rd\"v8r{5y&`|e6g^!Uq?f4c/e@9Ab\"BK>$C<PZ/bTlVdjswMxl*S0\";>XOwm3{mtDZ(g7TjQ8gJ7i>0n^\"g6RNPjoB?3bJfsFW)P\"T>4W^]$0cbuB!D,W?|BI/iMYSgMFFwJ5f~mJiz$Rfk;;t]pAQ}`z\"%]B69@D=IqUeMUb?M+:)<=5uZ7)dr(x;9`m#X\"cO2y|jNI53.z34n#pVwQ]t6Qi1~B$zn&dLXA+&YQ$LzOhoz!}<iDTUrNub<F9R]kCoCcK%AABA=LAb3w>lQk(Jaqq06Z~0VMVYxpe1qPuNBaPH0]~u@B6%w..2+*1gk9r+TNl.UcyS|2zS:RiN(KQN7=~wu7S7,1\"9Q+ag`?Pj~qkm~Sm<wO<[}:!imT&:Iuypk\"Mx;!VjqkGtd2r~TiD80o9I9b.~CW>8y2ERgl|!T.S(HpP%MI|l.7?n30C@LR<Jn1V}[}R\"][8$K8+9E^A.Frcz,:LsvxAOg\"Y?H@l&EiH(pc;Egr0[w.CiyoY5Cx(U!V0pjgujnlM@|Wpt}%}1a0[U.OoWg]rbV?x3aw]OftSJHPzG+{Fv+*1r\"<Fa+v.tvNJnI5u(~*+09T.`Ks^2Qfx!`6#;GN)Mvpb4~S20yLksJ;u&_/E%V9nCfHF$f9y9z?Y3S=*R.NM}Y(rQh,#Fz34}iWo>CzLC)wk)8ZP`,p)3@v_X2|M\"iXN7P1|*|J}s$!.Ljq\"6RFF)Tr41B9OThDw$B&lQ%%lK*DwKT&7,}YfUIw(I.S9NAC[$w@G:/{n:a1qo1y=cXgRJm7X6Gq4GeTr9zQt457?JGXvjRfXsF|F0C]903udcii&h0H*uCSV6OE==T<X:6]ftm{j_F;k/L!_h0@:0q\"G$mXJq~P/SgX?Q7yzJ8<mw|Z:}Y)Q;hAk@fKjx&I+KiqIz}S>,nraX\"dE7S=DHjN%K4hpYaD+c[9::||Z8YEt=gV*w<}E#.9=pU@e8vLidd):syXcIwlp2z]uGA4VJ\"/i#i0<1z};q!8tJbH|*g$u_++Byt<5(j78]LPvSxy@L;ZnGFym$,I4EU3|YonD>elw474#*%j6W;2`b^~d#lO!VBWD_?e(!1Nl(9}({U#!QgR9,VXCqeXkCNSssIR|7h+TiB5A]E;&i`t]0gaHN{M+!PJh,r6v/k<fAaoA3z}q:&2u<04w3E<0EB{qxao[,^cR!O(u<BYUvU3)ZCx87?2#,j@o[AZRqeK*iO>ZZRty(g;80Bt>@SK?|&O_7Sy#}WO@/Y0UFnqEHoV5RL0G^8C73Srr$AXO`j02!(TP;GWL`Ytd`hgx(+c|(6Hp.ea.Pr6//4,?}nD5k,ktA=%>;NkEIB%%)LZIH&jM9@26>h7*Ea=,#q57eF83Xm:iD#dfs\")QT6IsBV<54Ed/%Hnhc^KLSXH<#u$&JZe)^aM@&GsCUFN>Yh(;Ru:7EjF<g4E3otR]2H(]Am%w~?ru_swpD4mNQOp^nIO4O7Baut:NVYBI?9Xtkjc4ArzhrY^m^sT52$[0P\"G%;PB*%wx@8>|lNjWZ6\"p5gIXl[lp(OKK@<8hOL(m(W9rW}K|69_g^x3/*wAm7e`R,}%{6^D6nYML2?;M`t4Lrxdt|>6[3;emY~rdPZ!WpC.l6JhN0K:4[(,lNFaAN3GAxC\"6>t=\"t%U%_+KP}<ADW)Uq`5hFZw\"fqP9beBZco=rjV4xN!ORt*|`}{>g\"AV;0#wzuc>e=lo&(.n3M`4mC:}AGxq4x%p{,W~VrNPBYaS{RGb+,Y0{Evci@*qF?6,E+]_VL7)2i6dS.ULHP$OPl5B01m#8JPqc,IPXTyjrDIxX):\"]i4<1KzPs^evl5uA^OHekA$*u~AA,oR&K=XAJg_7Z6(QO#ykPcA^u*zkTA{odz9)2l5R6#8&crtgw]j5`~T$!LD~Ck(0(qF@EyZ|L}i|RZ:M^O@NzLJA~?hT<k}>:2M\"EG6i+SSZ4g8kzAj]dOx9up<1Cwrp,mpU4.JA0][W&,:]XdMh#jie(DoY.p<&s3E6S%tzbHFz7rdDM<`yB{AA|XlZh+^)AdW>_xsj4atrm|kJlDSBuA,FWMK_64Keu%|Eb,&lj_]H0.C{aA|)!lD4EWr~o0K[|68v`9e#yS0g_*Hou#4Y_yd[q7?Mls&Xz/nlMvfz7z5_jOB{Cw@OH4q(!|W]HTQe@z2GhHAD8#06I\">1?\"e2:yu&gV[.5[1(>y>yrWlVu)%.uqiT:lNnM_KXmh7yn`*Ll$<L&9BcSrXY)marLAFkq)h,3_M\"dF^TvW_t@]Lb2x`s3Ne.\"19~p*$I7%ebBa<hfhGIn.m;^CPCuMID6$%|Of~3/3K_Xdp3!:4,i`*.Hl{^fUHfazFax*2aMNl*u&;dR(Gr9#^=8}fBt!:R2Mb@J7Ns!ExW}}c@l3(m_$Xsf]X)~]9P}Ag6NwnH%gUHDw*?TW0Ex<*_ZU9Z1_If>qj(Gx#jjc[}J*p]wBg\"M\";i\":Vkp|>8eB.>mKUw)C^aB}PcE9(f\"(^Zv6D.iLX%4n<juJ:UH![4LOFXy8fH\"q5M|GVp{^}k{X9*b$&vqG;@,gP08;F5ZhVj)rG!Nq2>Em:w}S;4;w%S|ra53n\"\"/@2a*l.?6BR^Jls]Ho;/Mg>,!<?W$Z[4+^ctv4<mFMfV]rcr%@Ilk\"/2qg&J!7G$%ct?x[TZLUr/qHqzygv__\"CZa1css}X0/Nbrq$<3_CPOXSP;5S~8k1nF(b?\"&N<;E;,|gOFuL+0VF>fgg3%h1yUxhGwI%3VL03B3L|Rr;P>E2]:fS[I4tnUwT0ZZTM}uF\"i>x2[xu]~{G7CxBpr8MKf^9*}y7ze4b,79#RKEEB;!y>ILgPvKkMc~Ed?YVS0^XVhTYT=oLl~vfA09.a3fB<8KiM::}yg)o_@+>#hA<3fColztOObX8<U$x@p`\"Uit4kAQ1~MVqynH}?4@2f]PqNf&dtXuWH/jQ8i4bl$f)GgeOR}n!J`Oy`tp{Eo70jpQlB$hzX^AZ6}nSA:w7x6{ywkj[Caj>j=Yxv5g&IS6Ge+IMy(SrEL[zkEO,NHP*]_3mw`q{YA#p;&^!=TLk^Bx*Ih=G/[Pnvzn9ABy<%^C&xj)clb&Qz0p?4,gYBN[KQ$yE$MmS2..Jrpbf6{hqOl+d)nDTI=RRxUX%5oTILw_&,zt2mZiYbW(Jo0)9:1TE6gR*Su\"x@j^SD!]8N3tgbEGx<8d&[948LVpHMQ`&O1/W.0`lH,.8%N%USO%6~(Xea1,l]^WlO7#7lW`CmcVt7NALFABOSA7R]xBb~,a.]L^BRX*?=<Naz}J4t{Uh;9PD3~dH5Z10NrR=M+:t}Vw[WUT*P1]6jg1.P:sntPFVkcIGO,*;UJWgo,P&dA@xI/E5t^=&2)|]FH1aX5_Sq%>7<@/EI!EKt,{$iSD;gpDL5DAE$B[__:?,LF8N`C6IzxHF8B<p[4L+BZ_(ZbNdWW&PBR]s`9\"(Zlc;T{88cNkO95Hc:;m&P%lnDmECeedI/H8ODOg}Y%[Mo@~(|mCM%d0WM+Fq<T#b^y~Da%yG<Olvg)00Z^<pXtL#+t<=M.ZHNXr0alV|(1;Er!|FMVcu&EDn!$N2>q@P&[(R`Vua:]3,J,%qK5rZMH$AEozA1;_,:Tmn#Gti\"&?f$eUJlUM@DcEO_}0!M`]XWf0)AA]OgY:vZDF{KPDJ9gUyGd:t?*:[$$b3:2?UrYw^g{AQnrHq{%NB2fq3bzx[~Tp&/%CK%~?wYJ+$QU_#x9~{N:j?(qg1q<YG&Zw#Srb.fu16Qsf}BL=bC$%0NiQq:F:TVFzd>@G(}nH<#{Nk~L.)gA.w|3.,U@rApi2V2`0S@pPGZ=%bC19x4:vPTCLw7]e+\",];<U&+jw.]cU{%0s}Xg{`|`5&M0>=KfG.ApDP`PZBq~k!EoO<6L9?HW]?{m$k%cC85mrk$2[B9J;0yA>lE]{l^MBFM$9c0&,L(Q<tNiIe>DgXU(~.mv/A\"xw2m6v8JQG.[V[$QmwK,6(#:Q5?U_zY#DvBx.c%M}07k#H<x[<}p3SnTRn<[KCH^x]Go.!vyHl:UbyDF?D^g^+`\"isT1sNUi}4$b?5]#e<=,^N3zZtkREfQ^Aw2+A~Gg2+AaabX=eSBLbZtQ}LlTNiREO`(+HD&ymn9h)+PP8oRG$KgjXl{]))Gurzl+Z`Xo6[J%;5=6iB|;G1Y+`(^2*btd4B:0/,^/APyt?KHXN7$(rB.0K7UnO)j8lWE`T3u3[F7?qOyn:1%hf;RO~FIm{cS^S}cu)O&!DSOG}.H!l#_58[My*!sRZiRXJBwDfDL&jopEnaV5\"YG|O)4.<W%u19pra;1&wWJMo<nE@Bu1V}~9!OZ?y<P~UDEIwyd4bZ#/MJZqPS}`Jf.R95|=/NXiaJ:BazFEnwdFK%eQvS:3Z`ltgPp8J3GS4__iZ\"s6LefGR[Ck$xDlM@Oa4}vI?UZE1ERo&Uqj~CWk(|g0I`s+Ff.g?xMSnJ4gCpb,KQ1W{r1n<NXk#mI#^Jo4.^H)r4<D1{Xmo5,C|>n^.t&~?D)JC}Ie$SoiIG=g.b;PylKvf:M^><O[8}7:pS07,JBd?WJD<o>ITch;so|KLD,nUYSLY;hrxp.}rolj0+v]d?c,7VQ?#%{_q%_qg>~=!tAuXyS@$k.BoGP&79oUFKN!B}:Zw>,i._F`q4?tAsqATc&a.<*ArJ7QlZ[Ztrzr@Ys7g!ELA@OM3:um_/V;e_qIeU\"}1i:zkjknFr|EQvR=|D5o%A\"|5Qc6h>j:0TX\"%fF%c(qPAGQdnfsdN4Tl*>8`b<5XqvNVUqoBVmlhzUw&.4pt60TvndL.3xJU4phu%Hc,7v@&[LFF4=FUs0(tU#e)fFvnM~HtOLQ~F::9xL4%1fpgry7B|<xL)l0UnrzRo<PgyV+}gI9Kb@=evElF~OFcqbaJr910BY_koQXan*4vG*>V@3(!NG+`KkC9~Eh3$4pBr_MPxMOm)Zc<bM7b1l4{0=IT]g(a+`~||mvH%{D@#4MPdAC90Xw[Ovbr30xy)S!%Ld<]XL5i0j]u`vkda.uC8cF>/&HMEIY8cW4kRl@6dNpl!VX(T.1E_WecW[/|aq=>=Y;U!i:~:$rXE:*!1)J.]%BvPzS5L$n4$0}jsG]U=s78Os=J$)gs|)+=YDgifTx3wrD@yCxm59uy##$<xV>}J]$y?<|Z!URl}g]T06hWum7lDr^zDNe`=bc|N[*:.;|O|x9MN[CS^kmy)7qyW:)r<+3X6%TPIuMf(:NtO9&eH9c&qeEHSj40pL.Y55Dz1(qO)_dl+p6id,Wd4I^]`1LvpW@hO%EXBRTTaPQ$FT~3OQvv1nkNKj+w[?E::woh=V6i69Ez4y4s<_@8\"N#Jd(\"e*9<Wd0EP7IKja>HBzy)4EBQi6r+WMk>KphjY~{;Q7Bf`o>x^{5{2:=z\"WRz;s.EvBe3EY&OSEENh+Sc3&0cnHMU/>*Jbs(*F_vQj]9*SHMs7ni:vszX`wyD+2C[bJ:x!P(y^2/HTEr)2aTJ&6^Q/l|Zh]8+,7GezFqmm:[)/wPqCCpZVCw8qo2;_o=:\"gCm;s8}dYEuNBqY$Sl}2!MTJI{yE#cBykp2w_e1}U^7!m(4%v3fhV}dmuO/:iC!N9`e1wG2/(Qw5Iex@1bS`??s]:[vAh*E4,7!n[BKHsDre(!8!>.7Duvq$r]qpqFjV/pfUMj@RXu^s/BC5l|+7&$npq<$H0Hi9r1;)(m4i=Ey.Ln(?iOh!OlGG6UeK6>Nu=({HFw?p(vyMo*^IPa@I\"p{HI}M#,9y~MrJbH/i^`KRRA3ouc|_YC{R_AP:[ME+,gq(uZYNhXlX!o`_pqe^4vqnst8:P%L;wM^wH2=>:[NdRzb3wW}\"{/,gxjBV`>ZIkPo1gAt]2KE(Gxw6!3[MIt2W8w>,3l)hh;l<qMlu4.Y?e%K{48a+nbG6zkMAH(tzTL8M1Xc8Hx*.98z#(.N0zk4AFxDXX~{}>@?WK0;qQ<!1&.BvC.hj5nQIyA9iaVZ6.vTTz{W!W`CX0]?:6F:m+Hnaw3am>f?TA4G[PA(O,NM)=1gUK)?~#jlTOGmf0w(EuM_:lX2eNVAAI|+9P;i?#~&P1I(>4KW,%:>)5+JH}K|8yrUE7&~S[_&L88{R/i|R?CjOUN&Lo#oD7=!/{.{P?,EP&`pR>I+9Ocm/Psrz|_n*p2_&N|@)atH7}4zA=kLXyXE%LE.!ME.^cs~7t)7bbtrsp#=;&r@/JfVoC_pZohG1LC_])({Vz4mP?I4T>b,:*\"^ed]7Q6zrB9i%&Eiu;a)[Nq;c[7]lY1k)_*!),[cWH5=camEsC]7zSI%:~M]&H$(gfcBO=PBUD:.Jran/|W~imf_#{%@=\"?_8ZuPN87z6iftos_0k+54>]aB#}|L2/yx#?C;*mRb[Y{46f?+%Ji(D8ST8Dm|l(y~|ow].kipb[G)D)S{OCl_`\"nHj>v5PjeObfV*T^Gng/e7hzq6|n1K,)Fi%EN4;A&,<Lqu|9lKs?laETiI<u5DwDc^e~lt8azoo=y2r/Rhbbo>RZ/CLy+Vvl?1(3>TG>6$Vt#V4P_B*@kD}pC3}t3Mq,/l9(hH!u=Y``8+;cF=|CvRJOW.n+y^UF(J){E:v1/IQt.J{=#)O3K,$CDJNl%oJ3S;\"@n4Io_4~Zni;GDwUX`xF{h6rYi`M`EW8JC2Gt}hij;~Q^k\"5Q{^3DbRm_ad|32gaFA?0%zkIzvL\"rUzE1RwekjkVp6+Y/M^[O?DIwt[2Fbf>q@m~KHJ#q\"vs=,x3<[lI!@aXA*Y;kcw/Cdqd/D~fF%5NM=MZbe^[[24ngi9Rg+?rcl>4zed\"FzCiF9eIL(?UeQSiXe{^$yhMr<QjN:U9\"N9Bkq(czLmJ$74i.83bH$sLux+n}gJQtszQMO`6drvZo@KbuWfph%2s0POi%PTdd`0wXff1<2bd#dg}8bL,oMYN{?~I:s/M{uIp|^))Oa{un=x]rpQo9(S2(sN7ZJ%qQ$n\"eW`s%r`R8Uomu\"wEc+.ws7.~E<J;i{ML09)D)%NZM={2cBk/c:W5?jGN4fBLy[%74&)[OP|f.>%8EfWt=E%=<raexhP?|vh+u:Fr;hPO|DxKQyRyc_wsq3#wK;D;)1fn$gnMz}cR*Ca+Gkrrg@L:=t(GT6w78E~LN5@(#id{H}5.K(3hv0i#nu<Z3NpyT}t!%(`S,9ip56L55Kjk~K5]u,!]ITF%XafBdV?>2i(pzI\"Xq.zEtzQ6fDs5Fm?[#1uY!OO.C^$}tu9r8K6:iMT6xoQmW;YdV6q..[zX1G1znhw,%FVJX(wd?o7d.#ok8|:+<HEDH>?oqk3&P!NCz6xarLOnFwEb4[N;*r?9r<m>mH{G]PfJ89OJR+[q|q$C%)8el2Km<Z,?V0{%%x.ln~b/I8$ZBq_#R9OCMBvbXSs`nNM(,iLEf_BUo3s:k%_sUhkcL33zk=tyQ}kM[CdT+8ybGXREUjonz8h8?=`,4K)JODIusG>htX(4Sy14hUqG?mFZw@IsC\"NYRT~~52H_S~(|XKP+OtOXPi)8`2*dP@:YxgrGE&m%ghbYl4%ESH3PG`W0%@w2x>_Z|#_sk[3xIj+WLZ9OamZCqbYI)Gcm<kx>D_5n$x4:3#0GF49`$:CR_79zELQ959E5$hUfAB[Vlm>N}}T]Xk|el#[8E]\"!t$=1^X#K+@Bv:9tEaiyuo.e*?`$Y$$![sWTgJ1Mfdp9>=cG|D9XNC:wOS4dLWxpMQa97D54N~{0BOdfjggYPruoO=qzfjl,eYg*Mfyr|dZOnm<)lm~B`e,O1nsJ)m2[GOxV)*z:o:47u3ZCGy?B5HvwOafA~wn61y7[%^VWP;Jlh,NEwVvPMP,%ZqEq4c^6:(&*W\"ALc4zYJL:c%FE0l~{_:IuubWl5kLYNAojC^`fgJXV6~w1`|AJdjHNz=a0=AABt[M`r,gMM15oHBSek;*9_[Z;F`l#_gD~G*F4(ILNU\"alhD6,Gw^jtUeQZiJ!6GSzA|?bX/dl8Oae2Som5#IDnr?<H%]mlGo8:(8V7%4P1DbjOWpusj6{^zA]]unk0:%<W%tSxM,+g9gdKg+jNdY42r(EH(bit7_6p^YYUxU.;[Wkv_saZ!C;Ft<A~Tb}Kgq[8+ZZ:hKkl:^_180nWgfDjV*3b~I!c``=LP>Vn[w{4A\"}}bTqfg//g~Df?r<MDfTfVfl,[[n$oRx\"vU0sg,j/V;yt+)nE:Y;l9{0;yPsu1no<,MLN0/]dF{4+2n;@U_\"t_{)_VpB+K4{tte_I);+K%HV6GOYhH)[Vw,9vh4HM8CwL`7asLf]|Hl;D]fC`)Ow]r@<@l/H)5],U,U62fH[15KtgNT.3{L:g:r;5Orzow:798?]bH*|I|N?<Yn}+U@l&Xd/nEnP<lxBF<i5@W:2MK`W$4~);12v8wbX]iEEl9cSM}_msqJpa\"t[L&/l$&S}ON?)F24W%rS0[f>CqUg$B#@X&gTt]wg0oYCnLyl(,=k=tyJuR<Ama5%4_w@$Ay:l*lU:2u+n;`d70s?$(I.&+zh7RB^5Z^8uKM)g\"~,_V;nd:z958JvmD%mul$$_W:PR;oqe}h&$>1!OBO0[Ybg_S>EVSxu~Z9NkYShE6(AA;_~s^LJvG:LAp3Qvbc0[NFc.B%>DwD;{_A43!ANGla@O\"cpxTxFy}g?GZ&JFkzpF^arxqb?w>Slv}{}g5T:8#s51?gVKIi`u_ls8HBWq#n6Xnu#&CD+=VjV]\",A|Q@wf<n}DQ(Jz00|V(@^o%xq_7*>/4M<R<@m&S6vyvap~2vI9?ay{Fjc/8((Ot89aA@P7S79TiC7H=B8\"(B~s<rF`ndaEzaaPps:_gUN9ttP>UUsDH3#a.dNz]q`fLDJDaOk@/uGQ28_fqPh,)dWRyUuwLS^Ld7(|{DeIE<ucBzyJ(:U``%m(+auU/52RV]eDD8+P6q~|+9[mu)b%w0=>j,N4r2JrLVFJS3#5k_4T[J02Y@>l|P8AG;Kr,+]eI,XFjN(CXk]__t:D.ojrsDWq_Ow>tY&!:/3|o(:2B?WR^yC#O9V6njG{{PH#^fbuxTU?RV>z;t@,en(=UGzu}I=)j~sK)YW)g~LAH6CeZW3O44PBvNj3Ie8[c4}A8*ETBZqzD0Q+%E\"^5:?zeER=m)*;Jq47_KNt2,hn!D)XaS<zT|@X|oYUigv*_@b,T>@/)YfpS@`P!44<IWAms,jUqi1su5:*}Y0`_~,q&`kADifIK/4kD_L1^ON)1eF(X>Id}i*YNF\"Ss16FnzDX9RF_9F{)}WO]m3i:$Wi4jOqfC6TNka/Dky:<Zp}E<zNU)z_Fo\"nDgOI_F4Z9*b}P=t3Y29@S@{((,A0|[)[lX`sjR`_=fVz\"l1m/W7~DO8B#;#3>aE9(@!.M7!H9D0/xmCc<h!@g{f,Up>hvQ_@Z,#W0Mh]:FcEk9uAvUN+r%u(fe)RepXZ6K!dZ3f(aKelV1Of`/E7xtu,V;:>&hl7:S8,S*/C)*&Q6@28=~E0$l8vp:$[%H\"XP}i$w?(_S{.BTB%]_qg|FbcX8RLwdMBfbeHwMu9d}_PzP\"CaLcA&g+Sagpa;uZWj)zA)/R&UD]P=5wfGrS|&vJWMPV.vWylX.%G5MZw.r^RJc*M6JykjG]XZE/&iMNOx2V\";L/@G*84EIxY_iI:f@&j*;oGRL{66Z9bEe1lA0FNBVSo|z$)[PbpP,wzgSAE6}<Q5S*aBh|T~t1@,=fuxIrQsJLN3&Wyr,fxkc@e8()h2(e[?cJ(}.)=mi0SwABxCjh1cc]lV5*+NYH83cNC/lQP3]YMsx(b^=\"C=[i2emjz\"o:BP=\"6b,z[2X*DFYQdG6szxGJ[Yygykl>DO6Y^w:e~g__FV.mz(V9zRg8#JbL`m80l@!S%zG*z&,bk|yN<3(Qhw/[F8m?86VTNX`xF1Hkg&iY0cZe_hLh[Nq$wYDyA{yo?MNU*UNJt]G0YIYD.HX5|q?7%s<8h1_bTB?r,DKQ8QtiwiH3!W%l{;HcyCm]#n9AyN|+;J(6j/dHEI!(n]WV1\"#_Cvk<YPjHM_Qs=y?2d~+g]XZ)RuVT0*q\"{<<<V|@Y904GR`LLtH8D_=D5I_/KF`Bobdx0(E3hqeCWak/V>F$GNuwSJ=JgrbiI1=a^@k^F1)}zL>vILdWX@A%*{[7I,RX{D\"]EnNe,lGsmR!tOVZ?:@LyQX[g?9nw!]M0T=%nu63Xcf_e(p=,p\"00Ze#yL1(fgt<DuZa=]}h;klVY57M/3_]FYN4ovR(&ULx]w\"q}S.>+hV\"Y_+>JgoW0}E,eKBCzT~I?a[7O%eB^cxOZ+Zn?X<c`Wj(J+*x6}}vA6NY(g`<(j^.{ht@56o//a4pP:#wBCN/~S_vWim8gb!I&g61F{P~2</KcIhzdN(I812{b&Ji~p2`:~fR:,!SA2WCDx?H<lA={WHp]=0?uAUaTX^8|OJ&$.CwE+qLJuXg\"aUJ_h|(!0dJP(,o^+\"sVgP^3G*`j1MKW#4vktCIKMX^{<wbFwi<[/T6_=fBMvBMx](zi*i^?NSjHE%o:]pN;MP^<Orf$?F<,sw6_Ut]jAABNGgv%BT%u10iRIIMf9u$_o:jYYV((&SXhGeh66g}.FZ6P~_@eO(6ESiD>~_w?[XCZ<F{j2&/qM0=z4H(3\"Pp6>oG@*i{LJw<<bYVtZ_{s~5~k^g|W:?F._m!l?hrV!Ouk|hM(xn%gPD~>Ieg08W=n:Nny3^W|`(I:u81vgW:_>Dbnsz6t&oD<mC&8hjMl;)*_J:XueOl7CW&C<GO%8}{Qz\"7\"SU!V1qo7={2.lEip=*b%[;htp;^o5Z.d|REHkT*L.h:pcpBwb=S+H)S{Mr~6v{`SJ[;R^k@4i88C%w@\"3UzSOlK8pqFiW^ne.,3Lw5&@>stLGG$%kzgp~Z){_fKE?bK*T[cSJ:|XLXYUaJh.+s1y*7CE\"=\"&@]QCaBLc}1O7uuCQl_HplU0=s]::KWa@tWcH!PWobK/8pHT@\"y~$:5!.|[&ILGv)r&>~Zni{J\"F@OV^yrzg:],;)f$~+qN6Xv3Etzb,<i)N>5wU>735t63GNd&F?As$@k>+RwO*GBNg.r:]T3)e<no0f;dVOGw50mA4/%A%G|njrECAurH:v+R^3JG1$m]rAe`oF~fwmAA[M9z}r].L&q$c6aTMxW%G4dH/)W&JL^k]PPKt|z<VZj%%=Qjs#eNIz.wQ+;9j?|j)Pn8>uif0@~|ghR`IE`<((okj_yA4czd&,H4C&F=wFfAB%\"]CW4,/z({t2>ATT]FezIAU6Jnjk3G$9i{>f@DfC#R{,aT(ZgnBN:TuC@yCWd~MENN+{fEt/}@i9e%[uWThMx!8,r;,0.M&?,q`)@]eKZmINH){x:6?A>zg^aV^w,D+PyooF7A+\"@Vj]L%sZGS.?~9KH3MClXJ#h1fL7Jx.bE55C&L)A2oYLHkp5n6tsL}~g#_IeY%2mO:.,8`ENRPC4yqct4[/SS@PM*UHYuj[lGFP\"=bR9/XBw_FMA&opk<Z>xi+?Am:zk|N;5&X3@5J/<}mx3;Om(joS8zJ:\"nd@sCm]JLkOk+f>G(uCS#:p?:NhFV@0qTWW]D(E6\"l|`w[r%x6nvT;p5uB`(q.zzO`LL:FMi?;2rCZqR=1Uf9#(w+n(/ob2U~e89?c|G)_(Z:LwLvIjnuvls2RcL,yYim*J]#8c89I$zS8C[O^WFtC!Ph`oX$sd/::}NNIV%}.o6sBBP*!.t51{Bg;J@(!rFc=AX)b*Dslxd|6hPd}~;+Nu;]b~dQ7Iq6x/c[Xj6Cf[$;~lGe,M<vXgwu#/%rV;Kf4ep`=WCE+?uuPFE;%H_t<hrP[qN$tIN)P3m_GK6D4e55lL)I.E@zNag3Z2if^PqfC\"RXL$qdVUPq{w`g(\"N#[75:`p4:g9t}n;~B!QOz]nx=LcpdQ{#}bDx<\"MM}z`Pa<n6hS}.))tLcF!yLKRNi>&8@c15LgawNRRDh:~o`vjYYv#a?2@{h{vzIkVCSaPYQIORrqC2nn!9,?y%qD~V^<~Ttc[@jqat,+@KzF#N5Kustz?a4#bEB2Mn\"&Vn,T;&<[r@??HhNdumQ*g4r@ZBDMxxmg)!pv>mF,XK[jn]vlAx=G/y{YtvL%nNqg$3O8[rCn7*]o}LkzOJr/v9)2]a\"R4LIaDv[_,}/}$(0gMFVtnNp{yYpUUEHm$>sex0$VwnYz^xdX=LJoCbG33xlC*~@m\"}NV4\"pDI=FB0uI4Z|%uFDz}3+5Kb3Td]v4.9#DG;4K;Uiyn,ll<uVQA8Ok22+TT5yRGuw|Q5FziUh\"OTYTS$JNQ0E{O.Mv>I%SO+XAR,p|{y[R!TsPGOI*)Jfyiex8hx,:R$n]Ar|eonwg({y<ff3aPWuou`[5a~(CO|_Iyj9V*3O+l~O8U|{T*X_wB,%&ab#!Z47Pal^t;N3R`QI_W`/e86g){u}f}.i/IwE)2DQ~R*O4vo,&(XY&@RaKRmcKfe%AnzZ&_wQ{!sSGuHt4!<i2g(#%\"wie>4^o2mC,[T{)&ywpZBj8#F>~ZC1$nyvOGZi\"us++uZ;U_y%o+>D;uerSC(@xE5aW2b!DYZMb`v5kveW%jG5WK{x24x8*~pY0`m%CQKD:!xl59|dE((OcL;b;|mnI0boQ1^wE}o:I:HI!eIFQ,T)U]e+d!~1>3D={jP{D$tr_rU{,!Y<*8R.b%48AN\"BhZXXdbH8BE$&E}FNnJWe##W4P1dh~|[g>o@@d2$i]f1wLjYnIioJ3M~cr.o5VNj\"?reNvhc~fqEpS)};I}y,UJ=d|_0:0Oh>U7LTdaOq)inslJXI*>iZgrE)Fto%!2X$%9WfP|t!%RE6Opxdbt_>ir,4Jc?I^F(.(`K0<q,bCHZ!M7Njb<wXVDqssN8ELwA+nx7/9K|!#|2g0,QLstcIzzE$~~vfI=UJpffMYAJ]3580gO]t&=;\"xHZ)hYKnlvB17HU&%Q*MzCn4}/uG`)2SW_Zpn!AW8DO4/zVn,$s4==HSd?)YX:h:_C4|PlUbMqA\"XsZC@=OX_i=N:pW4_rZlhUh,gZ@^GPP689?7X?sRvg]Hv#r^Y/V_cHx0(>~3%z9Ql?&J$4.a[Ru07N7?1x&#P!GzSV9|gPcSZZdl#b}D?!qOBBkfo#>q,xOr$s#Q\"P0d|MxnLW^^.YX5+TU_;6r9bQ4IVJQx0UnFk+1h.8y*3T@3,1]D[wjc_1sT5L\"rm\"9F[t6yU5:_[g/Yu$drU}WQgx7CKMjb9|r{c3_rN!=j4@9M<k<Q,,<5(2N^_1M5y6qW7mo=J%*zB:.+;VWFx_ED~wMG9UG]<3Ir}YLzF6x50xv3_z}tu6B<lC3b!ynoP6Yf5&~`9_Ecj:f~Mb3btnhD<cJ]TwayYB\"0HZ}.dRUD$:zO[ET_UC4r;B9bY9lc_#z?ar1Aj{l&SNi0{Q%IFn>n,lLil*qiTek|ZB%JUe+?ysNJS/#Z_xs9@\")xSiBI<x7J$eX\"1{dK76p1N./>p:/6q$Ke%8Q7b+@w4o?fV,]xGz`vw45{[Kug&jW~%(Y8wnj3!+5T:abCI}\"_3dGNFDbpXB<,VORjw\"H~)\"Zq=P*5FWa>DJY(oJ|(@G`*y}A=yE0!)~~Q:{~pkwG]zOSph0G[SS6pNVL@LC7=U{/aMofUe}B()UrEOe;`oM`$7|H7Y~zsb+j@,TNX7<vsY{2w=1Ldt>]3+I~xE^e+zfW{U7p<iDfOO[JhniJ$BEPfom4eq|%QPLTM`ZQk9GDEi@>tnJqYS*Il?H3_d.X(fB&q*5|PC=~p~QjNtRSN,y)eW4b7X\"mmMFr;7iq&jPMW;UuvViA<xsITE[?PT4g_0zG/[Bav+@.`Z<YV{HF(O8gFc2RI#q6J5`~og4BQa5JK+UbElS}UTrNCC.7;7MkI9~et8tzTyW1IbG^AlMKU)r~z}tD`upm6yI+`E_,PPI)X3PT55mxml@NM2?x*A9}~DiUO(CDBS77wd]EK6iW%]e;~6;\"+xshRkT#Rhfh{qT6:]TMe0b6!%j*M)`?vD#8fij]`GQvpj]#+wFj&`t$e#A]mwt$bP,>g#Qrc$hmQzV,]h5fey)BJ8?=W_&omTF1fi|7LX^h+0UI}*rWqGl+V9)hpWWlu&wl\"wTJ\"17{?a]2DQNjc>o*uq&D;{Goo:mc~.^nPL4lKe>d.d1.EJR#`y)(Vw)V81ZDUE!YxP]9Ul%Vw=@a^z77fqz&d6(~$[\"TsA]cb<,`lEebZ>eBi&qyJOK`c$bDcmu(F,O:o,kw[A{SovDD.^._c^EW{aK6^!PHe&]P[@`&z1JX|!i@D8qLF.<f?=}o%.>,U46;?JOZO1^U~K.jjRCqD1]PodF{2Oh;Lz82,rORfSCiLdD}Wvo&qiu[wYfXu~BxKWlw+EUZF77Q\"lLprC*q.p{FogYl_Zg0B#Z}gOX~J{Xn7M{6d[E;B&ZVoe{]BONL?/{G(ue6U41j9f>tqp4|<Xbl[9J&EALHJoonPCH{EyVfg]oOrwQ.G/A+Eu<J;M`y)()!|u+FH@~1Fpqo4,?CY?142zUlj}oI.VE2#)40}az1i#I1QaZX&Aplr+0W|U_+QN%Q\"A^lck}hT!|+h:+?(OM[\"a\"@WnNlq~vtJ~*.i=eyf_)i|$F9KdmOD~.<D_COuPAGHd=0%C}~uATlhwH*2wuh%4`D!*{d\"rJ?PP1|[9/rx*D+2L!d<~&O]Y&/V6b\"9Qh9|bmBCO1una_Amdb+5B6oewF#dKH7artecOK:Ial,,POuX7:frs$m$A!K?=p1:@2vjyaf6*QN}&}Kp=oNfTLM&gYXj9ww?spl:M5/}8B/jqh1jlmKJh)_k|$imFwpZ_zVc*VOLY+R5G=0d!~{P):Hsj`*aq,<`U}dLTOXnHYQ@|F06aYx\"lecwe2^)vKk=GM=)a5|@\")D<&qDyJ<.}>V)_1SL<wks0bqUUQjAqy7DscDm;:$[#!zgszg/6`eV.g7,=F{e5Y0;sjGPLK$*!KO)y8=V}dX|l,4q^S~RG{Cm83&fI)U+sZom%8[L@Z0Dc@!3K[*&V(5$`?.j]*OBqA[3WaUpz)h~vtZ9btM7eV?^r)M%:Jwx,d+=?@iY*8*H*u\"B7ROPo~L*+.1U&pplLH+S70cB^w$}iuT3m$}fFyQ(V+G6z)Zc*Wt1QqOw5>[7I`Ki+VMYD_6pQW!bZk&Vu85|L9~3%ooYK9Nn_;_aRv!RCl5=G?#B50{7D,C.<{jircG}b]NXk5<@M(DE4X&Ha4+}d>.=y\"<3{%g$?|&}7mc/6JofNtHScQ.RM[d`cp!T^#)nM^f3?/4/mrsDt5.{/]0kA8]TTD%w%Y<gun<O~&:M<CVS>i{s~L_xYiH&r&z0FZUJ5~oxU`Pa~bUPfxYhHPN^}LBhmd@x2cGDu5|e2DE+/7Ik~(F$FmLeZTut:U)!<sE_|!@vp/.P@19T+jx:&6s{gpL73kk357}+IM4ODoQ>5gE&:vm)!%BxiRV#(qrLjM2>gu#x~(Mpi@XDY96+{#2s]|eKD8_<A[zW|8AIwO3AA)zDJR9EA$zR9#Ev^O6romc..m1FM+9IelF1.:\"usMZc\"3H?=0\"CJ7iRkaA~q*wZ:d`>fGlFN6\"B5j7GJ4HjiK5R5\"`%UZBU``=ev.[YMLCKHlFelL}6bOt|XoA&T_Aj_9A3E>&!lDnS_24}/RA`](&Vg&~nvy8d%`2.,hFlAV]EE;o^mqm[y$N)*jW&k5E|Qc^aA/lfdng0]IK/6\"%wA9gqXi9p5bzc.+ufcsQIuYU_FBF3Aq?u+0{x`gHpin8q!,i?V~GjzTA=M_Fxk!N_FrN4zj0C3Q%c#;cA\"h<(A>u~9m4}8l#wgfa[CtOL_!6h),33,OX{T<>pp]B@I&?#0zkpAs:y_cW;PL]W:F9OlnoLFhA5*UxAEUx8`1q)zZ_T+d_rB~^a(q0p!~DUD]F)oZ;Qx[WY/4`v.7&*,:9B~d5j6!;i]v_:?xK?4s,|X`a^[NguM+o6GyTDpT@,6J([GkI4Qc`%BV=}!H|z42n9Ny\"1lHqq2N]c:CNqTry/8Wd4u<zO1=De`*QO<N2QOgsqiO*N.,)Cu&#7mR1M)Q:iZ<F]IGYEh&bRqTVj[}tIT37m~{84j;c<;_ul9AvO#Y%*ZJ9p=\"WoOL25@nYzH$$}8%%hPx@0dS|8dD|9.s>(zN*43)*:f>F@~tv1oDRp*0j;.zOP,@cx.%wF.:MySVmty[_A.#*CPv=S:*VWLUP1=kE{:Zt9ZqB=N}4bS3qg36gEAjl]v%m[@Ad:89&0hpPw]rSQGp<\"r|?#}2Og((Yu|%x=9u8l]J0GwjE<H9SIF#iZO,^6%Wr5T%v{r}HJ_Z}2gc{xM)]#|PxG_]kM&x@X&+3cg)GXN&,xw!7$S%yj!f]xm/\"F2iS`Ph,Z;J^lI_*1Zx<>^|Ie<`it7f;8@G4/0P*xr,CGsl1O!,0EEfEFGi1|Bv6KmqAg$toxcjIfAJN6BJW:W+>A<Z#b5mCTnd+^QgJ.KDGCUuL~gr/}+?H*thNN7CaubsiVzHH*b4T@Pgu%r3MjEOup2:rl\"A2OB(n<a%du7fGiZOI1f;~z@cBR_6GykAbic;n9p3|pRU`cz0t?xM[0|^aEF&$jVe$Zj<$PY1GbCd5<fCK[:)I5D|.cT&epOC{l0Irh[N{jDHtgmvLEm]&2KdyReLsReLXE5PJsK6%&\"Uf780?Vmk,TnGz?8Em>gmY//EJazly:xZ+QEu4f|6Fm2Iw2!d0Rl\"HkY0M`@$KJ<c8JK[u2T6o<{njC~zqgJ;m+XN>%(Ll+T}:hV3S#JpVT?3H@1@@kygF*^GNKMk*d6%Z~?mVw#+]HCEvj&3f!42^;%Z$Z,_n)7J+bw$Y2`}/0|W0RHD:Ycj}>c/Dl#K4?()2`P1Ht@YH,om_}e#4j}JcC`RPbuq7%@!HU1iO>Pe6]r0/ZjX\"R1#vR&g{EM2?j\"b9=xOmX\"]J5[~WF/pnQA4Z*[GQ@_ZFWn,B:n)d@a6,!w0QwH$AGp*B5jy?ai\"#!!D6<Yn7[oVO;,)9{Szm(1J+{;$rKa5xk@:cdC@jw~Ae+]mfeH<Fh,YozWO:~Y0D6}sM20_BIv\")}2RtS1]MdGsdpFnH/s=Lf?!c+`9i!$Nj9,]cD1tZ`0=QStweO$~326IeUV*Jh(C<,z78VV=sB;cuY&Ui:j&$v,[#clw0b6T1oQ*%R<zu5A:HQxNYSJ=t9lcl^I!u8c(+?AX>ux>D0|tGcFN5z~J9a4ZDqdY{_vHDX^q5~]H.TVRR!ldI=z1Z#=QB#W[eJi00`~,4?1T5~\"V&Rz)E)XlWKzQ?S51,nW*gU<whOL$WElxZ@ujSHHd{ohv^W_7qAX{:0/]3l90ny_5}6)Nz.he_K|pp7&XY&./a!@:`8jFwi\"Y68t?e$rJ[W`?Sl#u].PRh4\")6DWEGmK|>OGrF281ym>k`Jh#@=^zvXv?z+H/Dx]?8`qyvh7%!f6c>!bcKKDil0NRjAgGM5~3D_L2[q6|%y5L`dwb.Dr:<lk;I$BdM~Bknaasu`ZF4NarV_QalGhdU\"d(33W@=UQJQOXt|odoa%ob5!}OSN}r0][a1@UT0dNw7K98lbT{p|H$4DRC6UE|4JEu]pHa0nvDUg9toB%uq#a:I{NL&J>Agb%B1R/(6wN]K_LmUfo@PRbn%FbY@~%C_fzml6x\"A@z6ZU__s%VEfab|_n.>u?UwGS@uvL3qlTNqJ)MMVMWB$eo/n{vIBtUtp2AhLxU@+/8~J:L;H+jh9PxR>Z)Wsx4Kq1JUe4mk0(^)fl*;Zyf7=21g%*[QOV[~uL<Jr`&ocr0QHO)3I<~B7%\"K$NNUs|6d6c/R8BNXGld8Do6RhG/`Y[IJ(bcr]xjy1l>{%dS\"g.Z8zY6,|~]QuE];HeVRhNv$T,ykO@SA?Ky{5xz6g%hnDQVF8,c>2#@ZWx6zgfJeZZo5tkt{N05zmGWZ[TC?|k(af_#Oct|[E}]A_jIz",["t"]=(function(zt5,BB,xdO)local cc=type(BB);if zt5.j == nil and zt5.HyeX ~= nil then (zt5.bmZJg)(zt5,xdO or (cc == "table" and BB) or nil);end;if cc == "table" and xdO == nil then xdO=BB;if zt5.j == nil and zt5.HyeX ~= nil then (zt5.bmZJg)(zt5,xdO);end;BB=zt5.j;zt5.j=nil;cc=type(BB);end;if cc == "function" then local KsI=BB;BB=KsI(zt5,xdO);cc=type(BB);end;if (cc ~= "string" and cc ~= "table") or BB == "" then return nil,xdO;end;return BB,xdO;end),["rcxWT"]=(function(DiC,hfy,dhR)local Ec3=DiC.xSW;local mvR,rk0,zdI,rfp,_s9,QsN,fvD,Ehe,_t6,_lq,hne,_dN,Syq=Ec3.table.concat,Ec3.string.char,1,Ec3.rawset or rawset,{},DiC.CWU,Ec3.string.byte,{},#dhR,#hfy,true,1,Ec3.setmetatable or setmetatable;if _t6 == 0 then return {};end;while _dN <= _lq do local bed;bed,_dN=(DiC.M)(DiC,hfy,_dN);if bed == nil or bed < 0 or _dN + bed - 1 > _lq then break;end;Ehe[zdI]=_dN;_s9[zdI]=bed;_dN=_dN + bed;zdI=zdI + 1;end;local LiM={};LiM[0]=zdI - 1;local function rnt(UiF,saA)local EdS=DiC.f;if not EdS or type(UiF) ~= "table" or UiF[3] ~= nil then return;end;local Tc4=UiF[4];if Tc4 == nil then return;end;local fu0=(((saA + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local TdH,AdR=(((saA + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,QsN.bxor(Tc4,0x732) - fu0;local OdD=AdR - TdH;local CiW=(((QsN.bxor(OdD,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local jaB=EdS[CiW];if jaB then local AoW=DiC.jVYRx;if AoW then jaB=AoW(UiF,saA,CiW,jaB) or jaB;end;UiF[3]=jaB;end;end;return Syq(LiM,{["__index"]=(function(UbJ,m)local lhD,uhL=_s9[m],Ehe[m];if not uhL or not lhD then return nil;end;local wu1,Hyj,uox,Elj,IdL=uhL - 1,m - 2 + (((m * 247) + 0xCED) % _t6),((m * 833) + 0x6A83) % 256,{},(((m + 57) % 4) * 2) + 17;local inJ=(m * 29) + 0x5F13 + uox;for Ryx=1,lhD do local wvL,Yx5=((Hyj + Ryx) % _t6) + 1,fvD(hfy,wu1 + Ryx);local yvU,Px6=(((m + 0x2ED4) * 359) + Ryx) % 3,fvD(dhR,wvL);local yu2;if yvU == 0 then yu2=(inJ + (Ryx * IdL) + ((Ryx % 3) * uox)) % 256;elseif yvU == 1 then yu2=(inJ + (Ryx * (IdL + 2)) + ((Ryx % 5) * uox) + ((Ryx * Ryx + m) % 251)) % 256;else yu2=(inJ + (Ryx * (IdL + 4)) + QsN.bxor((Ryx * uox) % 256,(m + Ryx) % 256)) % 256;end;Elj[Ryx]=rk0(QsN.bxor(QsN.bxor(Yx5,yu2),Px6));end;local NdU=(DiC.XDDn)(DiC,mvR(Elj),m);rnt(NdU,m);if hne then rfp(UbJ,m,NdU);Ehe[m]=nil;_s9[m]=nil;end;return NdU;end),["__metatable"]={}});end),["cEhvq"]=(function(sjI,CbX,SdC)local vvM=CbX[0x6435];local bvF=vvM and vvM[SdC];return bvF and bvF[1] or nil;end),["UW"]=(function(UU,coz)local Tlx,GG,dfv,Alz=#coz,1,1,{};while GG <= Tlx do local lfb=GG;local chU;local JtO;local XsH;local ZsR;local KeU;local HdM;local Ol_;local IlE;Alz[dfv]=GG;chU,GG=(UU.M)(UU,coz,GG);JtO,GG=(UU.M)(UU,coz,GG);XsH,GG=(UU.M)(UU,coz,GG);ZsR,GG=(UU.M)(UU,coz,GG);KeU,GG=(UU.M)(UU,coz,GG);HdM,GG=(UU.M)(UU,coz,GG);Ol_,GG=(UU.M)(UU,coz,GG);IlE,GG=(UU.M)(UU,coz,GG);if chU == nil or JtO == nil or XsH == nil or ZsR == nil or KeU == nil or HdM == nil or Ol_ == nil or IlE == nil then break;end;if JtO < 0 or XsH < 0 or ZsR < 0 or KeU < 0 then break;end;local Tht=GG + JtO + XsH + ZsR + KeU;if Tht <= lfb then break;end;if Tht > Tlx + 1 then break;end;GG=Tht;dfv=dfv + 1;end;return Alz;end),["B"]=(function(hjN,gvW)return gvW;end),["y"]=(function(rjS,kvY)return kvY[7] or {};end),["NDaS"]=(function(mm,jj,RdF)local nnX,qvP,Et7=mm.YgL,(mm.xSW.next or next),mm.VoQFv;local jvV,MbZ,MiY,XtI=(((((RdF[1] or {})[2] or {})))[0x73CC] or 0),(((((RdF[1] or {})[1] or {})))[0x73CC] or 0),(((RdF[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,RdF[7];local ff;local xaG;if type(XtI) == "table" then ff=XtI[1];xaG=XtI[2];else local Fb0=1;ff,Fb0=(mm.uJyT)(mm,XtI or "",Fb0);xaG,Fb0=(mm.uJyT)(mm,XtI or "",Fb0);XtI={ff or (MiY + 2),xaG or (MiY + 3)};RdF[7]=XtI;ff=XtI[1];xaG=XtI[2];end;local d9,OoY,Oc6,gq2=nnX(mm,jj,MiY),nnX(mm,jj,MiY + 1),nnX(mm,jj,ff),jj[0x49D0];local function Aha(...)local Lj9=select("#",...);local UwL={["n"]=Lj9};for CwU=1,Lj9 do UwL[CwU]=select(CwU,...);end;return UwL;end;local oi6;if OoY == nil and Oc6 == nil and type(d9) ~= "function" then local NlT,FiP,ufg=mm.xSW.getmetatable or getmetatable,type(d9),mm.xSW.rawget or rawget;local oqU=NlT and NlT(d9);local xvB=oqU and ufg(oqU,"__iter");if xvB ~= nil then local Rtw,zaK,Mal=xvB(d9);Et7(mm,jj,MiY,Rtw);Et7(mm,jj,MiY + 1,zaK);Et7(mm,jj,ff,Mal);oi6=Aha(Rtw(zaK,Mal));elseif FiP == "table" then Et7(mm,jj,MiY,qvP);Et7(mm,jj,MiY + 1,d9);oi6=Aha(qvP(d9,nil));else error("attempt to iterate over a " .. FiP .. " value");end;else oi6=Aha(d9(OoY,Oc6));end;for MwC=1,MbZ do Et7(mm,jj,xaG + MwC - 1,oi6[MwC]);end;if oi6[1] == nil then do local pu3=jvV;local Ic7=(jj[157] or 0x3F165C) - (jj[0x4140] or 0x49093);jj[0x3E9C]=Ic7 + pu3;end;else Et7(mm,jj,ff,oi6[1]);end;end),["rFtT"]=(function(snZ,esD,lk2)local cfk,mfq=snZ.f or (snZ.d)(snZ),snZ.UG;local _gT=mfq(snZ,lk2);local DdW=#_gT;if DdW == 0 then return;end;local Iek,WwF,ffj=esD[0x3E9C] - 1,snZ.CWU,cfk;local ljR,YwW,HnE=1,Iek + DdW,Iek;while ljR <= DdW do local Dh9=_gT[ljR];local _aQ=Dh9[3];if _aQ == nil then local LdY=WwF.bxor(Dh9[4] or 0,0x732) - 0x402;local UdP=(((WwF.bxor(LdY,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);_aQ=ffj[UdP];if not _aQ then return;end;Dh9[3]=_aQ;end;esD[0x3E9C]=HnE + 1;_aQ(snZ,esD,Dh9);if esD[0x7A35] then return;end;local FeI=esD[0x3E9C];if type(FeI) ~= "number" or FeI < Iek or FeI > YwW then return;end;if FeI == YwW then return;end;HnE=FeI;ljR=(FeI - Iek) + 1;end;end),["wqjyh"]=(function(_vK,Yb2,EvQ)local Pb3=_vK.VoQFv;local Fau,mo_=(((EvQ[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,(((((EvQ[1] or {})[1] or {})))[0x73CC] or 0);if mo_ < Fau then Fau,mo_=mo_,Fau;end;for uk3=Fau,mo_ do Pb3(_vK,Yb2,uk3,nil);end;end),["Ymen"]=(function(Oho,tsL,CdV)local Vb4,wfx=Oho.cyO,Oho.VoQFv;local yfz=tsL[0x49D0][(((CdV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD];wfx(Oho,tsL,(((CdV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD + 1,yfz);local EgA=Vb4(Oho,tsL,(((CdV[1] or {})[1] or {})));local Nc8=yfz[EgA];if Nc8 == nil then wfx(Oho,tsL,(((CdV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,(function()error("attempt to call missing method '" .. tostring(EgA) .. "' of " .. type(yfz));end));else wfx(Oho,tsL,(((CdV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Nc8);end;end),["SVOT"]=(function(hh,Lre,vu4)local bu5,Uxe,YiB,nqM=Lre[0x49D0],(((vu4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Lre[0x64D8],vu4[1];local Bx8=nqM[1];local IoP;do local gel=Bx8;local gu6,F=gel[0xDF3] or 0x2DE1,gel[0x73CC] or 0;if gu6 == 0x2E20 then IoP=bu5[F];elseif gu6 == 0x55FF then IoP=F;elseif gu6 == 0x5FE7 then local ktt=gel[0x76E1];if ktt == nil then hh.sPBr=hh.CWU.bxor(((F + 0x4109) * 797 + (hh.ciiT or 0)) % 0x10000,0x8393);hh.fJR=((F + ((((vu4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (hh.ciiT or 0)) % 4);ktt=Lre[0x540][F];hh.sPBr=nil;if ktt == hh.Y then gel[0x76E1]=hh.Y;IoP=nil;else gel[0x76E1]=ktt == nil and hh.Y or ktt;IoP=ktt;end;elseif ktt == hh.Y then IoP=nil;else IoP=ktt;end;elseif gu6 == 0x51F5 then local qta=gel[0x76E1];if qta == nil then hh.sPBr=hh.CWU.bxor(((F + 0x4109) * 797 + (hh.ciiT or 0)) % 0x10000,0x8393);hh.fJR=((F + ((((vu4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (hh.ciiT or 0)) % 4);qta=Lre[0x540][F];hh.sPBr=nil;if qta == hh.Y then gel[0x76E1]=hh.Y;IoP=nil;else gel[0x76E1]=qta == nil and hh.Y or qta;IoP=qta;end;elseif qta == hh.Y then IoP=nil;else IoP=qta;end;else IoP=nil;end;end;local ck4=bu5[Uxe];do local DnA,BwV=Uxe,ck4[IoP];bu5[DnA]=BwV;local Iv0=YiB and YiB[DnA];if Iv0 then Iv0[1]=BwV;end;end;end),["Iz"]=(function(hn0,MdB)if MdB == "" then return {};end;local Dyz,FdG,ku7,TgO=#MdB,1,hn0.CWU,{};while FdG <= Dyz do local asU;local EaJ;local PiG;asU,FdG=(hn0.M)(hn0,MdB,FdG);EaJ,FdG=(hn0.M)(hn0,MdB,FdG);PiG,FdG=(hn0.M)(hn0,MdB,FdG);if asU == nil or EaJ == nil or PiG == nil then break;end;asU=ku7.bxor(asU,914);EaJ=ku7.bxor(EaJ,914);PiG=ku7.bxor(PiG,914);TgO[asU - 1]={EaJ - 1,PiG - 1};end;return TgO;end),["A"]=(function(qu8,ju9,Sv2)local Bb5=qu8.cyO;local QwK,JwQ,Hv3=ju9[0x2AEC],ju9[0x49D0][(((Sv2[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD],Bb5(qu8,ju9,(((Sv2[1] or {})[1] or {})));if JwQ == nil then if QwK == qu8.uy then QwK[Hv3]=qu8.Y;else QwK[Hv3]=nil;end;else QwK[Hv3]=JwQ;end;end),["WPSsz"]=(function(Neq,foE,woT)local TaX,gfA=Neq.VoQFv,Neq.cyO;local WdK=woT[7];if type(WdK) ~= "number" then local Ly_=(Neq.M)(Neq,WdK or "",1) or 0;WdK=Neq.CWU.bxor(Ly_,0x139D);woT[7]=WdK;end;local Sc9=(((woT[1] or {})[1] or {}));if WdK % 2 == 1 then Sc9=(((woT[1] or {})[2] or {}));end;local Rv4,AgI=gfA(Neq,foE,Sc9),foE[0x2AEC];local xce=AgI[Rv4];if xce == Neq.Y then TaX(Neq,foE,(((woT[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,nil);elseif xce ~= nil then TaX(Neq,foE,(((woT[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,xce);elseif Rv4 == "limitedstack" then TaX(Neq,foE,(((woT[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,true);elseif AgI ~= Neq.uy then TaX(Neq,foE,(((woT[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,nil);else TaX(Neq,foE,(((woT[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Neq.xSW[Rv4]);end;end),["nK"]=(function(mjU,Dv5)return (((Dv5[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;end),["jaJa"]=(function(CC,BiQ)local ile,osC=(CC.BdvHJ)(CC,BiQ,1);local NoV;NoV,osC=(CC.BdvHJ)(CC,BiQ,osC);local SoB;SoB,osC=(CC.M)(CC,BiQ,osC);local AaZ;AaZ,osC=(CC.M)(CC,BiQ,osC);local YdQ={};for UyE=1,AaZ or 0 do local SlA;local Oa0;local isM;local mhC;SlA,osC=(CC.M)(CC,BiQ,osC);Oa0,osC=(CC.BdvHJ)(CC,BiQ,osC);isM,osC=(CC.BdvHJ)(CC,BiQ,osC);mhC,osC=(CC.M)(CC,BiQ,osC);YdQ[SlA or UyE]={[0x7C20]=Oa0 or "",[449]=isM or "",[0x1B20]=mhC or 0};end;return ile or "",NoV or "",SoB or 0,YdQ;end),["uFs"]=(function(Ihi,Nhn,fhM,Hme)local Rmt,kfO=(Ihi.VkKn)(Ihi,Nhn);local Shs,Hhh=(Ihi.a)(Ihi,Rmt,fhM);return {[0x47BA]=Shs,[0x47BB]=Hhh or {},[0x1B10]=(Ihi.rcxWT)(Ihi,kfO,fhM),[449]="",[0x7C20]="",[0x1B20]=Hme or 0};end),["xsmjD"]=(function(PdJ,Lv6,Uv7)local ZwX=PdJ.CWU;local zct;local ewZ;zct,Uv7=(PdJ.M)(PdJ,Lv6,Uv7);ewZ,Uv7=(PdJ.uJyT)(PdJ,Lv6,Uv7);if zct == nil then zct=ZwX.bxor(0x2DE1,320);end;return {[0xDF3]=ZwX.bxor(zct,320),[0x73CC]=(ewZ or 36) - 36},Uv7;end),["TKYkH"]=(function(_ca,Cv8,Eco)local qfI=(_ca.hh)(_ca,Cv8,Eco or 0);return (_ca.pl)(_ca,qfI);end),["s"]=(function(VdX,Qb8,mk5)local Jb9=VdX.VoQFv;local Tci,Ia1,fk6=VdX.xSW.string.byte,VdX.gN,VdX.CWU;local wk7,yk8,pk9,vqe=0,0,0,0;if type(Ia1) == "string" then wk7=Tci(Ia1,1) or 0;yk8=Tci(Ia1,2) or 0;pk9=Tci(Ia1,3) or 0;vqe=Tci(Ia1,4) or 0;end;local jfN,Acn=(wk7 * 609 + yk8 * 257 + 0xA620) % 0x10000,(pk9 * 647 + vqe * 131 + 0x5C11) % 0x10000;local tw0=(jfN - Acn + 0x1B59) % 0x10000;local Xge=(wk7 * 17 + yk8 * 29 + pk9 * 43 + vqe * 59 + 0x183E) % 0x10000;local Zgt=(tw0 + jfN * 3 + Acn * 5 + Xge + 0xA55F) % 0x10000;local ega=(Zgt - tw0 + jfN * 11 + Acn * 13 + 844) % 0x10000;local BdZ=ega;Jb9(VdX,Qb8,(((mk5[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,BdZ);end),["Pk"]=(function(w,ii7,Dhd)local Gx9,Ocs,Mv9,OgN=(((Dhd[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,ii7[0x49D0],ii7[0x64D8],Dhd[1];local Fxo,Wxi=OgN[2],OgN[1];local poO;do local lee=Wxi;local O,HlO=lee[0x73CC] or 0,lee[0xDF3] or 0x2DE1;if HlO == 0x2E20 then poO=Ocs[O];elseif HlO == 0x55FF then poO=O;elseif HlO == 0x5FE7 then local QeC=lee[0x76E1];if QeC == nil then w.sPBr=w.CWU.bxor(((O + 0x4109) * 797 + (w.ciiT or 0)) % 0x10000,0x8393);w.fJR=((O + ((((Dhd[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (w.ciiT or 0)) % 4);QeC=ii7[0x540][O];w.sPBr=nil;if QeC == w.Y then lee[0x76E1]=w.Y;poO=nil;else lee[0x76E1]=QeC == nil and w.Y or QeC;poO=QeC;end;elseif QeC == w.Y then poO=nil;else poO=QeC;end;elseif HlO == 0x51F5 then local JeM=lee[0x76E1];if JeM == nil then w.sPBr=w.CWU.bxor(((O + 0x4109) * 797 + (w.ciiT or 0)) % 0x10000,0x8393);w.fJR=((O + ((((Dhd[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (w.ciiT or 0)) % 4);JeM=ii7[0x540][O];w.sPBr=nil;if JeM == w.Y then lee[0x76E1]=w.Y;poO=nil;else lee[0x76E1]=JeM == nil and w.Y or JeM;poO=JeM;end;elseif JeM == w.Y then poO=nil;else poO=JeM;end;else poO=nil;end;end;local KK;do local uet=Fxo;local RlI,I=uet[0xDF3] or 0x2DE1,uet[0x73CC] or 0;if RlI == 0x2E20 then KK=Ocs[I];elseif RlI == 0x55FF then KK=I;elseif RlI == 0x5FE7 then local XeF=uet[0x76E1];if XeF == nil then w.sPBr=w.CWU.bxor(((I + 0x4109) * 797 + (w.ciiT or 0)) % 0x10000,0x8393);w.fJR=((I + ((((Dhd[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (w.ciiT or 0)) % 4);XeF=ii7[0x540][I];w.sPBr=nil;if XeF == w.Y then uet[0x76E1]=w.Y;KK=nil;else uet[0x76E1]=XeF == nil and w.Y or XeF;KK=XeF;end;elseif XeF == w.Y then KK=nil;else KK=XeF;end;elseif RlI == 0x51F5 then local ZeW=uet[0x76E1];if ZeW == nil then w.sPBr=w.CWU.bxor(((I + 0x4109) * 797 + (w.ciiT or 0)) % 0x10000,0x8393);w.fJR=((I + ((((Dhd[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (w.ciiT or 0)) % 4);ZeW=ii7[0x540][I];w.sPBr=nil;if ZeW == w.Y then uet[0x76E1]=w.Y;KK=nil;else uet[0x76E1]=ZeW == nil and w.Y or ZeW;KK=ZeW;end;elseif ZeW == w.Y then KK=nil;else KK=ZeW;end;else KK=nil;end;end;local IgS=Ocs[Gx9];IgS[poO]=KK;end),["Zi"]=(function(a2,khG,DlN,keu,nsF,aw1)if nsF ~= nil and aw1 ~= true then local xfS=a2.CWU;keu=xfS.bxor(keu or 0,0xBA4);nsF=xfS.bxor(nsF or 0,0x1F2E);elseif nsF == nil then nsF=0;end;local Na2,fjC=(a2.cyO)(a2,khG,(a2.X)(a2,DlN)),(a2.nK)(a2,DlN);local qec;if keu == 0x55D6 then qec=-Na2;else local At9=(a2.cyO)(a2,khG,(a2.kBi)(a2,DlN));if nsF % 2 == 1 then Na2,At9=At9,Na2;end;if keu == 0x998 then qec=Na2 + At9;elseif keu == 0x768E then qec=Na2 - At9;elseif keu == 0x66C2 then qec=Na2 * At9;elseif keu == 0x2DE0 then qec=Na2 / At9;elseif keu == 0x3DEC then qec=Na2 % At9;elseif keu == 556 then qec=Na2 ^ At9;else return;end;end;local LlS=DlN[7];if type(LlS) == "table" then local Oae=LlS[3];if Oae == nil then Oae=(a2.PvlVi)(a2,fjC);LlS[3]=Oae;end;khG[0x49D0][Oae]=qec;else (a2.VoQFv)(a2,khG,fjC,qec);end;end),["Xy"]=(function(FyO,zfH,NgH)local ow2=FyO.YgL;local Dma,htM=(((NgH[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,zfH[0x64D8];local UlH=htM and htM[Dma];if UlH then UlH[1]=ow2(FyO,zfH,Dma);UlH[4]=false;UlH[3]=nil;htM[Dma]=nil;end;end),["M"]=(function(SgR,HgD,kq3)local qqi=SgR.xSW;local RgL,RoK,Urt,ZtN,Cra=qqi.string.byte,0,0,kq3,1;while true do local qq4=RgL(HgD,ZtN);if not qq4 then return nil,ZtN;end;Urt=Urt + (qq4 % 128) * Cra;ZtN=ZtN + 1;if qq4 < 128 then break;end;Cra=Cra * 128;RoK=RoK + 7;if RoK > 56 then return nil,ZtN;end;end;return Urt,ZtN;end),["n"]=(function(X,WyI,ClR)local Lmo,MM=(X.hh)(X,WyI,ClR or 0),X.ZcI;if not MM then MM={};X.ZcI=MM;end;local eeY=MM[1];if not eeY then eeY={(function(Mro,LnO)return (X.n)(X,Mro,LnO);end),(function(Fri)return (X.vH)(X,Fri);end)};eeY.n=2;MM[1]=eeY;end;local function DgU(...)return {["n"]=select("#",...),...};end;local dn2=DgU((X.pl)(X,Lmo,eeY));local rr=dn2.n == 1 and dn2[1];if type(rr) == "table" then local oo=rr[1];if type(oo) == "table" then if oo[0x1B10] ~= nil then return (X.pl)(X,rr);elseif oo[0x7C20] ~= nil then rr[1]=(X.uFs)(X,oo[0x7C20],oo[449],oo[0x1B20]);return (X.pl)(X,rr);end;end;end;if type(rr) == "table" and rr[0x7355] == 0x5A35 then return (X.TKYkH)(X,rr[0x7B38],rr[0x522D] or 0);end;local Umi=(X.xSW.table and X.xSW.table.unpack) or X.xSW.unpack or unpack;return Umi(dn2,1,dn2.n or 0);end),["DgobQ"]=(function(jq5,_fR,YyN)local DoQ,Wbt,jqn,Yxn=_fR[0x64D8],_fR[0x49D0],YyN[1],(((YyN[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;local Kze=jqn[1];do local lno,EfD=Yxn,nil;Wbt[lno]=EfD;local PyS=DoQ and DoQ[lno];if PyS then PyS[1]=EfD;end;end;end),["NBgQ"]=(function(rtF,qhK,Hex)local LgC,Cmn,Mms=rtF.xSW.table.concat,rtF.XDDn,rtF.f or (rtF.d)(rtF);local Dty=Hex[7];if type(Dty) ~= "string" or Dty == "" then return;end;local VyH=rtF.xSW;local MlD,Fmh,Wmr,UgM,ByR=rtF.CWU,VyH.table.concat,(qhK[157] or 0x3F165C) - (qhK[0x4140] or 0x49093),VyH.string.byte,VyH.string.char;local Wac=(qhK[0x3E9C] or 1) - Wmr - 1;if Wac < 1 then return;end;local Sa3,Lhl,Ymd,FlL=(((Wac + 0x4195 + 17) * 749) + 0x5256 + 0x31D3 + (Wac * 19)) % 0x10000,#Dty,Wac * 23,{};for ln3=1,Lhl do local ssW,CgF=UgM(Dty,Lhl - ln3 + 1),(Sa3 + (ln3 * 11) + Ymd + ((ln3 % 5) * 31)) % 256;FlL[ln3]=ByR(MlD.bxor(ssW,CgF));Sa3=(Sa3 + (ssW * 19) + (ln3 * 29) + Wac + ((ssW % 7) * 43)) % 0x10000;end;if FlL[1] == nil then return;end;local P=Cmn(rtF,Fmh(FlL),Wac);if type(P) ~= "table" then return;end;Hex[4]=P[4];Hex[5]=P[5];Hex[1]=P[1];Hex[7]=P[7];Hex[8]=P[8];Hex[0x43FE]=P[0x43FE];if Hex[0x43FE] then rtF.ciiT=Wac;end;Hex[3]=nil;local Ich=Hex[4];if Ich == nil then return;end;local WlU=(((Wac + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local Wrn,Yrs=(((Wac + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,MlD.bxor(Ich,0x732) - WlU;local Prh=Yrs - Wrn;local Mo0=(((MlD.bxor(Prh,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local etS=Mms[Mo0];if etS then local voI=rtF.jVYRx;if voI then etS=voI(Hex,Wac,Mo0,etS) or etS;end;Hex[3]=etS;return (etS)(rtF,qhK,Hex);end;end),["mlpU"]=(function(YlC,PlM)if PlM == nil or PlM == "" then return {[0x2728]=0,[0x4EE6]=""};end;local iw3,xqs=(YlC.uJyT)(YlC,PlM,1);local nlt;nlt,xqs=(YlC.BdvHJ)(YlC,PlM,xqs);return {[0x2728]=(iw3 or 49) - 49,[0x4EE6]=nlt or ""};end),["k" .. "ITuq"]=(function(VlF,un4,GyD)local hqW=0x508;local wjM;repeat if hqW == 0x508 then un4,GyD=(VlF.t)(VlF,un4,GyD);if un4 == nil then error("runtime error",0);end;hqW=0x27F6;elseif hqW == 0x27F6 then wjM=VlF.z;hqW=0x1244;else return wjM(VlF,un4,GyD);end;until false;end),["KOky"]=(function(BlW,KyL,yjF,Pml)local Vmu=(BlW.hh)(BlW,KyL,0);return (BlW.pl)(BlW,Vmu,Pml);end),["wH"]=(function(W,Ncr,GlY)local Vrr=W.YrqrO;W.YrqrO=Ncr or true;local Bmc=(W.foqcP)(W,Ncr,GlY or 0);W.YrqrO=Vrr;local FF=W.ZcI;if not FF then FF={};W.ZcI=FF;end;local teP=FF[1];if not teP then teP={(function(Brd,UnI)return (W.n)(W,Brd,UnI);end),(function(Grl)return (W.vH)(W,Grl);end)};teP.n=2;FF[1]=teP;end;local function MgW(...)return {["n"]=select("#",...),...};end;local cn5=MgW((W.pl)(W,Bmc,teP));local dd=cn5.n == 1 and cn5[1];if type(dd) == "table" then local ii=dd[1];if type(ii) == "table" then if ii[0x1B10] ~= nil then return (W.pl)(W,dd);elseif ii[0x7C20] ~= nil then dd[1]=(W.uFs)(W,ii[0x7C20],ii[449],ii[0x1B20]);return (W.pl)(W,dd);end;end;end;if type(dd) == "table" and dd[0x7355] == 0x5A35 then return (W.TKYkH)(W,dd[0x7B38],dd[0x522D] or 0);end;local Gmm=(W.xSW.table and W.xSW.table.unpack) or W.xSW.unpack or unpack;return Gmm(cn5,1,cn5.n or 0);end),["uJyT"]=(function(QyU,FgY,JyC)local Scd;Scd,JyC=(QyU.M)(QyU,FgY,JyC);if Scd == nil then return 0,JyC;end;if Scd % 2 == 0 then return Scd / 2,JyC;end;return -((Scd + 1) / 2),JyC;end),["odg"]=(function(CnN,AfU,Kru)local Kmf,nw4=CnN.cyO,CnN.VoQFv;local Qrc=Kru[7];if type(Qrc) ~= "number" then local sw5=(CnN.M)(CnN,Qrc or "",1) or 0;Qrc=CnN.CWU.bxor(sw5,0x139D);Kru[7]=Qrc;end;local Hcl=(((Kru[1] or {})[1] or {}));if Qrc % 2 == 1 then Hcl=(((Kru[1] or {})[2] or {}));end;nw4(CnN,AfU,(((Kru[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Kmf(CnN,AfU,Hcl));end),["nxuoY"]=(function(xq6,OfC,KlP,Kd1)local rqY,Jrm,Yba=0,{},OfC[0x49D0];for Pxs=KlP,Kd1 do rqY=rqY + 1;Jrm[rqY]=Yba[Pxs];end;Jrm.n=rqY;OfC[0x7A35]=Jrm;end),["S"]=(function(XyM,QlV)if QlV == nil or QlV == "" then return "";end;local IfM=XyM.xSW;local WgP,Rcu,XlG,Pbo,ZyF,whF=IfM.string.byte,IfM.string.char,91,IfM.math.floor,IfM.table.concat,XyM.zLalg;local WeN,tgo,eyW,Fbe,raI=-1,0,{},0,0;for Vbi=1,#QlV do local Qmw=whF[WgP(QlV,Vbi)];if Qmw ~= nil then if WeN < 0 then WeN=Qmw;else WeN=WeN + Qmw * XlG;if (WeN % 0x2000) > 88 then tgo=tgo + WeN * (2 ^ Fbe);Fbe=Fbe + 13;else tgo=tgo + WeN * (2 ^ Fbe);Fbe=Fbe + 14;end;while Fbe >= 8 do raI=raI + 1;eyW[raI]=Rcu(tgo % 256);tgo=Pbo(tgo / 256);Fbe=Fbe - 8;end;WeN=-1;end;end;end;if WeN >= 0 then raI=raI + 1;eyW[raI]=Rcu((tgo + WeN * (2 ^ Fbe)) % 256);end;return ZyF(eyW);end),["XZPzC"]=(function(Xrf,xef,Chc,V)if type(xef) ~= "table" then return V or 0;end;V=V or 0;local aeV=V < 0;if not aeV and V == 0 then return V;end;local mns,o3,daN=V,xef[0],0;if type(o3) == "number" and o3 > 0 then for YgV=1,o3 do if not aeV and daN >= mns then break;end;local Dcc=xef[YgV];if Dcc == nil then break;end;daN=daN + 1;V=(Xrf.GP)(Xrf,Dcc,Chc,V);if not aeV and V == 0 then break;end;end;return V;end;local tyY=Xrf.xSW.next or next;for Jza,ayP in tyY,xef do if not aeV and daN >= mns then break;end;daN=daN + 1;V=(Xrf.GP)(Xrf,ayP,Chc,V);if not aeV and V == 0 then break;end;end;return V;end),["" .. "d"]=(function(a)local fnh,hw6={},(a.xSW.setmetatable or setmetatable);local n=hw6({},{["__index"]=(function(Xzo,Vxh)return fnh[Vxh];end),["__newindex"]=(function(Zzi,Bxr,Gxd)fnh[Bxr]=Gxd;end),["__pairs"]=(function()return (function()end);end),["__metatable"]=false});a.f=n;local QQ,jto,boN,II={},{},{},{};local Tt8=(function(agi,Jmy,zqh,PgB)local Bbn=(function(Gbs,VgG,Kbh)return agi(Gbs,VgG,Kbh);end);local Xmp,sla,ZlK=nil,nil,zqh == 1;for NfF=1,#Jmy,2 do local MnS=Jmy[NfF + 1];n[MnS]=ZlK and Bbn or agi;boN[MnS]=Jmy[NfF + 0];if PgB then II[MnS]=true;end;if sla then QQ[sla]=MnS;jto[MnS]=sla;else Xmp=MnS;end;ZlK,sla=not ZlK,MnS;end;QQ[sla]=Xmp;jto[Xmp]=sla;end);local oyV=a.hhiFD;n[0x368B]=oyV;a.hhiFD=nil;local Zmv=a.SVOT;Tt8(Zmv,{0x7C9C,0x65C3,0x6E4F,0x472,0x72C6,0x1729B},1,false);a.SVOT=nil;local emb=a.A;n[0xB0F8]=emb;a.A=nil;local iyB=a.LHP;n[0xE25A]=iyB;a.LHP=nil;local BgK=a.gWQxY;n[0x180EC]=BgK;a.gWQxY=nil;local tmg=a.MrRY;Tt8(tmg,{0x4C11,0x12741,107,0x38F7,0x4EC8,0xFBEC},0,false);a.MrRY=nil;local GgQ=a.Qe;n[0x1AF94]=GgQ;a.Qe=nil;local KgJ=a.VRw;Tt8(KgJ,{0x54FE,0x19A03,0x6484,0x16B47,0x468D,0x1D2F6},1,false);a.VRw=nil;local Qbr=a.cCuO;Tt8(Qbr,{0x56CC,0x15521,0x7DA7,0x1F681},1,false);a.cCuO=nil;local Jbd=a.JtF;Tt8(Jbd,{0x7F98,0xB9D,818,0x16D56,0x5658,0x1AD0E},0,false);a.JtF=nil;local rw7=a.Xy;n[0x12B9E]=rw7;a.Xy=nil;local Xbl=a.wAnP;Tt8(Xbl,{0x68FE,0x155B6,0x160B,0xAE6D,0x6114,0x14163},1,false);a.wAnP=nil;local nyG=a.Yu;n[0x75BD]=nyG;a.Yu=nil;local dw8=a.wqjyh;Tt8(dw8,{678,0xCC67,0x43F,0x7CE3},0,false);a.wqjyh=nil;local syK=a.Ymen;n[0x14FC8]=syK;a.Ymen=nil;local amk=a.kKc;n[0xA7D2]=amk;a.kKc=nil;local ryJ=a.bpL;n[0x16B9D]=ryJ;a.bpL=nil;local imj=a.Ws;Tt8(imj,{0x6F1,0xCDD3,0x4070,0x6C21},0,false);a.Ws=nil;local Zbu=a.NDaS;n[0x1D7F7]=Zbu;a.NDaS=nil;local nmx=a.KWl;n[0x1E606]=nmx;a.KWl=nil;local QgX=a.rFtT;n[0x17C0E]=QgX;a.rFtT=nil;local smz=a.Q;Tt8(smz,{0x4755,0x19511,0x1138,0x75C7,0x897,0x6FE4,0x15E0,0x1F8B4,0x1C08,0x1955D},0,true);a.Q=nil;local JgZ=a.NbsId;Tt8(JgZ,{0x2A1A,0xB2F9,0x5DE8,0x1DDF4,0x4CFF,0x14DA9,0x52FD,0x3051,0xC61,0x187D9},0,true);a.NbsId=nil;local dyX=a.odg;Tt8(dyX,{0x62D0,0x11E77,0x4262,0x18CFA,0x3579,0x11AF0},1,false);a.odg=nil;local lw9=a.WPSsz;Tt8(lw9,{0x2ACA,0x137A7,0x2C59,0x112FD},1,false);a.WPSsz=nil;local lyZ=a.I;n[0x1062C]=lyZ;a.I=nil;local uy0=a.fj;Tt8(uy0,{0x7FC7,0xDB5D,0x2776,0x27ED,0x5F4A,0x1F0FF},0,false);a.fj=nil;local ebc=a.xc;Tt8(ebc,{0xF60,0x14320,0x1856,0x1690,0x2AC1,0x15E38},0,false);a.xc=nil;local uye=a.SuOgo;Tt8(uye,{0x17F9,0x184AF,0x1006,0x9C2F},1,false);a.SuOgo=nil;local Xg0=a.pRaf;n[0xD1E4]=Xg0;a.pRaf=nil;local tbm=a.BmK;n[0x1F13D]=tbm;a.BmK=nil;local Zg1=a.uvxQ;Tt8(Zg1,{0x7F01,0x98D,0x4966,0xC136,0x1B76,0x1446D},0,false);a.uvxQ=nil;local eg2=a.vf;Tt8(eg2,{0x6357,0x19043,0x67A2,0x7F6F,0x2034,0xAFCA},0,false);a.vf=nil;local cyt=a.oyxrb;n[0x107F4]=cyt;a.oyxrb=nil;local cy1=a.HDvRT;n[0x229F]=cy1;a.HDvRT=nil;local mya=a.WfIYA;Tt8(mya,{0x17EB,0x1378D,0x2A36,0x5D45},0,false);a.WfIYA=nil;local my2=a.NW;Tt8(my2,{0x33C1,0x1EF4B,0x2F49,0x856B,0x35FE,0x1034A},0,true);a.NW=nil;local tg3=a.s;Tt8(tg3,{0xF1F,0x10512,0xC9F,0x12993,0x2503,0x1FB54},1,true);a.s=nil;local fyo=a.oP;n[0x8729]=fyo;a.oP=nil;local ag4=a.pHCi;n[0xC5F5]=ag4;a.pHCi=nil;local wy4=a.NBgQ;n[0x1F338]=wy4;a.NBgQ=nil;local yy5=a.enxYq;n[0xC5F]=yy5;a.enxYq=nil;local og5=a.SZO;n[0xA761]=og5;a.SZO=nil;local wyi=a.DgobQ;n[0x11483]=wyi;a.DgobQ=nil;local ig6=a.qT;n[0x18897]=ig6;a.qT=nil;local py6=a.Pk;Tt8(py6,{0x1713,0x15E47,0x5A49,0xD04F},0,false);a.Pk=nil;local yyn=a.ySW;n[0x104D5]=yyn;a.ySW=nil;local abf=a.Yi;Tt8(abf,{0x48E5,0x57FC,0xB9E,0x8E3,0x5E73,0x1816C,0x77CB,0x5FE0,0xF7F,0x169B1},1,true);a.Yi=nil;local elQ,cea,xti=false,0,false;local Mhm,Fhf,Whw;local Wo2,obw=7 - 2 + 1,a.CWU;local function fn7(zq7,iby,vy7)local Yam=vy7[0x1C2C];local ery=Yam and Yam[1];if not ery then return;end;local Yhy=(Yam[3] or 1) - 1;if Yhy <= 0 then local tlJ,Paf=Yam[2] or 0,Yam[4] or 0;cea=(cea * 0xA97D + Paf * 301 + tlJ + 0x17EB) % 0x7FFFFFFF;local xx;if cea % 2 == 0 then xx=QQ[tlJ];else xx=jto[tlJ];end;local trp,Vaw=xx and boN[xx],xx and n[xx];if Vaw and trp then Yam[1]=Vaw;Yam[2]=xx;ery=Vaw;local arv,alX=(((Paf + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,(((Paf + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;Yam[5]=obw.bxor(trp + arv + alX,0x732);end;Yam[3]=2 + (cea % Wo2);else Yam[3]=Yhy;end;return ery(zq7,iby,vy7);end;local function by8(wn8,WW,S,GiJ,yn9)if wn8 == true then cea=(WW or 0) + 0xA4FE;elQ=true;xti=true;return;elseif wn8 == false then Mhm=WW;Fhf=S;Whw=GiJ;cea=(yn9 or 0) + 0xA4FE;elQ=true;xti=false;return;elseif wn8 == nil then return Mhm,Fhf,Whw;end;if not elQ or QQ[S] == nil or (xti and not II[S]) then return GiJ;end;local ng7=(WW * 301 + S + cea + 0x17EB) % 100;if not II[S] and (60 <= 0 or ng7 >= 60) then return GiJ;end;local Lcm=II[S] and 1 or (2 + ((cea + WW + S) % Wo2));wn8[0x1C2C]={GiJ,S,Lcm,WW};return fn7;end;a.jVYRx=by8;return n;end),["Yu"]=(function(gy9,pse,rsP)local NN,FnH,jhQ,WnR=rsP[7],(((((rsP[1] or {})[2] or {})))[0x73CC] or 0),pse[0x49D0],(((rsP[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;if type(NN) == "table" then NN=NN[0x73CC] or (FnH + 1);rsP[7]=NN;elseif type(NN) ~= "number" then NN=(gy9.uJyT)(gy9,NN or "",1) or (FnH + 1);rsP[7]=NN;end;local hm_=jhQ[NN];local Naa=jhQ[WnR] + hm_;jhQ[WnR]=Naa;local Yo3=pse[0x64D8];local kpe=Yo3 and Yo3[WnR];if kpe then kpe[1]=Naa;end;local SfW=jhQ[FnH];if (hm_ > 0 and Naa <= SfW) or (hm_ < 0 and Naa >= SfW) then do local olZ=(((((rsP[1] or {})[1] or {})))[0x73CC] or 0);local Ucf=(pse[157] or 0x3F165C) - (pse[0x4140] or 0x49093);pse[0x3E9C]=Ucf + olZ;end;end;end),["qT"]=(function(ltY,xhJ,Rez)local sg8,pys,rmE=ltY.xSW.table.concat,ltY.XDDn,ltY.f or (ltY.d)(ltY);local Ltp=Rez[7];if type(Ltp) ~= "string" or Ltp == "" then return;end;local HfY=ltY.xSW;local qpt,il0,dmT,lmA,hg9=HfY.string.char,ltY.CWU,(xhJ[157] or 0x3F165C) - (xhJ[0x4140] or 0x49093),HfY.table.concat,HfY.string.byte;local Bay=(xhJ[0x3E9C] or 1) - dmT - 1;if Bay < 1 then return;end;local Php,umO,sl2,nbp,Utv=#Ltp,Bay * 5,{},HfY.math.floor,(((Bay + 0x4195 + 41) * 749) + 0x5256 + 0x31D3 + (Bay * 11)) % 0x10000;for vst=1,Php do local Vhv,hlo=nbp(Utv / 512),hg9(Ltp,Php - vst + 1);local rke=(Utv + (vst * 43) + umO + ((vst % 7) * 19) + Vhv) % 256;sl2[vst]=qpt(il0.bxor(hlo,rke));Utv=(Utv + (hlo * 13) + (vst * 31) + (Bay * 7) + Vhv) % 0x10000;end;if sl2[1] == nil then return;end;local B=pys(ltY,lmA(sl2),Bay);if type(B) ~= "table" then return;end;Rez[4]=B[4];Rez[5]=B[5];Rez[1]=B[1];Rez[7]=B[7];Rez[8]=B[8];Rez[0x43FE]=B[0x43FE];if Rez[0x43FE] then ltY.ciiT=Bay;end;Rez[3]=nil;local Ccw=Rez[4];if Ccw == nil then return;end;local hl3=(((Bay + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local orb,irg=(((Bay + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,il0.bxor(Ccw,0x732) - hl3;local nrk=irg - orb;local Po4=(((il0.bxor(nrk,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local ttH=rmE[Po4];if ttH then local goS=ltY.jVYRx;if goS then ttH=goS(Rez,Bay,Po4,ttH) or ttH;end;Rez[3]=ttH;return (ttH)(ltY,xhJ,Rez);end;end),["hhiFD"]=(function(_q8,dqP,Eq9)end),["oP"]=(function(_ey,Ha4,rl4)local Ra5,Da6,dkt=(_ey.xSW.table and _ey.xSW.table.unpack) or _ey.xSW.unpack,_ey.YgL,_ey.bbmac;if not Ra5 then Ra5=(function(srq,bsa,dl5)bsa=bsa or 1;dl5=dl5 or #srq;if bsa > dl5 then return;end;return srq[bsa],Ra5(srq,bsa + 1,dl5);end);end;local T,hrj,gso=rl4[7],(((((rl4[1] or {})[1] or {})))[0x73CC] or 0),(((rl4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;if type(T) ~= "number" then T=(_ey.uJyT)(_ey,T or "",1) or -1;rl4[7]=T;end;local cmI,H,rrx=Da6(_ey,Ha4,gso),0,{};if hrj < 0 then if T < 0 then T=0;end;for Jxc=1,T do H=H + 1;rrx[H]=Da6(_ey,Ha4,gso + Jxc);end;local mmN=Ha4[0x4AB1] or (gso + T);for lka=gso + T + 1,mmN do H=H + 1;rrx[H]=Da6(_ey,Ha4,lka);end;else for Xxm=1,hrj do H=H + 1;rrx[H]=Da6(_ey,Ha4,gso + Xxm);end;end;local Mcy=_ey.qPCl and _ey.qPCl[cmI];if Mcy then Ha4[0x53C8]={cmI,rrx,["n"]=H};return;end;local function vyh(...)local RfP=select("#",...);local sgr={["n"]=RfP};for vjY=1,RfP do sgr[vjY]=select(vjY,...);end;return sgr;end;local rli=vyh(cmI(Ra5(rrx,1,H)));dkt(_ey,Ha4,rli,rli.n);end),["H"]=(function(fmS,ksi,z,bqt,CyT)local ll,u=ksi[0x49D0],ksi[0x64D8];local ztn=ll[z];if bqt == 1 then if CyT == 1 then ztn();return;elseif CyT == 2 then local Fcp=ztn();ll[z]=Fcp;local jpa=u and u[z];if jpa then jpa[1]=Fcp;end;return;end;elseif bqt == 2 then local xpo=ll[z + 1];if CyT == 1 then ztn(xpo);return;elseif CyT == 2 then local Wcv=ztn(xpo);ll[z]=Wcv;local zpi=u and u[z];if zpi then zpi[1]=Wcv;end;return;end;elseif bqt == 3 then local _pn,Eps=ll[z + 1],ll[z + 2];if CyT == 1 then ztn(_pn,Eps);return;elseif CyT == 2 then local Ycb=ztn(_pn,Eps);ll[z]=Ycb;local Tph=u and u[z];if Tph then Tph[1]=Ycb;end;return;end;elseif bqt == 4 then local Apr,Opd,Ipl=ll[z + 1],ll[z + 3],ll[z + 2];if CyT == 1 then ztn(Apr,Ipl,Opd);return;elseif CyT == 2 then local Pcg=ztn(Apr,Ipl,Opd);ll[z]=Pcg;local Npu=u and u[z];if Npu then Npu[1]=Pcg;end;return;end;end;local utP=(fmS.xSW.table and fmS.xSW.table.unpack) or fmS.xSW.unpack;if not utP then utP=(function(drz,qsn,ul7)qsn=qsn or 1;ul7=ul7 or #drz;if qsn > ul7 then return;end;return drz[qsn],utP(drz,qsn + 1,ul7);end);end;local function wnr(...)return {["n"]=select("#",...),...};end;local zz;if bqt == 0 then zz=ksi[0x4AB1] - z;else zz=bqt - 1;end;if zz < 0 then zz=0;end;local laS;if zz == 0 then if CyT == 1 then ztn();return;end;laS=wnr(ztn());else local ymR={};for bjP=1,zz do ymR[bjP]=ll[z + bjP];end;if CyT == 1 then ztn(utP(ymR,1,zz));return;end;laS=wnr(ztn(utP(ymR,1,zz)));end;local Gap=laS.n or 0;if CyT == 0 then if Gap == 0 then ll[z]=nil;local Spc=u and u[z];if Spc then Spc[1]=nil;end;ksi[0x4AB1]=z - 1;return;end;ksi[0x4AB1]=z + Gap - 1;for gjV=1,Gap do local DfV,LfB=z + gjV - 1,laS[gjV];ll[DfV]=LfB;local Hpm=u and u[DfV];if Hpm then Hpm[1]=LfB;end;end;else for kjB=1,CyT - 1 do local UfG,CfK=laS[kjB],z + kjB - 1;ll[CfK]=UfG;local Rpf=u and u[CfK];if Rpf then Rpf[1]=UfG;end;end;end;end),["XmKnO"]=(function(dsV,Kav,Vo5)if Kav == nil or Kav == "" then return {};end;local Tql=dsV.xSW;local Dpw,lr_,MfQ,Bhb,cki,hgd,urE=1,1,dsV.CWU,(dsV.tMK)(dsV,Kav,Vo5),Tql.string.byte,{},#Vo5;while Dpw <= #Bhb do local Eep;Eep,Dpw=(dsV.M)(dsV,Bhb,Dpw);if Eep == nil then break;end;local byr=cki(Vo5,((lr_ - 1) % urE) + 1);local Qd2=MfQ.bxor((lr_ * 271) + 0x776D,byr);hgd[lr_]=MfQ.bxor(Eep,Qd2);lr_=lr_ + 1;end;return hgd;end),["pRaf"]=(function(Bo6,La7,lsB)local cl8,sbv=Bo6.VoQFv,Bo6.xSW.tonumber;local crT,ml9=(((lsB[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,La7[0x49D0];local Sao,Ua8=ml9[crT],(((((lsB[1] or {})[2] or {})))[0x73CC] or 0);local Hai,pp=ml9[Ua8],lsB[7];if type(pp) == "table" then pp=pp[0x73CC] or (Ua8 + 1);lsB[7]=pp;elseif type(pp) ~= "number" then pp=(Bo6.uJyT)(Bo6,pp or "",1) or (Ua8 + 1);lsB[7]=pp;end;local Go7=ml9[pp];if type(Sao) ~= "number" or type(Hai) ~= "number" or type(Go7) ~= "number" then local Ca9=Bo6.xSW.tonumber or tonumber;if type(Sao) ~= "number" then local dln=Ca9(Sao);if dln == nil then error("invalid 'for' initial value (number expected, got " .. type(Sao) .. ")");end;Sao=dln;cl8(Bo6,La7,crT,Sao);end;if type(Hai) ~= "number" then local lls=Ca9(Hai);if lls == nil then error("invalid 'for' limit (number expected, got " .. type(Hai) .. ")");end;Hai=lls;cl8(Bo6,La7,Ua8,Hai);end;if type(Go7) ~= "number" then local ulh=Ca9(Go7);if ulh == nil then error("invalid 'for' step (number expected, got " .. type(Go7) .. ")");end;Go7=ulh;cl8(Bo6,La7,pp,Go7);end;end;if (Go7 > 0 and Sao > Hai) or (Go7 < 0 and Sao < Hai) then do local fue=(((((lsB[1] or {})[1] or {})))[0x73CC] or 0);local Vck=(La7[157] or 0x3F165C) - (La7[0x4140] or 0x49093);La7[0x3E9C]=Vck + fue;end;end;end),["bpL"]=(function(wut,FfJ,Cpv)local mkn,rbg=wut.cEhvq,wut.VoQFv;rbg(wut,FfJ,(((Cpv[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,mkn(wut,FfJ,(((((Cpv[1] or {})[1] or {})))[0x73CC] or 0)));end),["kKc"]=(function(ctV,zhX,De_)local fks,pmD,vmL=ctV.xSW.table.concat,ctV.f or (ctV.d)(ctV),ctV.XDDn;local Ctb=De_[7];if type(Ctb) ~= "string" or Ctb == "" then return;end;local WfX=ctV.xSW;local gmC,wkh,Mpb,yua,kmM=(zhX[157] or 0x3F165C) - (zhX[0x4140] or 0x49093),WfX.string.byte,WfX.string.char,ctV.CWU,WfX.table.concat;local Qab=(zhX[0x3E9C] or 1) - gmC - 1;if Qab < 1 then return;end;local dbk,Bcq,Mtg,qmF,puo=WfX.math.floor,#Ctb,(((Qab + 0x4195) * 749) + 0x5256 + 0x31D3 + (Qab * 31)) % 0x10000,Qab * 7,{};for _hZ=1,Bcq do local Ghg,clr=dbk(Mtg / 256),wkh(Ctb,_hZ);local ykr=(Mtg + (_hZ * 37) + qmF + Ghg) % 256;puo[_hZ]=Mpb(yua.bxor(clr,ykr));Mtg=(Mtg + (clr * 23) + (_hZ * 13) + (Qab * 5) + Ghg) % 0x10000;end;if puo[1] == nil then return;end;local G=vmL(ctV,kmM(puo),Qab);if type(G) ~= "table" then return;end;De_[4]=G[4];De_[5]=G[5];De_[1]=G[1];De_[7]=G[7];De_[8]=G[8];De_[0x43FE]=G[0x43FE];if De_[0x43FE] then ctV.ciiT=Qab;end;De_[3]=nil;local Gcj=De_[4];if Gcj == nil then return;end;local vui=(((Qab + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local mrA,frO=(((Qab + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,yua.bxor(Gcj,0x732) - vui;local wrI=frO - mrA;local Qo9=(((yua.bxor(wrI,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local atR=pmD[Qo9];if atR then local koH=ctV.jVYRx;if koH then atR=koH(De_,Qab,Qo9,atR) or atR;end;De_[3]=atR;return (atR)(ctV,zhX,De_);end;end),["NW"]=(function(yrN,lbq,vkl)local Ppj=yrN.VoQFv;local bku,bun,uaH=yrN.CWU,yrN.xSW.string.byte,yrN.gN;local gkc,kkm,qkf,jkw=0,0,0,0;if type(uaH) == "string" then gkc=bun(uaH,1) or 0;kkm=bun(uaH,2) or 0;qkf=bun(uaH,3) or 0;jkw=bun(uaH,4) or 0;end;local jmW,gus=(gkc * 609 + kkm * 257 + 0xA620) % 0x10000,(qkf * 647 + jkw * 131 + 0x5C11) % 0x10000;local kuh=(jmW - gus + 0x1B59) % 0x10000;local ubj=(gkc * 17 + kkm * 29 + qkf * 43 + jkw * 59 + 0x183E) % 0x10000;local cbx=(kuh + jmW * 3 + gus * 5 + ubj + 0xA55F) % 0x10000;local lqV=(cbx - kuh + jmW * 11 + gus * 13 + 844) % 0x10000;local prS=kuh;Ppj(yrN,lbq,(((vkl[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,prS);end),["cyO"]=(function(gg,qur,LeE)local jud,Ran=LeE[0xDF3] or 0x2DE1,LeE[0x73CC] or 0;if jud == 0x2E20 then return qur[0x49D0][Ran];elseif jud == 0x55FF then return Ran;elseif jud == 0x51F5 then local vrH=LeE[0x76E1];if vrH ~= nil then if vrH == gg.Y then return nil;end;return vrH;end;gg.sPBr=gg.CWU.bxor(((Ran + 0x4109) * 797 + (gg.ciiT or 0)) % 0x10000,0x8393);gg.fJR=((Ran + (gg.ciiT or 0)) % 4);local Moe=qur[0x540][Ran];gg.sPBr=nil;if Moe == gg.Y then LeE[0x76E1]=gg.Y;return nil;end;LeE[0x76E1]=Moe == nil and gg.Y or Moe;return Moe;elseif jud == 0x5FE7 then local brR=LeE[0x76E1];if brR ~= nil then if brR == gg.Y then return nil;end;return brR;end;gg.sPBr=gg.CWU.bxor(((Ran + 0x4109) * 797 + (gg.ciiT or 0)) % 0x10000,0x8393);gg.fJR=((Ran + (gg.ciiT or 0)) % 4);local PnL=qur[0x540][Ran];gg.sPBr=nil;LeE[0x76E1]=PnL == nil and gg.Y or PnL;return PnL;end;return nil;end),["foqcP"]=(function(Woa,grD,Yoo)if not Woa.YrqrO then return;end;grD=(Woa.vH)(Woa,grD);local Jie,yhW,phY,jss=(Woa.jaJa)(Woa,grD);local Jag=(Woa.uFs)(Woa,Jie,yhW,phY);if Yoo and Yoo ~= 0 then (Woa.XZPzC)(Woa,Jag[0x1B10],Jag[0x47BA],Yoo);end;return {Jag,jss or {}};end),["JVQ"]=(function(VnU,Kcx,xul)local krL=VnU.YrqrO;VnU.YrqrO=Kcx or true;local xmY=(VnU.foqcP)(VnU,Kcx,xul or 0);VnU.YrqrO=krL;return (VnU.pl)(VnU,xmY);end),["BdvHJ"]=(function(zmP,Vpx,gyd)local Aqu=zmP.xSW;local Oqc=Aqu.string.sub;local zuu;zuu,gyd=(zmP.M)(zmP,Vpx,gyd);if zuu == nil then return nil,gyd;end;local mbz=Oqc(Vpx,gyd,gyd + zuu - 1);return mbz or "",gyd + zuu;end),["bbmac"]=(function(Oja,wbE,Bpz,Vf1)local Qcz={["n"]=Vf1 or 0};for qjG=1,Vf1 or 0 do Qcz[qjG]=Bpz[qjG];end;wbE[0x7A35]=Qcz;end),["SZO"]=(function(mtB,Eh0,UeT)local xky,_mV,Gp_=mtB.xSW.table.concat,mtB.f or (mtB.d)(mtB),mtB.XDDn;local Ftk=UeT[7];if type(Ftk) ~= "string" or Ftk == "" then return;end;local KpE=mtB.xSW;local QpT,_uc,EmB,zkp,TmG=KpE.string.char,mtB.CWU,KpE.table.concat,KpE.string.byte,(Eh0[157] or 0x3F165C) - (Eh0[0x4140] or 0x49093);local Poi=(Eh0[0x3E9C] or 1) - TmG - 1;if Poi < 1 then return;end;local OmQ,Von,Jc_,Eum=Poi * 13,(((Poi + 0x4195) * 749) + 0x5256 + 0x31D3) % 0x10000,#Ftk,{};for Th1=1,Jc_ do local mld,_kv=zkp(Ftk,Th1),(Von + (Th1 * 29) + OmQ) % 256;Eum[Th1]=QpT(_uc.bxor(mld,_kv));Von=(Von + (mld * 17) + (Th1 * 11) + Poi) % 0x10000;end;if Eum[1] == nil then return;end;local K=Gp_(mtB,EmB(Eum),Poi);if type(K) ~= "table" then return;end;UeT[4]=K[4];UeT[5]=K[5];UeT[1]=K[1];UeT[7]=K[7];UeT[8]=K[8];UeT[0x43FE]=K[0x43FE];if UeT[0x43FE] then mtB.ciiT=Poi;end;UeT[3]=nil;local XcE=UeT[4];if XcE == nil then return;end;local Tuf=(((Poi + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local jrC,xrM=(((Poi + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,_uc.bxor(XcE,0x732) - Tuf;local zrF=xrM - jrC;local Xit=(((_uc.bxor(zrF,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local otD=_mV[Xit];if otD then local qoR=mtB.jVYRx;if qoR then otD=qoR(UeT,Poi,Xit,otD) or otD;end;UeT[3]=otD;return (otD)(mtB,Eh0,UeT);end;end),["MrRY"]=(function(nn,Ah2,Auw)local Bf2,Iqm,exw,Zia=Ah2[0x49D0],Auw[1],(((Auw[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Ah2[0x64D8];local txy=Iqm[1];local JJ;do local meo=txy;local Ouy,R=meo[0xDF3] or 0x2DE1,meo[0x73CC] or 0;if Ouy == 0x2E20 then JJ=Bf2[R];elseif Ouy == 0x55FF then JJ=R;elseif Ouy == 0x5FE7 then local oeB=meo[0x76E1];if oeB == nil then nn.sPBr=nn.CWU.bxor(((R + 0x4109) * 797 + (nn.ciiT or 0)) % 0x10000,0x8393);nn.fJR=((R + ((((Auw[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (nn.ciiT or 0)) % 4);oeB=Ah2[0x540][R];nn.sPBr=nil;if oeB == nn.Y then meo[0x76E1]=nn.Y;JJ=nil;else meo[0x76E1]=oeB == nil and nn.Y or oeB;JJ=oeB;end;elseif oeB == nn.Y then JJ=nil;else JJ=oeB;end;elseif Ouy == 0x51F5 then local ieG=meo[0x76E1];if ieG == nil then nn.sPBr=nn.CWU.bxor(((R + 0x4109) * 797 + (nn.ciiT or 0)) % 0x10000,0x8393);nn.fJR=((R + ((((Auw[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (nn.ciiT or 0)) % 4);ieG=Ah2[0x540][R];nn.sPBr=nil;if ieG == nn.Y then meo[0x76E1]=nn.Y;JJ=nil;else meo[0x76E1]=ieG == nil and nn.Y or ieG;JJ=ieG;end;elseif ieG == nn.Y then JJ=nil;else JJ=ieG;end;else JJ=nil;end;end;do local Kf4,ynd=JJ,exw;Bf2[ynd]=Kf4;local JpA=Zia and Zia[ynd];if JpA then JpA[1]=Kf4;end;end;end),["bmZJg"]=(function(Bos,Nqf)local pnl=Bos.HyeX;if type(pnl) ~= "string" or pnl == "" then return;end;Bos.HyeX=nil;Bos.xSW=Nqf or Bos.xSW or (_ENV or (getfenv and getfenv()) or _G);pnl=(Bos.vH)(Bos,pnl);local SS=Bos.xSW;local rgl,XpO=((SS and SS.string) or string).sub,((SS and SS.string) or string).byte;if #pnl < 18 then return;end;local Iup=(SS and SS.bit32) or _G.bit32;if not Iup then return;end;local ZpI,Ekb,epN,tpS,ErY,ImJ=252,167,1,251,53,186;local function joD()local Qf5,Nuv=XpO(pnl,epN + 1),XpO(pnl,epN);if not Nuv or not Qf5 or Nuv < 65 or Nuv > 80 or Qf5 < 80 or Qf5 > 95 then return nil;end;epN=epN + 2;return ((Nuv - 65) * 16) + (Qf5 - 80);end;local ZcT=joD();if ZcT == nil then return;end;local function xsh(NmX)local Sub,Hug,TrP=(ZpI + (NmX * ErY)) % 256,0,1;for jjK=1,4 do local fll=joD();if not fll then return nil;end;local Sqw=(Ekb + Sub + (jjK * tpS) + (NmX * ErY)) % 256;local dgu=Iup.bxor(fll,Sqw);Hug=Hug + (dgu * TrP);TrP=TrP * 256;Sub=(Sub + dgu + ImJ + (jjK * NmX)) % 256;end;return Hug;end;local csK,eio=xsh(1),xsh(2);if not csK or not eio then return;end;if ZcT ~= Iup.bxor(169,(csK + eio + ZpI) % 256) then return;end;local Khk=epN;local Zaq=Khk + csK;local ecA=Zaq + eio - 1;if ecA ~= #pnl then return;end;Bos.j=rgl(pnl,Khk,Zaq - 1);Bos.KahX=rgl(pnl,Zaq,ecA);end),["VRw"]=(function(Goh,Oh3,ArV)local ybT,tcO,Tkg=Goh.YgL,Goh.VoQFv,Goh.cyO;tcO(Goh,Oh3,(((ArV[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Tkg(Goh,Oh3,(((ArV[1] or {})[1] or {}))));local __=ArV[7];if type(__) ~= "number" then __=(Goh.uJyT)(Goh,__ or "",1) or 0;ArV[7]=__;end;tcO(Goh,Oh3,(((((ArV[1] or {})[2] or {})))[0x73CC] or 0),ybT(Goh,Oh3,__));end),["tMK"]=(function(OrB,apH,acI)local Jf6=OrB.xSW;local SmZ,opR,ipD,pbA=Jf6.string.byte,Jf6.string.char,Jf6.table.concat,Jf6.math.floor;local function Akk(uqB,cqG)local Ijo,npL=0,1;while uqB > 0 or cqG > 0 do local Hqy,Rqp=uqB % 2,cqG % 2;if Hqy ~= Rqp then Ijo=Ijo + npL;end;uqB=(uqB - Hqy) / 2;cqG=(cqG - Rqp) / 2;npL=npL * 2;end;return Ijo;end;local spU=(OrB.CWU and OrB.CWU.bxor) or Akk;local function Ruk(xjQ)local Hm0=173;for zjJ=1,#xjQ do Hm0=(Hm0 * 131 + SmZ(xjQ,zjJ) + zjJ) % 0x10000;end;return Hm0;end;local Rm1,Dqv=#acI,#apH;if Rm1 == 0 then return "";end;local lgc,neK={},OrB.Re;if neK == nil then neK={};OrB.Re=neK;end;local Kor=neK[acI];if Kor == nil then Kor=Ruk(acI);neK[acI]=Kor;end;local Dm2=Rm1 * 13 % 256;for Ih4=1,Dqv do local kyl=((Ih4 - 1) % Rm1) + 1;local Lqb=SmZ(acI,kyl);local Nji,Uqg=(Kor + pbA(Kor / 256) + Lqb + Dm2) % 256,SmZ(apH,Ih4);lgc[Ih4]=opR(spU(Uqg,Nji));Dm2=Uqg;Kor=(Kor + Lqb * 17 + Ih4 * 11 + Dm2 * 7) % 0x10000;end;return ipD(lgc);end),["GP"]=(function(_ts,zsr,Qhq,ss)if type(zsr) ~= "table" then return ss or 0;end;ss=ss or 0;local Das=ss < 0;if not Das and ss == 0 then return ss;end;local function tii(caR)if type(caR) ~= "table" or (not Das and ss == 0) then return;end;local Ikj=caR[0xDF3] or 0x2DE1;if (_ts.ciiT or 0) <= 0 then return;end;if Ikj == 0x51F5 and caR[0x76E1] == nil then local ain=caR[0x73CC] or 0;_ts.sPBr=_ts.CWU.bxor(((ain + 0x4109) * 797 + (_ts.ciiT or 0)) % 0x10000,0x8393);local IrG=Qhq[ain];_ts.sPBr=nil;caR[0x76E1]=IrG == nil and _ts.Y or IrG;if not Das then ss=ss - 1;end;end;end;tii((_ts.X)(_ts,zsr));tii((_ts.kBi)(_ts,zsr));local hpC=zsr[8];if type(hpC) == "table" then for axp=1,#hpC do ss=(_ts.GP)(_ts,hpC[axp],Qhq,ss);if not Das and ss == 0 then break;end;end;end;return ss;end),["pHCi"]=(function(ftG,Sh6,CeA)local Lm3,Nkx,Skz=ftG.f or (ftG.d)(ftG),ftG.XDDn,ftG.xSW.table.concat;local Wtq=CeA[7];if type(Wtq) ~= "string" or Wtq == "" then return;end;local Xf7=ftG.xSW;local rpM,Uux,Um4,Hk_,Cm5=Xf7.string.char,ftG.CWU,Xf7.table.concat,Xf7.string.byte,(Sh6[157] or 0x3F165C) - (Sh6[0x4140] or 0x49093);local Qod=(Sh6[0x3E9C] or 1) - Cm5 - 1;if Qod < 1 then return;end;local vbO,Cuz,ois=Xf7.math.floor,{},#Wtq;local Mm6,Ytj=(Qod * 41) + (ois * 7),(((Qod + 0x4195 + 29) * 749) + 0x5256 + 0x31D3 + (ois * 17)) % 0x10000;for Hh7=1,ois do local wlu,Jhj=Hk_(Wtq,Hh7),vbO(Ytj / 128);local RkE=(Ytj + (Hh7 * 53) + Mm6 + Jhj) % 256;Cuz[Hh7]=rpM(Uux.bxor(wlu,RkE));Ytj=(Ytj + (wlu * 31) + (Hh7 * 17) + (Qod * 3) + Jhj) % 0x10000;end;if Cuz[1] == nil then return;end;local Q=Nkx(ftG,Um4(Cuz),Qod);if type(Q) ~= "table" then return;end;CeA[4]=Q[4];CeA[5]=Q[5];CeA[1]=Q[1];CeA[7]=Q[7];CeA[8]=Q[8];CeA[0x43FE]=Q[0x43FE];if CeA[0x43FE] then ftG.ciiT=Qod;end;CeA[3]=nil;local icS=CeA[4];if icS == nil then return;end;local Mu_=(((Qod + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local SrQ,HrJ=Uux.bxor(icS,0x732) - Mu_,(((Qod + 0x6E1) * 871) + 0x1F3A) % 0xFFFF;local RrX=SrQ - HrJ;local iih=(((Uux.bxor(RrX,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);local itL=Lm3[iih];if itL then local xoL=ftG.jVYRx;if xoL then itL=xoL(CeA,Qod,iih,itL) or itL;end;CeA[3]=itL;return (itL)(ftG,Sh6,CeA);end;end),["X"]=(function(Hjs,dpF)local ugm=dpF[1];return (type(ugm) == "table" and ugm[2]) or {};end),["hh"]=(function(Ttr,Tev,FuE)if type(Tev) == "table" and not Ttr.r then return;end;Tev=(Ttr.B)(Ttr,Tev);Tev=(Ttr.vH)(Ttr,Tev);Tev=(Ttr.bWvNa)(Ttr,Tev);local DrZ=Ttr.YrqrO;Ttr.YrqrO=Tev or true;local Fm7=(Ttr.foqcP)(Ttr,Tev,FuE);Ttr.YrqrO=DrZ;return Fm7;end),["rN" .. "yj"]=(function(lpW,upY,Cqk)local oxv=0x1244;repeat if not (oxv == 0x1244) then return;else return (lpW.kITuq)(lpW,upY,Cqk);end;until false;end),["HDvRT"]=(function(Rjh,Zf8,cpP)local _jX,ef9,nir,Mqq=(((cpP[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Zf8[0x49D0],Zf8[0x64D8],cpP[1];local tzs=Mqq[1];do local twe,vnu=not ef9[_jX],_jX;ef9[vnu]=twe;local mpV=nir and nir[vnu];if mpV then mpV[1]=twe;end;end;end),["gWQxY"]=(function(Djr,awt,fpB)local gbN,sid,ixb,Fqj=awt[0x49D0],awt[0x64D8],(((fpB[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,fpB[1];local azh=Fqj[1];do local bnc,owa=ixb,true;gbN[bnc]=owa;local wpG=sid and sid[bnc];if wpG then wpG[1]=owa;end;end;end),["VoQFv"]=(function(Ljd,iwo,hil,nwi)iwo[0x49D0][hil]=nwi;local riu=iwo[0x64D8];local ypK=riu and riu[hil];if ypK then ypK[1]=nwi;end;end),["XDDn"]=(function(o,e,msQ)local h=o.CWU;local Lr0,l=(o.M)(o,e,1);local dic=h.bxor(Lr0 or 0,0x680);local wtK=dic;if msQ then local Ur1=(((msQ + 0x6E1) * 871) + 0x1F3A) % 0xFFFF;wtK=wtK - Ur1;end;local Cr2=dic;if msQ then local WuT=(((msQ + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;Cr2=h.bxor(dic + WuT,0x732);else Cr2=h.bxor(dic + 0x402,0x732);end;local Xou={[4]=Cr2};if wtK == 0x2DA9 then local Mr3;Mr3,l=(o.M)(o,e,l);local Fr4,cgf=false,{};for nxg=1,Mr3 or 0 do local _sd;_sd,l=(o.M)(o,e,l);if _sd == nil then break;end;local qyu=o.xSW.string.sub(e,l,l + _sd - 1);l=l + _sd;local YuA=(o.XDDn)(o,qyu);cgf[nxg]=YuA;if YuA and YuA[0x43FE] then Fr4=true;end;end;Xou[8]=cgf;if Fr4 then Xou[0x43FE]=1;end;return Xou;end;local KnF;local jyc;local xym;local b;local t;t,l=(o.M)(o,e,l);local Atd=0x7C6B;if msQ then Atd=(((msQ + 0x29DF) * 311) + 0x7C6B) % 0xFFFF;end;t=h.bxor(t or Atd,Atd);local g=math.floor((t or 0) / 16) % 10;t=(t or 0) % 16;if g == 0 then if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;elseif g == 1 then if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;elseif g == 2 then if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;elseif g == 3 then if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;elseif g == 4 then if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;elseif g == 5 then if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;elseif g == 6 then if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;elseif g == 7 then if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;elseif g == 8 then if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;else if h.band(t,8) ~= 0 then b,l=(o.BdvHJ)(o,e,l);end;if h.band(t,4) ~= 0 then xym,l=(o.xsmjD)(o,e,l);end;if h.band(t,2) ~= 0 then jyc,l=(o.xsmjD)(o,e,l);end;if h.band(t,1) ~= 0 then KnF,l=(o.uJyT)(o,e,l);KnF=(KnF or 3) - 3;end;end;local PP=o.V;if PP == nil then PP={[0xDF3]=0x2DE1,[0x73CC]=0};o.V=PP;end;Xou[5]=(((KnF or 0) * 0xE58) + 0x38F38) % 0xFFFFD;Xou[1]={[2]=jyc or PP,[1]=xym or PP,[3]=(dic % 23)};do local Wqx,Yqz=jyc and jyc[0xDF3],xym and xym[0xDF3];if Wqx == 0x51F5 or Wqx == 0x5FE7 or Yqz == 0x51F5 or Yqz == 0x5FE7 then Xou[0x43FE]=1;end;end;if false then Xou[7]=(o.mlpU)(o,b or "");elseif b and b ~= "" then Xou[7]=b;end;return Xou;end),["bWvNa"]=(function(ytQ,ppQ)local Pq_=ytQ.xSW;local VqE,scR,MeO=Pq_.string.sub,"gclkBFILuU1z7tL",(ytQ.S)(ytQ,ppQ);local lim=#scR;if #MeO <= lim or VqE(MeO,1,lim) ~= scR then return MeO;end;local vpJ=lim + 1;local i4;local Ptx;i4,vpJ=(ytQ.BdvHJ)(ytQ,MeO,vpJ);Ptx,vpJ=(ytQ.BdvHJ)(ytQ,MeO,vpJ);if not i4 or not Ptx or Ptx == "" or vpJ ~= (#MeO + 1) then return MeO;end;return (ytQ.S)(ytQ,(ytQ.tMK)(ytQ,i4,Ptx));end),["ynu"]=(function(n5,kk,uif)local Wm8,Ym9,hws,zyf,ptJ=n5.xSW.xpcall or xpcall,n5.f,n5.CWU,n5.xSW.error or error,(n5.xSW.table and n5.xSW.table.unpack) or n5.xSW.unpack;if not ptJ then ptJ=(function(Wr5,Asc,PuO)Asc=Asc or 1;PuO=PuO or #Wr5;if Asc > PuO then return;end;return Wr5[Asc],ptJ(Wr5,Asc + 1,PuO);end);end;local Vtz=n5.vw;local heJ,Aeb=n5.ciiT,#Vtz + 1;local function Zd5(BqT)return BqT;end;local rcL,reX,dcU,_yw,Pfe,Zhz=0x53C8,0x3E9C,0x7A35,0x43FE,4,3;Vtz[Aeb]=kk;local function Osm(d)if type(d) ~= "table" then return;end;d[0x49D0]=nil;d[0x6435]=nil;d[0x540]=nil;d[reX]=nil;d[157]=nil;d[0x4140]=nil;d[0x4AB1]=nil;d[0x136E]=nil;d[0x2AEC]=nil;d[0x40A0]=nil;d[0x1363]=nil;d[0x7A35]=nil;d[0x53C8]=nil;d[0x46E0]=nil;d[0x7ED2]=nil;end;local function zoU(bb)local lcC,ciw=bb[0x4140],bb[157];if ciw == nil or lcC == nil then ciw=0x3F165C;lcC=0x49093;bb[157]=ciw;bb[0x4140]=lcC;bb[reX]=(bb[reX] or 1) + (ciw - lcC) - 1;end;return ciw - lcC;end;local eh_=zoU(kk);local function DkT(...)return {["n"]=select("#",...),...};end;local function Eyy()while true do local plm=kk[reX];local VV=plm - eh_;local p=uif[VV];if not p then return;end;kk[reX]=plm + 1;if p[_yw] then n5.ciiT=VV;end;local HH=p[Zhz];if not HH then local VuI=(((VV + 0x1552) * 0x6C1) + 0x732) % 0x1FFFF;local Yr6,Pr7=(((VV + 0x6E1) * 871) + 0x1F3A) % 0xFFFF,hws.bxor(p[Pfe] or 0,0x732) - VuI;local Vr8=Pr7 - Yr6;local miy=(((hws.bxor(Vr8,0x66EB) * 0x449) + 0xFD9B) % 0x1FFFF);HH=Ym9[miy];if HH then local _oC=n5.jVYRx;if _oC then HH=_oC(p,VV,miy,HH) or HH;end;p[Zhz]=HH;end;end;if not HH then return;end;HH(n5,kk,p);local Bt_=kk[rcL];if Bt_ then local vhP=kk;kk[rcL]=nil;local vlf=n5.qPCl and n5.qPCl[Bt_[1]];if vlf then kk,uif=vlf(Bt_[2] or {},Bt_.n or 0);eh_=zoU(kk);Vtz[Aeb]=kk;Osm(vhP);end;else local Zoc=kk[dcU];if Zoc then kk[dcU]=nil;return ptJ(Zoc,1,Zoc.n or 0);end;end;end;end;local Mjc,Br9=Wm8((function()return DkT(Eyy());end),Zd5);Osm(kk);Vtz[Aeb]=nil;n5.ciiT=heJ;if not Mjc then zyf(Br9,0);end;return ptJ(Br9,1,Br9.n or 0);end),["a"]=(function(vtX,knf,fip)local ucM=vtX.xSW;local gpZ,BuN,Vft,ccF,Typ=ucM.string.char,ucM.string.byte,ucM.tonumber,ucM.table.concat,ucM.setmetatable or setmetatable;local qnw,GqA=(vtX.BdvHJ)(vtX,knf,1);local r;r,GqA=(vtX.BdvHJ)(vtX,knf,GqA);local q,KiX,Oeg,eaj,fsJ,s=vtX.CWU,(vtX.UW)(vtX,r or ""),{},{},true,vtX;local deZ,le0,ue1=0,0,0;local EoM=s.jVYRx;if EoM then deZ,le0,ue1=EoM(nil);end;deZ=q.bxor(deZ or 0xEF7D,0xEF7D);le0=((le0 or 0xFD8E) - 0xFD8E) % 0x10000;ue1=q.bxor(ue1 or 0x4399,0x4399);local Stm={};local function Kdt(Y,uu)uu=uu or 0;if uu <= 0 then return 0;end;Y=Y or 0;local ce2,GtE=Stm[Y],uu;if ce2 == nil then ce2={};Stm[Y]=ce2;end;local wiv=ce2[uu];if wiv == nil then wiv={};ce2[uu]=wiv;end;local fcY=wiv[GtE];if fcY ~= nil then return fcY;end;local sxk=(((GtE + 0x5725 + deZ) * 293 + (Y * 537) + uu + 0xDA8A + le0 + ue1) % 0x10000);local hxq=((uu + 0x5A25 + le0) * 221 + Y + deZ + q.bxor(ue1,Y % 0x10000)) % 0x10000;local kp0=((q.bxor(sxk,hxq)) + GtE * 17 + Y * 13 + uu * 7 + 0x5AC1) % 0x10000;wiv[GtE]=kp0;return kp0;end;local function bhV(Qda)local rwh=#Qda;if rwh == 0 then return "";end;local dwr=BuN(Qda,rwh);local ntU;if rwh == 1 then ntU="";else local Jdo={};for EjZ=1,rwh - 1 do Jdo[EjZ]=gpZ((BuN(Qda,EjZ) + 93) % 256);end;ntU=ccF(Jdo);end;if dwr == 11 then return Vft(ntU);elseif dwr == 4 then return ntU;elseif dwr == 7 then return ntU == "true";elseif dwr == 6 then return nil;end;return ntU;end;local function Xdi(qp1,btZ,LkA)local yib;local KtT;local maD;local faL;local BeD;local JnY;local wsX;local ysZ;local aa=qp1;yib,aa=(s.M)(s,r,aa);KtT,aa=(s.M)(s,r,aa);maD,aa=(s.M)(s,r,aa);faL,aa=(s.M)(s,r,aa);BeD,aa=(s.M)(s,r,aa);JnY,aa=(s.M)(s,r,aa);wsX,aa=(s.M)(s,r,aa);ysZ,aa=(s.M)(s,r,aa);if yib == nil or KtT == nil or maD == nil or faL == nil or BeD == nil or JnY == nil or wsX == nil or ysZ == nil then return nil;end;local KuH=maD + faL;if KtT < 0 or KuH <= 0 or BeD < 0 then return nil;end;local pig=#fip;if pig == 0 then return nil;end;local Z,waU,ee,qbH=q.bxor(wsX or 0,0x3682),q.bxor(yib,0x351A) % 6,(q.bxor(ysZ or 0,0xD46) % 6) + 1,q.bxor(JnY or 0,0x5D86);local ps0,QuR,jp2,eds=KtT,maD,faL,BeD;local TT,AA;if waU == 0 then TT,AA=aa + ps0,aa + ps0 + QuR;elseif waU == 1 then TT,AA=aa,aa + QuR + ps0 + eds;elseif waU == 2 then TT,AA=aa + jp2 + eds + ps0,aa;elseif waU == 3 then TT,AA=aa + eds,aa + eds + QuR + ps0;elseif waU == 4 then TT,AA=aa,aa + QuR + eds;else TT,AA=aa + jp2 + ps0,aa;end;local tax,XnP=qbH % 4 >= 2 and Z > 0,0;if tax then XnP=Kdt(btZ,Z);end;local JuD=(LkA or 0) % 4;local function Bfa(GeL,ghB,XX)XX=XX or 0;local Gfo=(XnP + (btZ * 31) + (GeL * 213) + 0x3682) % 256;if ee == 1 then return Gfo;elseif ee == 2 then return q.bxor(Gfo,(XnP + GeL * 731 + btZ * 13 + Z * 5 + 0xEE8E) % 256);elseif ee == 3 then return (Gfo + GeL * 29 + btZ * 11 + Z * 3 + 0xEE8E) % 256;elseif ee == 4 then local ed6=((ghB - GeL + 1) * 731 + Z + 0x6A3C) % 256;return q.bxor((XnP + ed6 + btZ * 19) % 256,(Gfo + GeL * 3) % 256);elseif ee == 5 then return (Gfo + ((GeL % 5) + 1) * 17 + Z * 7 + 0xEE8E) % 256;elseif ee == 6 then return q.bxor((Gfo + XX + GeL * 13 + btZ * 9 + Z * 23) % 256,(XnP + XX * 7 + GeL + 0xEE8E) % 256);end;return q.bxor((Gfo + GeL * 13 + btZ * 9 + Z * 23) % 256,(XnP + GeL + 0xEE8E) % 256);end;local function tdh(Kfi,aow,adr)if aow <= 0 then return "";end;local mgw={};local yy;if tax and ee == 6 then yy=(XnP + btZ * 161 + Z * 597 + 0xD7FA) % 256;end;for KqO=1,aow do local MyA,vik=BuN(r,Kfi + KqO - 1),adr + KqO - 1;local xp3=((vik + (btZ * 661) + 0x5276) % pig) + 1;local Fjm=BuN(fip,xp3);local Qfn=(((btZ + 0x4307) * 353) + (vik * 79) + (waU * 19) + 0x791C) % 256;if JuD == 1 then MyA=q.bxor(q.bxor(MyA,Fjm),Qfn);elseif JuD == 2 then MyA=q.bxor(Fjm,q.bxor(MyA,Qfn));else MyA=q.bxor(q.bxor(MyA,Qfn),Fjm);end;if tax then local zp4=Bfa(KqO,aow,yy);if yy ~= nil then yy=((yy * 597) + MyA + KqO * 161 + btZ + Z + 0x216E) % 256;end;if JuD == 3 then MyA=q.bxor(zp4,MyA);else MyA=q.bxor(MyA,zp4);end;end;mgw[KqO]=gpZ(MyA);end;return ccF(mgw);end;local vs1=tdh(TT,maD,1);if faL ~= 0 then local QqI=tdh(AA,faL,maD + 1);vs1=(s.tMK)(s,vs1,QqI);end;return bhV(vs1);end;local function Lah(Nsw)local ooy=Oeg[Nsw];if ooy ~= nil then return ooy[1],ooy[2];end;local wcP;local XuL;local _p5;local Ep6;local td7;local ZnV;local blw;local Ayv;local Htf=Nsw;wcP,Htf=(s.M)(s,r,Htf);XuL,Htf=(s.M)(s,r,Htf);_p5,Htf=(s.M)(s,r,Htf);Ep6,Htf=(s.M)(s,r,Htf);td7,Htf=(s.M)(s,r,Htf);ZnV,Htf=(s.M)(s,r,Htf);blw,Htf=(s.M)(s,r,Htf);Ayv,Htf=(s.M)(s,r,Htf);if ZnV == nil then Oeg[Nsw]={0,0};return 0,0;end;local odd,lwd=q.bxor(blw or 0,0x3682),q.bxor(ZnV,0x5D86);Oeg[Nsw]={lwd,odd};return lwd,odd;end;local function yaC(biq,idl)local ndu=KiX[idl or biq];if not ndu then return;end;local jbR=Lah(ndu);if jbR % 2 == 1 then local gly=Xdi(ndu,biq,0);eaj[biq]=gly == nil and s.Y or gly;end;end;local RR=nil;if qnw ~= "" then RR=(vtX.XmKnO)(vtX,qnw or "",fip);for ycV,sdc in pairs(RR) do yaC(ycV,sdc);end;else for thE in pairs(KiX) do yaC(thE,thE);end;end;local xbD=Typ({},{["__index"]=(function(ozr,Uar)local ad8=s.ciiT or 0;local bs2=q.bxor(((Uar + 0x4109) * 797 + ad8) % 0x10000,0x8393);if s.sPBr ~= bs2 then s.fJR=nil;return nil;end;s.sPBr=nil;local fei=q.bxor(Uar,0x791C) - 0x5E72;local hdm=eaj[fei];if hdm ~= nil then s.fJR=nil;if hdm == s.Y then return nil;end;return hdm;end;local gt0=RR and RR[fei] or fei;if not gt0 then s.fJR=nil;return nil;end;local rdf=KiX[gt0];if not rdf then s.fJR=nil;return nil;end;local zbL,Jfs=Lah(rdf);local UkO,Xfh=s.fJR or 0,fsJ and (zbL % 4 < 2 or Jfs <= 0);s.fJR=nil;local gs3=Xdi(rdf,fei,UkO);if Xfh then eaj[fei]=gs3 == nil and s.Y or gs3;KiX[gt0]=nil;if RR then RR[fei]=nil;end;end;return gs3;end),["__metatable"]={}});return xbD,nil;end),["Yi"]=(function(s6,_bU,Tp7)local Ap8=s6.VoQFv;local pcB=Tp7[7];if type(pcB) ~= "string" then pcB="";end;local enB,ddw=s6.CWU,1;local Ssy;Ssy,ddw=(s6.M)(s6,pcB,ddw);Ssy=Ssy or 1;local vcG,Wjf=(s6.M)(s6,pcB,ddw or 1);vcG=enB.bxor(vcG or 0,0x6151);local qiz;qiz=(s6.BdvHJ)(s6,pcB,Wjf or 1);if type(qiz) ~= "string" then qiz="";end;local jny=s6.r;local Hsp,oa_="",(type(jny) == "string" and #jny or 0) % 0x10000;local ahT,CkI,Op9,Ive,fgy,iop=#Hsp,s6.xSW.string.char,s6.xSW.table.concat,s6.xSW.string.byte,{},(0xC257 + vcG + oa_ + (1 * 0x31F3)) % 256;for MkN=1,#qiz do local QiZ;if ahT > 0 then QiZ=Ive(Hsp,((MkN - 1) % ahT) + 1) or 0;else QiZ=(oa_ + MkN * 915 + vcG) % 256;end;local FkS=(vcG + oa_ * 783 + MkN * 915 + QiZ * 97 + iop + 1 * 0x31F3) % 256;local EbC=(0xC257 + MkN * 635 + iop * 915 + 1 * 0x6151) % 256;local Sva,Rsv=enB.bxor(FkS,EbC),Ive(qiz,MkN) or 0;fgy[MkN]=CkI(enB.bxor(Rsv,Sva));iop=((iop * 635) + Rsv + Sva + QiZ + MkN * 915 + 1 * 0xB0BC) % 256;end;local bcK=Op9(fgy);Ap8(s6,_bU,(((Tp7[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,s6.xSW.string.sub(bcK,Ssy,Ssy + 1));s6.gN=bcK;end),["fj"]=(function(Yjw,cwu,Rvi)local mwc,ji_,wgp,rxj=cwu[0x49D0],cwu[0x64D8],Rvi[1],(((Rvi[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD;local dxx,lxz=wgp[2],wgp[1];do local znv,fwm=rxj,mwc[(lxz[0x73CC] or 0)] * (dxx[0x73CC] or 0);mwc[znv]=fwm;local Dvn=ji_ and ji_[znv];if Dvn then Dvn[1]=fwm;end;end;end),["Ws"]=(function(f,Ji0,ks4)local ux_,Lvs,ygv,ZuU=(((ks4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Ji0[0x64D8],ks4[1],Ji0[0x49D0];local cxE,mxT=ygv[1],ygv[2];local ToF;do local wen=cxE;local D,euC=wen[0x73CC] or 0,wen[0xDF3] or 0x2DE1;if euC == 0x2E20 then ToF=ZuU[D];elseif euC == 0x55FF then ToF=D;elseif euC == 0x5FE7 then local me3=wen[0x76E1];if me3 == nil then f.sPBr=f.CWU.bxor(((D + 0x4109) * 797 + (f.ciiT or 0)) % 0x10000,0x8393);f.fJR=((D + ((((ks4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (f.ciiT or 0)) % 4);me3=Ji0[0x540][D];f.sPBr=nil;if me3 == f.Y then wen[0x76E1]=f.Y;ToF=nil;else wen[0x76E1]=me3 == nil and f.Y or me3;ToF=me3;end;elseif me3 == f.Y then ToF=nil;else ToF=me3;end;elseif euC == 0x51F5 then local fe4=wen[0x76E1];if fe4 == nil then f.sPBr=f.CWU.bxor(((D + 0x4109) * 797 + (f.ciiT or 0)) % 0x10000,0x8393);f.fJR=((D + ((((ks4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (f.ciiT or 0)) % 4);fe4=Ji0[0x540][D];f.sPBr=nil;if fe4 == f.Y then wen[0x76E1]=f.Y;ToF=nil;else wen[0x76E1]=fe4 == nil and f.Y or fe4;ToF=fe4;end;elseif fe4 == f.Y then ToF=nil;else ToF=fe4;end;else ToF=nil;end;end;local ZZ;do local yes=mxT;local tuM,L=yes[0xDF3] or 0x2DE1,yes[0x73CC] or 0;if tuM == 0x2E20 then ZZ=ZuU[L];elseif tuM == 0x55FF then ZZ=L;elseif tuM == 0x5FE7 then local we5=yes[0x76E1];if we5 == nil then f.sPBr=f.CWU.bxor(((L + 0x4109) * 797 + (f.ciiT or 0)) % 0x10000,0x8393);f.fJR=((L + ((((ks4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (f.ciiT or 0)) % 4);we5=Ji0[0x540][L];f.sPBr=nil;if we5 == f.Y then yes[0x76E1]=f.Y;ZZ=nil;else yes[0x76E1]=we5 == nil and f.Y or we5;ZZ=we5;end;elseif we5 == f.Y then ZZ=nil;else ZZ=we5;end;elseif tuM == 0x51F5 then local ye6=yes[0x76E1];if ye6 == nil then f.sPBr=f.CWU.bxor(((L + 0x4109) * 797 + (f.ciiT or 0)) % 0x10000,0x8393);f.fJR=((L + ((((ks4[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD) + (f.ciiT or 0)) % 4);ye6=Ji0[0x540][L];f.sPBr=nil;if ye6 == f.Y then yes[0x76E1]=f.Y;ZZ=nil;else yes[0x76E1]=ye6 == nil and f.Y or ye6;ZZ=ye6;end;elseif ye6 == f.Y then ZZ=nil;else ZZ=ye6;end;else ZZ=nil;end;end;local Uvh=ZuU[ux_];Uvh[ToF]=ZZ;end),["ySW"]=(function(efd,Xi1,Cvr)local gqa,wwf=Xi1[0x136E],efd.VoQFv;local ldy,nov,Zi2=(((((Cvr[1] or {})[1] or {})))[0x73CC] or 0),(((Cvr[5] or 0x38F38) - 0x38F38) * 0xBC2A4) % 0xFFFFD,Xi1[0x136E];local yww=Zi2.n or #Zi2;if ldy < 0 then for Tj0=1,yww do wwf(efd,Xi1,nov + Tj0 - 1,Zi2[Tj0]);end;Xi1[0x4AB1]=nov + yww - 1;else for Aj1=1,ldy do wwf(efd,Xi1,nov + Aj1 - 1,Zi2[Aj1]);end;Xi1[0x4AB1]=nov + ldy - 1;end;end)}):rNyj(getfenv and getfenv() or _ENV or _G);
local moduleRepo = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/"

local MODULE_FILES = {
    shared_runtime     = "shared_runtime.lua",
    fullbright         = "fullbright.lua",
    gun_modification   = "gun_modification.lua",
    EspLib             = "EspLib.lua",
    silent_aim         = "silent_aim.lua",
    attachment_editor  = "attachment_editor.lua",
    auto_shoot         = "auto_shoot.lua",
    misc               = "misc.lua",
}

local moduleCache        = {}
local sharedRuntimeCache = nil
local ESP_MODULE_NAME    = "EspLib"

local function log(msg)
    print("[OP1] " .. tostring(msg))
end

local function loadSharedRuntime()
    if type(sharedRuntimeCache) == "table" then return sharedRuntimeCache end
    local ok, result = pcall(function()
        return loadstring(game:HttpGet(moduleRepo .. MODULE_FILES.shared_runtime))()
    end)
    if not ok or type(result) ~= "table" then
        log("shared runtime failed to load")
        return nil
    end
    sharedRuntimeCache = result
    if type(result.applyToEnv) == "function" then
        pcall(function() result:applyToEnv() end)
    end
    return sharedRuntimeCache
end

local function initModule(name, forceReload)
    local cached = moduleCache[name]
    if cached and cached.initialized and not forceReload then return cached.module end

    local file = MODULE_FILES[name]
    if not file then log("unknown module: " .. tostring(name)) return nil end

    local ok, moduleObj = pcall(function()
        return loadstring(game:HttpGet(moduleRepo .. file))()
    end)
    if not ok or not moduleObj then
        log(name .. " failed to load")
        return nil
    end

    local sharedRuntime = loadSharedRuntime()
    if sharedRuntime then
        sharedRuntime.modules = sharedRuntime.modules or {}
        sharedRuntime.modules[name] = moduleObj
        if type(moduleObj.setShared) == "function" then
            pcall(function() moduleObj:setShared(sharedRuntime) end)
        elseif type(moduleObj) == "table" and moduleObj.shared == nil then
            moduleObj.shared = sharedRuntime
        end
    end

    local okInit, initErr = true, nil
    if type(moduleObj.load) == "function" then
        okInit, initErr = moduleObj:load(forceReload == true)
    elseif type(moduleObj.init) == "function" then
        okInit, initErr = moduleObj:init(forceReload == true)
    end
    if okInit == false then
        log(name .. " init failed")
        return nil
    end

    moduleCache[name] = { initialized = true, module = moduleObj }
    return moduleObj
end

local function withModule(name, callback)
    local moduleObj = initModule(name, false)
    if not moduleObj then return false end
    local ok, result = pcall(callback, moduleObj)
    if not ok then log(name .. " callback error") return false end
    return result ~= false
end

local function withModuleRetry(name, callback, retries)
    retries = retries or 3
    local function attempt(n)
        local moduleObj = initModule(name, false)
        if moduleObj then
            local ok, result = pcall(callback, moduleObj)
            if ok and result ~= false then return end
        end
        if n > 1 then
            task.delay(0.5, function() attempt(n - 1) end)
        else
            log(name .. " gave up after retries")
        end
    end
    attempt(retries)
end

local function setSilentAim(state)
    withModule("silent_aim", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setSilentAimFov(value)
    withModule("silent_aim", function(m)
        if type(m.setFov) == "function" then m:setFov(value) end
    end)
end
local function setSilentAimSmoothness(value)
    withModule("silent_aim", function(m)
        if type(m.setSmoothness) == "function" then m:setSmoothness(value) end
    end)
end
local function setSilentAimMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setMode) == "function" then m:setMode(mode) end
    end)
end
local function setAimAssistActivation(mode)
    withModule("silent_aim", function(m)
        if type(m.setAimAssistActivation) == "function" then m:setAimAssistActivation(mode) end
    end)
end
local function setSilentAimTargetMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setTargetMode) == "function" then m:setTargetMode(mode) end
    end)
end
local function setSilentAimTeamCheck(state)
    withModule("silent_aim", function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state) end
    end)
end
local function setSilentAimTargetGadgets(state)
    withModule("silent_aim", function(m)
        if type(m.setTargetGadgets) == "function" then m:setTargetGadgets(state) end
    end)
end
local function setSilentAimVisibleCheck(state)
    withModule("silent_aim", function(m)
        if type(m.setVisibleCheck) == "function" then m:setVisibleCheck(state) end
    end)
end
local function setSilentAimFovCircleVisual(state)
    withModule("silent_aim", function(m)
        if type(m.setFovCircleVisible) == "function" then m:setFovCircleVisible(state) end
    end)
end
local function setSilentAimSnaplines(state)
    withModule("silent_aim", function(m)
        if type(m.setSnaplinesEnabled) == "function" then m:setSnaplinesEnabled(state) end
    end)
end
local function setSilentAimSnaplineOrigin(value)
    withModule("silent_aim", function(m)
        if type(m.setSnaplineOrigin) == "function" then m:setSnaplineOrigin(value) end
    end)
end
local function setSilentAimSnaplineColor(color)
    withModule("silent_aim", function(m)
        if type(m.setSnaplineColor) == "function" then m:setSnaplineColor(color) end
    end)
end

local function setAutoShoot(state)
    withModule("auto_shoot", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setAutoShootDelay(value)
    withModule("auto_shoot", function(m)
        if type(m.setDelay) == "function" then m:setDelay(value) end
    end)
end
local function setAutoShootTeamCheck(state)
    withModule("auto_shoot", function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state) end
    end)
end
local function setAutoShootTargetGadgets(state)
    withModule("auto_shoot", function(m)
        if type(m.setTargetGadgets) == "function" then m:setTargetGadgets(state) end
    end)
end
local function setAutoShootActivation(mode)
    withModule("auto_shoot", function(m)
        if type(m.setActivation) == "function" then m:setActivation(mode) end
    end)
end

local function setGunModEnabled(state)
    withModule("gun_modification", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setGunModConfig(key, value)
    withModule("gun_modification", function(m)
        if type(m.updateConfig) == "function" then
            m:updateConfig({ [key] = value })
        elseif type(m.config) == "table" then
            m.config[key] = value
        end
    end)
end

local function setEspEnabled(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state)
        elseif m.Enabled ~= nil then m.Enabled = state == true end
    end)
end
local function setEspTeamCheck(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state)
        elseif m.Drawing and m.Drawing.TeamCheck then m.Drawing.TeamCheck.Enabled = state == true end
    end)
end
local function setEspPlayers(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setPlayerBoxEnabled) == "function" then m:setPlayerBoxEnabled(state)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Full then
            m.Drawing.Boxes.Full.Enabled = state == true
        end
    end)
end
local function setEspCorners(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Enabled = state == true
        end
    end)
end
local function setEspFilled(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Filled then
            m.Drawing.Boxes.Filled.Enabled = state == true
        end
    end)
end
local function setEspBoxGradient(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.Gradient = state == true end
    end)
end
local function setEspBoxAnimate(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.Animate = state == true end
    end)
end
local function setEspBoxGradientFill(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFill = state == true end
    end)
end
local function setEspHealthBar(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.HealthBar then m.Drawing.HealthBar.Enabled = state == true end
    end)
end
local function setEspSkeleton(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonEnabled) == "function" then m:setSkeletonEnabled(state)
        elseif type(m.ToggleSkeleton) == "function" then m.ToggleSkeleton(state)
        elseif m.Drawing and m.Drawing.Skeleton then m.Drawing.Skeleton.Enabled = state == true end
    end)
end
local function setEspNames(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Names then m.Drawing.Names.Enabled = state == true end
    end)
end
local function setEspDistances(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Distances then m.Drawing.Distances.Enabled = state == true end
    end)
end
local function setEspWeapons(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.Enabled = state == true end
    end)
end

local function setShootWhileRunning(state)
    withModule("misc", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setEspWeaponIcons(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.IconEnabled = state == true end
    end)
end
local function setEspWeaponIconSize(size)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons and type(size) == "number" and size > 0 then
            m.Drawing.Weapons.IconSize = size
        end
    end)
end
local function setEspChams(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.Enabled = state == true end
    end)
end
local function setEspChamsThermal(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.Thermal = state == true end
    end)
end
local function setEspChamsVisibleCheck(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.VisibleCheck = state == true end
    end)
end
local function setEspOffscreenArrows(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleOffscreenArrows) == "function" then m.ToggleOffscreenArrows(state)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Enabled = state == true end
    end)
end
local function setEspOffscreenArrowsColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsColor) == "function" then m.SetOffscreenArrowsColor(color)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.RGB = color end
    end)
end
local function setEspOffscreenArrowsSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsSize) == "function" then m.SetOffscreenArrowsSize(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Size = value end
    end)
end
local function setEspOffscreenArrowsTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsTransparency) == "function" then m.SetOffscreenArrowsTransparency(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Transparency = value end
    end)
end
local function setEspOffscreenArrowsShowDistance(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleOffscreenArrowsDistance) == "function" then m.ToggleOffscreenArrowsDistance(state)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.ShowDistance = state == true end
    end)
end
local function setEspTracers(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleTracers) == "function" then m.ToggleTracers(state)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.Enabled = state == true end
    end)
end
local function setEspTracersOrigin(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetTracersOrigin) == "function" then m.SetTracersOrigin(value)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.Origin = value end
    end)
end
local function setEspOffscreenArrowsDistanceColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsDistanceColor) == "function" then m.SetOffscreenArrowsDistanceColor(color)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.DistanceRGB = color end
    end)
end
local function setEspOffscreenArrowsDistanceFontSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsDistanceFontSize) == "function" then m.SetOffscreenArrowsDistanceFontSize(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.DistanceFontSize = value end
    end)
end
local function setEspFadeOut(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.FadeOut then m.FadeOut.OnDistance = state == true end
    end)
end
local function setEspMaxDistance(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.MaxDistance ~= nil then m.MaxDistance = tonumber(value) or m.MaxDistance end
    end)
end
local function setEspFontSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.FontSize ~= nil then m.FontSize = math.floor(tonumber(value) or m.FontSize) end
    end)
end
local function setEspCornerThickness(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetCornerThickness) == "function" then m.SetCornerThickness(value)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Thickness = tonumber(value) or m.Drawing.Boxes.Corner.Thickness
        end
    end)
end
local function setEspCornerLength(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetCornerLength) == "function" then m.SetCornerLength(value)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Length = tonumber(value) or m.Drawing.Boxes.Corner.Length
        end
    end)
end
local function setEspSkeletonThickness(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonThickness) == "function" then m:setSkeletonThickness(value)
        elseif type(m.SetSkeletonThickness) == "function" then m.SetSkeletonThickness(value)
        elseif m.Drawing and m.Drawing.Skeleton then
            m.Drawing.Skeleton.Thickness = tonumber(value) or m.Drawing.Skeleton.Thickness
        end
    end)
end
local function setEspBoxRotationSpeed(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then
            m.Drawing.Boxes.RotationSpeed = tonumber(value) or m.Drawing.Boxes.RotationSpeed
        end
    end)
end
local function setEspFilledTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Filled then
            m.Drawing.Boxes.Filled.Transparency = tonumber(value) or m.Drawing.Boxes.Filled.Transparency
        end
    end)
end
local function setEspChamsFillTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then
            m.Drawing.Chams.Fill_Transparency = tonumber(value) or m.Drawing.Chams.Fill_Transparency
        end
    end)
end
local function setEspChamsOutlineTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then
            m.Drawing.Chams.Outline_Transparency = tonumber(value) or m.Drawing.Chams.Outline_Transparency
        end
    end)
end
local function setEspPlayerColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setPlayerColor) == "function" then m:setPlayerColor(color)
        elseif m.Drawing and m.Drawing.Boxes then
            if m.Drawing.Boxes.Corner then m.Drawing.Boxes.Corner.RGB = color end
            if m.Drawing.Boxes.Full   then m.Drawing.Boxes.Full.RGB   = color end
            m.Drawing.Boxes.GradientRGB1     = color
            m.Drawing.Boxes.GradientFillRGB1 = color
        end
    end)
end
local function setEspGradientEndColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientRGB2 = color end
    end)
end
local function setEspFillGradientStartColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFillRGB1 = color end
    end)
end
local function setEspFillGradientEndColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFillRGB2 = color end
    end)
end
local function setEspNameColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Names then m.Drawing.Names.RGB = color end
    end)
end
local function setEspSkeletonColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonColor) == "function" then m:setSkeletonColor(color)
        elseif type(m.SetSkeletonColor) == "function" then m.SetSkeletonColor(color)
        elseif m.Drawing and m.Drawing.Skeleton then m.Drawing.Skeleton.RGB = color end
    end)
end
local function setEspWeaponColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.RGB = color end
    end)
end
local function setEspDistanceColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Distances then m.Drawing.Distances.RGB = color end
    end)
end
local function setEspChamsFillColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.FillRGB = color end
    end)
end
local function setEspChamsOutlineColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.OutlineRGB = color end
    end)
end
local function setEspTracersColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetTracersColor) == "function" then m.SetTracersColor(color)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.RGB = color end
    end)
end

local function setEspObjectEnabled(key, state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        local fn = m["Toggle" .. key .. "Chams"]
        if type(fn) == "function" then fn(state) return end
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspObjectColor(key, color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        local fillFn    = m["Set" .. key .. "ChamsFill"]
        local outlineFn = m["Set" .. key .. "ChamsOutline"]
        if type(fillFn)    == "function" then fillFn(color) end
        if type(outlineFn) == "function" then outlineFn(color) end
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].FillRGB    = color
            m.ObjectChams[key].OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspObjectTransparency(key, value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].FillTrans    = tonumber(value) or 0.5
            m.ObjectChams[key].OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspObjectNamesEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Names then
            m.ObjectChams.Names.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspDroneEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.ToggleDroneChams) == "function" then m.ToggleDroneChams(state) return true end
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspClaymoreEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.ToggleClaymoreChams) == "function" then m.ToggleClaymoreChams(state) return true end
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspDroneColor(color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.SetDroneChamsFill)    == "function" then m.SetDroneChamsFill(color) end
        if type(m.SetDroneChamsOutline) == "function" then m.SetDroneChamsOutline(color) end
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.FillRGB    = color
            m.ObjectChams.Drones.OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspClaymoreColor(color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.SetClaymoreChamsFill)    == "function" then m.SetClaymoreChamsFill(color) end
        if type(m.SetClaymoreChamsOutline) == "function" then m.SetClaymoreChamsOutline(color) end
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.FillRGB    = color
            m.ObjectChams.Claymores.OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspDroneTransparency(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.FillTrans    = tonumber(value) or 0.5
            m.ObjectChams.Drones.OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspClaymoreTransparency(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.FillTrans    = tonumber(value) or 0.5
            m.ObjectChams.Claymores.OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspGadgetsEnabled(state)
    setEspDroneEnabled(state)
    setEspClaymoreEnabled(state)
    for _, key in ipairs({
        "ProximityAlarm","StickyCamera","RemoteC4","ThermiteCharge","ToxicCharge",
        "BreachCharge","HardBreachCharge","ShockBattery","DeployableShield",
        "BarbedWire","SignalDisruptor","BulletproofCamera",
    }) do
        setEspObjectEnabled(key, state)
    end
end

local function setRadarFlag(key, state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar[key] ~= nil then
            m.Radar[key] = state == true
            return true
        end
        return false
    end)
end
local function setRadarNumber(key, value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and type(m.Radar[key]) == "number" then
            m.Radar[key] = value
            return true
        end
        return false
    end)
end
local function setRadarPositionX(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Position then
            m.Radar.Position = Vector2.new(value, m.Radar.Position.Y)
            return true
        end
        return false
    end)
end
local function setRadarPositionY(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Position then
            m.Radar.Position = Vector2.new(m.Radar.Position.X, value)
            return true
        end
        return false
    end)
end
local function setRadarThemeColor(key, color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Theme and typeof(color) == "Color3" then
            m.Radar.Theme[key] = color
            return true
        end
        return false
    end)
end

local function setFullbright(state)
    withModule("fullbright", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state)
        elseif type(m.toggle) == "function" then m:toggle() end
    end)
end
local function setFullbrightSetting(key, value)
    withModule("fullbright", function(m)
        if type(m.setSetting) == "function" then m:setSetting(key, value) end
    end)
end

local function setAttachmentEditorOption(key, value)
    withModule("attachment_editor", function(m)
        if type(m.setOption) == "function" then m:setOption(key, value)
        elseif type(m.updateConfig) == "function" then m:updateConfig({ [key] = value }) end
    end)
end
local function applyAttachmentEditor()
    withModule("attachment_editor", function(m)
        if type(m.applyAll) == "function" then
            local ok, err = m:applyAll()
            if ok == false then error(err) end
        end
    end)
end

local function applyDefaults()
    setSilentAim(false); setSilentAimFov(60); setSilentAimSmoothness(1)
    setSilentAimMode("silent"); setSilentAimTeamCheck(true)
    setAimAssistActivation("mb2"); setSilentAimTargetMode("custom_parts")
    setSilentAimTargetGadgets(false); setSilentAimVisibleCheck(false)
    setSilentAimFovCircleVisual(true)
    setSilentAimSnaplines(false); setSilentAimSnaplineOrigin("Center")
    setAutoShoot(false); setAutoShootDelay(0); setAutoShootTeamCheck(true); setAutoShootTargetGadgets(false); setAutoShootActivation("always")
  
    setGunModEnabled(false); setGunModConfig("recoil_reduction", 0)
    setGunModConfig("horizontal_recoil", 0); setGunModConfig("no_spread", false)
    setGunModConfig("force_auto", false)

    setEspEnabled(false); setEspTeamCheck(false); setEspPlayers(false)
    setEspCorners(false); setEspFilled(false); setEspBoxGradient(true)
    setEspBoxAnimate(false); setEspBoxGradientFill(true); setEspHealthBar(false)
    setEspSkeleton(false); setEspFadeOut(false); setEspNames(false)
    setEspDistances(false); setEspWeapons(false); setEspWeaponIcons(false); setEspChams(false)
    setEspChamsThermal(false); setEspChamsVisibleCheck(false)
    setEspMaxDistance(1000); setEspFontSize(11); setEspCornerThickness(1)
    setEspTracers(false); setEspTracersOrigin("Bottom")
    setEspOffscreenArrows(false); setEspOffscreenArrowsSize(10); setEspOffscreenArrowsTransparency(1)
    setEspOffscreenArrowsShowDistance(true); setEspOffscreenArrowsDistanceFontSize(12)
    setEspCornerLength(15); setEspSkeletonThickness(1); setEspBoxRotationSpeed(300)
    setEspFilledTransparency(0.75); setEspChamsFillTransparency(50)
    setEspChamsOutlineTransparency(50)

    setEspPlayerColor(Color3.fromRGB(255,255,255))
    setEspGradientEndColor(Color3.fromRGB(0,0,0))
    setEspFillGradientStartColor(Color3.fromRGB(255,255,255))
    setEspFillGradientEndColor(Color3.fromRGB(0,0,0))
    setEspSkeletonColor(Color3.fromRGB(255,255,255))
    setEspNameColor(Color3.fromRGB(255,255,255))
    setEspDistanceColor(Color3.fromRGB(255,255,255))
    setEspWeaponColor(Color3.fromRGB(255,255,255))
    setEspWeaponIconSize(15)
    setEspChamsFillColor(Color3.fromRGB(255,80,80))
    setEspChamsOutlineColor(Color3.fromRGB(255,255,255))
    setEspOffscreenArrowsColor(Color3.fromRGB(255,255,255))
    setEspOffscreenArrowsDistanceColor(Color3.fromRGB(255,255,255))
    setEspTracersColor(Color3.fromRGB(255,255,255))
    setSilentAimSnaplineColor(Color3.fromRGB(255,255,255))

    setEspGadgetsEnabled(false); setEspObjectNamesEnabled(false)
    setEspDroneTransparency(0.5); setEspClaymoreTransparency(0.5)
    setEspDroneColor(Color3.fromRGB(0,255,255))
    setEspClaymoreColor(Color3.fromRGB(255,0,0))

    setRadarFlag("Enabled", false); setRadarFlag("Lines", true)
    setRadarFlag("Rotation", false); setRadarFlag("SmoothRot", true)
    setRadarFlag("CardinalDisplay", true); setRadarFlag("ShowOffscreen", true)
    setRadarFlag("DisplayTeammates", false); setRadarFlag("DisplayTeamColors", true)
    setRadarFlag("DisplayFriendColors", true); setRadarFlag("DisplayRGBColors", false)
    setRadarFlag("MarkerFalloff", true); setRadarFlag("UseFallback", false)
    setRadarFlag("UseQuads", true); setRadarFlag("UseTeamColors", false)
    setRadarFlag("VisibilityCheck", false)
    setRadarNumber("LineDistance", 50); setRadarNumber("Scale", 1)
    setRadarNumber("Radius", 120); setRadarNumber("Range", 300)
    setRadarNumber("SmoothRotAmnt", 30); setRadarNumber("MarkerSize", 2)
    setRadarNumber("MarkerScaleBase", 1); setRadarNumber("MarkerScaleMax", 1)
    setRadarNumber("MarkerScaleMin", 0.75); setRadarNumber("MarkerFalloffAmnt", 125)
    setRadarNumber("OffscreenTransparency", 0.3); setRadarNumber("SelfDotSize", 2)
    setRadarPositionX(170); setRadarPositionY(170)
    setRadarThemeColor("Outline",        Color3.fromRGB(35,35,45))
    setRadarThemeColor("Background",     Color3.fromRGB(25,25,35))
    setRadarThemeColor("DragHandle",     Color3.fromRGB(50,50,255))
    setRadarThemeColor("Cardinal_Lines", Color3.fromRGB(110,110,120))
    setRadarThemeColor("Distance_Lines", Color3.fromRGB(65,65,75))
    setRadarThemeColor("Generic_Marker", Color3.fromRGB(255,25,115))
    setRadarThemeColor("Local_Marker",   Color3.fromRGB(115,25,255))
    setRadarThemeColor("Team_Marker",    Color3.fromRGB(25,115,255))
    setRadarThemeColor("Friend_Marker",  Color3.fromRGB(25,255,115))

    setFullbright(false); setFullbrightSetting("Brightness", 1)
    setFullbrightSetting("ClockTime", 12); setFullbrightSetting("FogEnd", 786543)
    setFullbrightSetting("GlobalShadows", false)
    setFullbrightSetting("Ambient", Color3.fromRGB(178,178,178))

    setAttachmentEditorOption("fixSkins", false)
    setAttachmentEditorOption("skin", "Default")
    setAttachmentEditorOption("charm", "Default")
end

local function runStartupInit()
    local initOrder = { "silent_aim", "auto_shoot", "gun_modification", "misc", ESP_MODULE_NAME, "fullbright" }
    for _, name in ipairs(initOrder) do initModule(name, false) end
    applyDefaults()
    log("init complete")
end


local function buildNeverloseUi()
    local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()
    
    local Notification = NeverLose:CreateNotification()
    local Logging = NeverLose:CreateLogger()
    local Indicator = NeverLose:CreateIndicator()
    local window = NeverLose:CreateWindow({
        Logo = "rbxassetid://13129527031",
        Name = "ASTRO.WTF",
        Content = "Operation One",
        Size = NeverLose.Scales.Default,
        ConfigFolder = "AstroOp1",
        Enable3DRenderer = true,
        Keybind = "RightShift"
    })

    local Watermark = window:Watermark()
    local discordBlock = Watermark:AddBlock("discord", "discord.gg/NtBMqWXySm")

    discordBlock:Input(function()
        if setclipboard then
            setclipboard("https://discord.gg/NtBMqWXySm")
            Notification.new({ Title = "ASTRO.WTF", Content = "Discord link copied to clipboard!", Duration = 3 })
        end
    end)

    task.spawn(function()
        while task.wait(1) do
            local pingVal = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            pingBlock:SetText(tostring(pingVal) .. "MS")
        end
    end)

    window:AddTabLabel('COMBAT')
    local RageTab = window:AddTab({ Icon = 'crosshairs', Name = "Aim" })
    
    window:AddTabLabel('VISUALS')
    local VisualsTab = window:AddTab({ Icon = 'eye', Name = "Visuals" })
    local RadarTab = window:AddTab({ Icon = 'location-pin-map', Name = "Radar" })
    
    window:AddTabLabel('MISC')
    local GadgetsTab = window:AddTab({ Icon = 'backpack', Name = "Gadgets" })
    local LocalTab = window:AddTab({ Icon = 'person', Name = "Local" })

    -- COMBAT / RAGE TAB
    local AimMain = RageTab:AddSection({ Name = "MAIN" })
    local AimSettings = RageTab:AddSection({ Name = "SETTINGS", Position = 'left' })
    local AimWeapon = RageTab:AddSection({ Name = "WEAPON", Position = 'right' })

    AimMain:AddLabel("Silent Aim"):AddToggle({ Default = false, Callback = setSilentAim, Flag = "sa_enabled" })
    AimMain:AddLabel("Team Check"):AddToggle({ Default = true, Callback = setSilentAimTeamCheck, Flag = "sa_team" })
    AimMain:AddLabel("Visible Check"):AddToggle({ Default = false, Callback = setSilentAimVisibleCheck, Flag = "sa_vis" })
    AimMain:AddLabel("Target Gadgets"):AddToggle({ Default = false, Callback = setSilentAimTargetGadgets, Flag = "sa_targ_gad" })
    AimMain:AddLabel("FOV Circle"):AddToggle({ Default = true, Callback = setSilentAimFovCircleVisual, Flag = "sa_fov_circ" })
    local sa_snap_lbl = AimMain:AddLabel("Snaplines")
    sa_snap_lbl:AddToggle({ Default = false, Callback = setSilentAimSnaplines, Flag = "sa_snap" })
    pcall(function() sa_snap_lbl:AddColorPicker({ Default = Color3.fromRGB(255,255,255), Callback = setSilentAimSnaplineColor, Flag = "sa_snap_clr" }) end)

    AimSettings:AddLabel("FOV Radius"):AddSlider({ Min = 10, Max = 400, Default = 60, Callback = setSilentAimFov, Flag = "sa_fov" })
    AimSettings:AddLabel("Smoothness"):AddSlider({ Min = 1, Max = 100, Default = 100, Type = "%", Size = 95, Callback = function(v) setSilentAimSmoothness(v / 100) end, Flag = "sa_smooth" })
    AimSettings:AddLabel("Aim Mode"):AddDropdown({ Values = { "silent", "aim_assist", "rage" }, Default = "silent", Callback = setSilentAimMode, Flag = "sa_mode" })
    AimSettings:AddLabel("Activation"):AddDropdown({ Values = { "mb2", "mb1", "always", "mobile_hold", "mobile_toggle" }, Default = "mb2", Callback = setAimAssistActivation, Flag = "sa_act" })
    AimSettings:AddLabel("Target Mode"):AddDropdown({ Values = { "custom_parts", "head_only" }, Default = "custom_parts", Callback = setSilentAimTargetMode, Flag = "sa_targ" })
    AimSettings:AddLabel("Snapline Origin"):AddDropdown({ Values = { "Top", "Center", "Bottom" }, Default = "Center", Callback = setSilentAimSnaplineOrigin, Flag = "sa_snap_orig" })

    AimWeapon:AddLabel("Auto Shoot"):AddToggle({ Default = false, Callback = setAutoShoot, Flag = "as_enabled" })
    AimWeapon:AddLabel("Shoot While Running"):AddToggle({ Default = false, Callback = setShootWhileRunning, Flag = "as_run" })
    AimWeapon:AddLabel("TriggerBot Delay"):AddSlider({ Min = 0, Max = 200, Default = 0, Type = "ms", Size = 95, Callback = setAutoShootDelay, Flag = "as_delay" })
    AimWeapon:AddLabel("TriggerBot Team"):AddToggle({ Default = true, Callback = setAutoShootTeamCheck, Flag = "as_team" })
    AimWeapon:AddLabel("TriggerBot Gadgets"):AddToggle({ Default = false, Callback = setAutoShootTargetGadgets, Flag = "as_gadgets" })
    AimWeapon:AddLabel("TriggerBot Activation"):AddDropdown({ Values = { "always", "mb1", "mb2", "mobile_hold", "mobile_toggle" }, Default = "always", Callback = setAutoShootActivation, Flag = "as_act" })

    AimWeapon:AddLabel("Gun Mod"):AddToggle({ Default = false, Callback = setGunModEnabled, Flag = "gm_enabled" })
    AimWeapon:AddLabel("Recoil Reduction"):AddSlider({ Min = 0, Max = 100, Default = 0, Type = "%", Size = 95, Callback = function(v) setGunModConfig("recoil_reduction", v / 100) end, Flag = "gm_recoil" })
    AimWeapon:AddLabel("Horizontal Recoil"):AddSlider({ Min = 0, Max = 100, Default = 0, Type = "%", Size = 95, Callback = function(v) setGunModConfig("horizontal_recoil", v / 100) end, Flag = "gm_hrecoil" })
    AimWeapon:AddLabel("No Spread"):AddToggle({ Default = false, Callback = function(v) setGunModConfig("no_spread", v) end, Flag = "gm_spread" })
    AimWeapon:AddLabel("Force Automatic"):AddToggle({ Default = false, Callback = function(v) setGunModConfig("force_auto", v) end, Flag = "gm_auto" })

    -- VISUALS TAB
    local EspMain = VisualsTab:AddSection({ Name = "ESP", Position = 'left' })
    local EspStyle = VisualsTab:AddSection({ Name = "STYLE", Position = 'right' })
    local Lighting = VisualsTab:AddSection({ Name = "LIGHTING", Position = 'left' })

    local esp_label = EspMain:AddLabel("ESP Enabled")
    esp_label:AddToggle({ Default = false, Callback = setEspEnabled, Flag = "esp_enabled" })
    pcall(function() esp_label:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspPlayerColor, Flag = "esp_clr" }) end)

    local esp_opt = esp_label:AddOption()
    esp_opt:AddLabel("Team Check"):AddToggle({ Default = false, Callback = setEspTeamCheck, Flag = "esp_team" })
    esp_opt:AddLabel("Box Full"):AddToggle({ Default = false, Callback = setEspPlayers, Flag = "esp_boxf" })
    esp_opt:AddLabel("Box Corner"):AddToggle({ Default = false, Callback = setEspCorners, Flag = "esp_boxc" })
    esp_opt:AddLabel("Box Fill"):AddToggle({ Default = false, Callback = setEspFilled, Flag = "esp_fill" })
    
    local esp_grad_lbl = esp_opt:AddLabel("Box Gradient")
    esp_grad_lbl:AddToggle({ Default = true, Callback = setEspBoxGradient, Flag = "esp_grad" })
    pcall(function() esp_grad_lbl:AddColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspGradientEndColor, Flag = "esp_grad_end" }) end)

    esp_opt:AddLabel("Box Animate"):AddToggle({ Default = false, Callback = setEspBoxAnimate, Flag = "esp_boxa" })

    local esp_fill_grad_lbl = esp_opt:AddLabel("Box Fill Gradient")
    esp_fill_grad_lbl:AddToggle({ Default = true, Callback = setEspBoxGradientFill, Flag = "esp_fill_g" })
    pcall(function() esp_fill_grad_lbl:AddColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspFillGradientEndColor, Flag = "esp_fill_end" }) end)

    esp_opt:AddLabel("Health Bar"):AddToggle({ Default = false, Callback = setEspHealthBar, Flag = "esp_hp" })
    
    local esp_skel = EspMain:AddLabel("Skeleton")
    esp_skel:AddToggle({ Default = false, Callback = setEspSkeleton, Flag = "esp_skel" })
    pcall(function() esp_skel:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspSkeletonColor, Flag = "esp_skel_clr" }) end)

    local name_lbl = EspMain:AddLabel("Names")
    name_lbl:AddToggle({ Default = false, Callback = setEspNames, Flag = "esp_names" })
    pcall(function() name_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspNameColor, Flag = "esp_nm_clr" }) end)
    
    local dist_lbl = EspMain:AddLabel("Distance")
    dist_lbl:AddToggle({ Default = false, Callback = setEspDistances, Flag = "esp_dist" })
    pcall(function() dist_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspDistanceColor, Flag = "esp_dist_clr" }) end)

    local wep_lbl = EspMain:AddLabel("Weapon")
    wep_lbl:AddToggle({ Default = false, Callback = setEspWeapons, Flag = "esp_wep" })
    pcall(function() wep_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspWeaponColor, Flag = "esp_wep_clr" }) end)

    EspMain:AddLabel("Weapon Icons"):AddToggle({ Default = false, Callback = setEspWeaponIcons, Flag = "esp_wepi" })
    
    local esp_chams = EspMain:AddLabel("Chams")
    esp_chams:AddToggle({ Default = false, Callback = setEspChams, Flag = "esp_chams" })
    pcall(function() esp_chams:AddColorPicker({ Default = Color3.fromRGB(243, 116, 166), Callback = setEspChamsFillColor, Flag = "esp_chams_clr" }) end)

    local chm_opt = esp_chams:AddOption()
    chm_opt:AddLabel("Chams Thermal"):AddToggle({ Default = false, Callback = setEspChamsThermal, Flag = "esp_chm_therm" })
    chm_opt:AddLabel("Chams Vis Check"):AddToggle({ Default = false, Callback = setEspChamsVisibleCheck, Flag = "esp_chm_vis" })
    
    local chm_out_lbl = chm_opt:AddLabel("Chams Outline")
    pcall(function() chm_out_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspChamsOutlineColor, Flag = "esp_chm_out" }) end)

    local trc_lbl = EspMain:AddLabel("Tracers")
    trc_lbl:AddToggle({ Default = false, Callback = setEspTracers, Flag = "esp_tracers" })
    pcall(function() trc_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspTracersColor, Flag = "esp_trc_clr" }) end)

    local arr_lbl = EspMain:AddLabel("Offscreen Arrows")
    arr_lbl:AddToggle({ Default = false, Callback = setEspOffscreenArrows, Flag = "esp_off" })
    pcall(function() arr_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsColor, Flag = "esp_off_clr" }) end)

    local arr_opt = arr_lbl:AddOption()
    local arr_dist_lbl = arr_opt:AddLabel("Show Distance")
    arr_dist_lbl:AddToggle({ Default = true, Callback = setEspOffscreenArrowsShowDistance, Flag = "esp_arr_dist" })
    pcall(function() arr_dist_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsDistanceColor, Flag = "esp_arr_dclr" }) end)

    EspStyle:AddLabel("Max Distance"):AddSlider({ Min = 100, Max = 3000, Default = 1000, Callback = setEspMaxDistance, Flag = "es_dist" })
    EspStyle:AddLabel("Font Size"):AddSlider({ Min = 8, Max = 24, Default = 11, Callback = setEspFontSize, Flag = "es_font" })
    EspStyle:AddLabel("Corner Len"):AddSlider({ Min = 5, Max = 35, Default = 15, Callback = setEspCornerLength, Flag = "es_corn" })
    EspStyle:AddLabel("Corner Thick"):AddSlider({ Min = 1, Max = 10, Default = 1, Callback = setEspCornerThickness, Flag = "es_cthk" })
    EspStyle:AddLabel("Fill Trans"):AddSlider({ Min = 0, Max = 100, Default = 75, Type = "%", Size = 95, Callback = function(v) setEspFilledTransparency(v / 100) end, Flag = "es_fill_trn" })
    EspStyle:AddLabel("Box Rot Speed"):AddSlider({ Min = 0, Max = 1000, Default = 300, Callback = setEspBoxRotationSpeed, Flag = "es_rot" })
    EspStyle:AddLabel("Skel Thick"):AddSlider({ Min = 1, Max = 10, Default = 1, Callback = setEspSkeletonThickness, Flag = "es_sthk" })
    EspStyle:AddLabel("Wep Icon Size"):AddSlider({ Min = 5, Max = 40, Default = 15, Callback = setEspWeaponIconSize, Flag = "es_wisz" })
    EspStyle:AddLabel("Chams Fill Trn"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 95, Callback = function(v) setEspChamsFillTransparency(v / 100) end, Flag = "es_cftrn" })
    EspStyle:AddLabel("Chams Out Trn"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 95, Callback = function(v) setEspChamsOutlineTransparency(v / 100) end, Flag = "es_cotrn" })
    EspStyle:AddLabel("Arrow Size"):AddSlider({ Min = 5, Max = 50, Default = 10, Callback = setEspOffscreenArrowsSize, Flag = "es_asz" })
    EspStyle:AddLabel("Arrow Trans"):AddSlider({ Min = 0, Max = 100, Default = 100, Type = "%", Size = 95, Callback = function(v) setEspOffscreenArrowsTransparency(v / 100) end, Flag = "es_atrn" })
    EspStyle:AddLabel("Arr Font Size"):AddSlider({ Min = 8, Max = 24, Default = 12, Callback = setEspOffscreenArrowsDistanceFontSize, Flag = "es_afsz" })
    EspStyle:AddLabel("Tracer Origin"):AddDropdown({ Values = { "Top", "Center", "Bottom" }, Default = "Bottom", Callback = setEspTracersOrigin, Flag = "es_tr_orig" })

    Lighting:AddLabel("Fullbright"):AddToggle({ Default = false, Callback = setFullbright, Flag = "fb_on" })
    Lighting:AddLabel("FPS Boost"):AddToggle({ Default = false, Callback = function(v) withModule("fullbright", function(m) m:setFpsBoostEnabled(v) end) end, Flag = "fb_fps" })
    Lighting:AddLabel("Brightness"):AddSlider({ Min = 0, Max = 500, Default = 100, Type = "%", Size = 95, Callback = function(v) setFullbrightSetting("Brightness", v / 100) end, Flag = "fb_bright" })
    Lighting:AddLabel("Clock Time"):AddSlider({ Min = 0, Max = 24, Default = 12, Callback = function(v) setFullbrightSetting("ClockTime", v) end, Flag = "fb_clock" })
    Lighting:AddLabel("Fog End"):AddSlider({ Min = 1000, Max = 1000000, Default = 786543, Callback = function(v) setFullbrightSetting("FogEnd", v) end, Flag = "fb_fog" })
    Lighting:AddLabel("Global Shadows"):AddToggle({ Default = false, Callback = function(v) setFullbrightSetting("GlobalShadows", v) end, Flag = "fb_shad" })
    local amb_lbl = Lighting:AddLabel("Ambient Color")
    pcall(function() amb_lbl:AddColorPicker({ Default = Color3.fromRGB(178,178,178), Callback = function(c) setFullbrightSetting("Ambient", c) end, Flag = "fb_amb" }) end)

    -- RADAR TAB
    local RadCore = RadarTab:AddSection({ Name = "CORE", Position = 'left' })
    local RadStyle = RadarTab:AddSection({ Name = "STYLE", Position = 'right' })
    local RadTheme = RadarTab:AddSection({ Name = "THEME", Position = 'right' })

    RadCore:AddLabel("Enabled"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Enabled", v) end, Flag = "r_en" })
    RadCore:AddLabel("Lines"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("Lines", v) end, Flag = "r_lin" })
    RadCore:AddLabel("Rotation"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Rotation", v) end, Flag = "r_rot" })
    RadCore:AddLabel("Smooth Rot"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("SmoothRot", v) end, Flag = "r_smrt" })
    RadCore:AddLabel("Cardinal"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("CardinalDisplay", v) end, Flag = "r_card" })
    RadCore:AddLabel("Offscreen"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("ShowOffscreen", v) end, Flag = "r_shof" })
    RadCore:AddLabel("Teammates"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("DisplayTeammates", v) end, Flag = "r_tmat" })
    RadCore:AddLabel("Team Colors"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("DisplayTeamColors", v) end, Flag = "r_tcol" })
    RadCore:AddLabel("Friend Colors"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("DisplayFriendColors", v) end, Flag = "r_fcol" })
    RadCore:AddLabel("RGB Colors"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("DisplayRGBColors", v) end, Flag = "r_rgb" })
    RadCore:AddLabel("Marker Falloff"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("MarkerFalloff", v) end, Flag = "r_mfall" })
    RadCore:AddLabel("Use Quads"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("UseQuads", v) end, Flag = "r_quad" })
    RadCore:AddLabel("Vis Check"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("VisibilityCheck", v) end, Flag = "r_vis" })
    RadCore:AddLabel("Fallback"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("UseFallback", v) end, Flag = "r_fallb" })
    RadCore:AddLabel("Team Colors (2)"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("UseTeamColors", v) end, Flag = "r_tc2" })

    RadStyle:AddLabel("Radius"):AddSlider({ Min = 50, Max = 400, Default = 120, Callback = function(v) setRadarNumber("Radius", v) end, Flag = "r_rad" })
    RadStyle:AddLabel("Range"):AddSlider({ Min = 50, Max = 1000, Default = 300, Callback = function(v) setRadarNumber("Range", v) end, Flag = "r_rng" })
    RadStyle:AddLabel("Scale"):AddSlider({ Min = 10, Max = 500, Default = 100, Type = "%", Size = 95, Callback = function(v) setRadarNumber("Scale", v / 100) end, Flag = "r_scale" })
    RadStyle:AddLabel("Marker Size"):AddSlider({ Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("MarkerSize", v) end, Flag = "r_msz" })
    RadStyle:AddLabel("Self Dot"):AddSlider({ Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("SelfDotSize", v) end, Flag = "r_sdot" })
    RadStyle:AddLabel("Line Dist"):AddSlider({ Min = 1, Max = 200, Default = 50, Callback = function(v) setRadarNumber("LineDistance", v) end, Flag = "r_ldist" })
    RadStyle:AddLabel("Smooth Amt"):AddSlider({ Min = 0, Max = 100, Default = 30, Callback = function(v) setRadarNumber("SmoothRotAmnt", v) end, Flag = "r_smamt" })
    RadStyle:AddLabel("Falloff Amt"):AddSlider({ Min = 1, Max = 500, Default = 125, Callback = function(v) setRadarNumber("MarkerFalloffAmnt", v) end, Flag = "r_fallamt" })
    RadStyle:AddLabel("Offscr Trans"):AddSlider({ Min = 0, Max = 100, Default = 30, Type = "%", Size = 95, Callback = function(v) setRadarNumber("OffscreenTransparency", v / 100) end, Flag = "r_offtrn" })
    RadStyle:AddLabel("Pos X"):AddSlider({ Min = 0, Max = 2000, Default = 170, Callback = setRadarPositionX, Flag = "r_px" })
    RadStyle:AddLabel("Pos Y"):AddSlider({ Min = 0, Max = 1200, Default = 170, Callback = setRadarPositionY, Flag = "r_py" })

    local rt_out = RadTheme:AddLabel("Outline")
    pcall(function() rt_out:AddColorPicker({ Default = Color3.fromRGB(35,35,45), Callback = function(c) setRadarThemeColor("Outline", c) end, Flag = "rt_out" }) end)
    local rt_bg = RadTheme:AddLabel("Background")
    pcall(function() rt_bg:AddColorPicker({ Default = Color3.fromRGB(25,25,35), Callback = function(c) setRadarThemeColor("Background", c) end, Flag = "rt_bg" }) end)
    local rt_drag = RadTheme:AddLabel("Drag Handle")
    pcall(function() rt_drag:AddColorPicker({ Default = Color3.fromRGB(50,50,255), Callback = function(c) setRadarThemeColor("DragHandle", c) end, Flag = "rt_drag" }) end)
    local rt_card = RadTheme:AddLabel("Cardinal Lines")
    pcall(function() rt_card:AddColorPicker({ Default = Color3.fromRGB(110,110,120), Callback = function(c) setRadarThemeColor("Cardinal_Lines", c) end, Flag = "rt_card" }) end)
    local rt_dlin = RadTheme:AddLabel("Dist Lines")
    pcall(function() rt_dlin:AddColorPicker({ Default = Color3.fromRGB(65,65,75), Callback = function(c) setRadarThemeColor("Distance_Lines", c) end, Flag = "rt_dlin" }) end)
    local rt_gen = RadTheme:AddLabel("Generic Marker")
    pcall(function() rt_gen:AddColorPicker({ Default = Color3.fromRGB(255,25,115), Callback = function(c) setRadarThemeColor("Generic_Marker", c) end, Flag = "rt_gen" }) end)
    local rt_loc = RadTheme:AddLabel("Local Marker")
    pcall(function() rt_loc:AddColorPicker({ Default = Color3.fromRGB(115,25,255), Callback = function(c) setRadarThemeColor("Local_Marker", c) end, Flag = "rt_loc" }) end)
    local rt_team = RadTheme:AddLabel("Team Marker")
    pcall(function() rt_team:AddColorPicker({ Default = Color3.fromRGB(25,115,255), Callback = function(c) setRadarThemeColor("Team_Marker", c) end, Flag = "rt_team" }) end)
    local rt_fri = RadTheme:AddLabel("Friend Marker")
    pcall(function() rt_fri:AddColorPicker({ Default = Color3.fromRGB(25,255,115), Callback = function(c) setRadarThemeColor("Friend_Marker", c) end, Flag = "rt_fri" }) end)

    -- GADGETS TAB
    local GadChams = GadgetsTab:AddSection({ Name = "GADGET CHAMS", Position = 'left' })
    local GadColors = GadgetsTab:AddSection({ Name = "GADGET COLORS & TRANS", Position = 'right' })

    GadChams:AddLabel("Object Labels"):AddToggle({ Default = false, Callback = setEspObjectNamesEnabled, Flag = "g_names" })
    
    local gadgetKeys = {
        { key = "Drones", label = "Drone Chams", fn = setEspDroneEnabled },
        { key = "Claymores", label = "Claymore Chams", fn = setEspClaymoreEnabled },
        { key = "ProximityAlarm", label = "Proximity Alarm", fn = function(v) setEspObjectEnabled("ProximityAlarm", v) end },
        { key = "StickyCamera", label = "Sticky Camera", fn = function(v) setEspObjectEnabled("StickyCamera", v) end },
        { key = "RemoteC4", label = "Remote C4", fn = function(v) setEspObjectEnabled("RemoteC4", v) end },
        { key = "ThermiteCharge", label = "Thermite Charge", fn = function(v) setEspObjectEnabled("ThermiteCharge", v) end },
        { key = "ToxicCharge", label = "Toxic Charge", fn = function(v) setEspObjectEnabled("ToxicCharge", v) end },
        { key = "BreachCharge", label = "Breach Charge", fn = function(v) setEspObjectEnabled("BreachCharge", v) end },
        { key = "HardBreachCharge", label = "Hard Breach", fn = function(v) setEspObjectEnabled("HardBreachCharge", v) end },
        { key = "ShockBattery", label = "Shock Battery", fn = function(v) setEspObjectEnabled("ShockBattery", v) end },
        { key = "DeployableShield", label = "Deployable Shield", fn = function(v) setEspObjectEnabled("DeployableShield", v) end },
        { key = "BarbedWire", label = "Barbed Wire", fn = function(v) setEspObjectEnabled("BarbedWire", v) end },
        { key = "SignalDisruptor", label = "Signal Disruptor", fn = function(v) setEspObjectEnabled("SignalDisruptor", v) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera", fn = function(v) setEspObjectEnabled("BulletproofCamera", v) end },
    }

    for _, g in ipairs(gadgetKeys) do
        GadChams:AddLabel(g.label):AddToggle({ Default = false, Callback = g.fn, Flag = "g_" .. g.key })
    end

    local defaultGadgetColors = {
        Drones            = Color3.fromRGB(0, 255, 255),
        Claymores         = Color3.fromRGB(255, 0, 0),
        ProximityAlarm    = Color3.fromRGB(255, 150, 0),
        StickyCamera      = Color3.fromRGB(0, 200, 255),
        RemoteC4          = Color3.fromRGB(255, 50, 50),
        ThermiteCharge    = Color3.fromRGB(255, 120, 0),
        ToxicCharge       = Color3.fromRGB(80, 255, 80),
        BreachCharge      = Color3.fromRGB(255, 80, 80),
        HardBreachCharge  = Color3.fromRGB(200, 80, 255),
        ShockBattery      = Color3.fromRGB(255, 255, 0),
        DeployableShield  = Color3.fromRGB(100, 180, 255),
        BarbedWire        = Color3.fromRGB(180, 140, 80),
        SignalDisruptor   = Color3.fromRGB(80, 80, 255),
        BulletproofCamera = Color3.fromRGB(0, 255, 200),
    }

    local gadgetTargets = {
        { key = "Drones", label = "Drone", colorFn = setEspDroneColor, transFn = function(v) setEspDroneTransparency(v/100) end },
        { key = "Claymores", label = "Claymore", colorFn = setEspClaymoreColor, transFn = function(v) setEspClaymoreTransparency(v/100) end },
        { key = "ProximityAlarm", label = "Proximity Alarm", colorFn = function(c) setEspObjectColor("ProximityAlarm", c) end, transFn = function(v) setEspObjectTransparency("ProximityAlarm", v/100) end },
        { key = "StickyCamera", label = "Sticky Camera", colorFn = function(c) setEspObjectColor("StickyCamera", c) end, transFn = function(v) setEspObjectTransparency("StickyCamera", v/100) end },
        { key = "RemoteC4", label = "Remote C4", colorFn = function(c) setEspObjectColor("RemoteC4", c) end, transFn = function(v) setEspObjectTransparency("RemoteC4", v/100) end },
        { key = "ThermiteCharge", label = "Thermite Charge", colorFn = function(c) setEspObjectColor("ThermiteCharge", c) end, transFn = function(v) setEspObjectTransparency("ThermiteCharge", v/100) end },
        { key = "ToxicCharge", label = "Toxic Charge", colorFn = function(c) setEspObjectColor("ToxicCharge", c) end, transFn = function(v) setEspObjectTransparency("ToxicCharge", v/100) end },
        { key = "BreachCharge", label = "Breach Charge", colorFn = function(c) setEspObjectColor("BreachCharge", c) end, transFn = function(v) setEspObjectTransparency("BreachCharge", v/100) end },
        { key = "HardBreachCharge", label = "Hard Breach", colorFn = function(c) setEspObjectColor("HardBreachCharge", c) end, transFn = function(v) setEspObjectTransparency("HardBreachCharge", v/100) end },
        { key = "ShockBattery", label = "Shock Battery", colorFn = function(c) setEspObjectColor("ShockBattery", c) end, transFn = function(v) setEspObjectTransparency("ShockBattery", v/100) end },
        { key = "DeployableShield", label = "Deployable Shield", colorFn = function(c) setEspObjectColor("DeployableShield", c) end, transFn = function(v) setEspObjectTransparency("DeployableShield", v/100) end },
        { key = "BarbedWire", label = "Barbed Wire", colorFn = function(c) setEspObjectColor("BarbedWire", c) end, transFn = function(v) setEspObjectTransparency("BarbedWire", v/100) end },
        { key = "SignalDisruptor", label = "Signal Disruptor", colorFn = function(c) setEspObjectColor("SignalDisruptor", c) end, transFn = function(v) setEspObjectTransparency("SignalDisruptor", v/100) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera", colorFn = function(c) setEspObjectColor("BulletproofCamera", c) end, transFn = function(v) setEspObjectTransparency("BulletproofCamera", v/100) end },
    }

    for _, t in ipairs(gadgetTargets) do
        local lbl = GadColors:AddLabel(t.label)
        pcall(function() lbl:AddColorPicker({ Default = defaultGadgetColors[t.key] or Color3.new(1,1,1), Callback = t.colorFn, Flag = "gc_" .. t.key }) end)
        local opt = lbl:AddOption()
        opt:AddLabel("Transparency"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 90, Callback = t.transFn, Flag = "gt_" .. t.key })
    end

    -- LOCAL TAB
    local SkinS = LocalTab:AddSection({ Name = "SKIN CHANGER", Position = 'left' })
    local CharmS = LocalTab:AddSection({ Name = "CHARM CHANGER", Position = 'right' })
    local LocalMisc = LocalTab:AddSection({ Name = "MISC", Position = 'left' })

    SkinS:AddLabel("Weapon Skin"):AddDropdown({ 
        Values = { "Default","TidalWaveAK","CherryBlossom","RoyalCAL12","RedLineAW50","RedLineReaper","BlueFlowers","Synthwave","TigerCamo","Toxic","ToyGunM4","YellowPattern","RedRoses","BlackCamo","Blue","CarbonFiber","Cardboard","CheckeredSkin","ClassicAA12","CrackedEarth","DarkRedCamo","DeepRed","DesertCamo","Diamond","FestiveLightsM4","ForestCamo","FrenchSticker","Ghillie","GhostShipSkin","GhostSkin","GhostStickerSkin","Golden","Green","HalloweenParty","HazardMP7","HazardSkin","HotRedL85","Kalash","MakeshiftBeretta","NeonShapesM249","OilSpill","PurpleFadeC775","Red","RustyAUG","Skulls","SnowCamo","Space","SpiderWebSkin","Splattered","Steyr","Tan","WastelandRSh12","White","Yellow" }, 
        Default = "Default", 
        Callback = function(v) setAttachmentEditorOption("skin", v) end, 
        Flag = "lc_skin" 
    })

    CharmS:AddLabel("Charm"):AddDropdown({ 
        Values = { "Default","DiamondBurgerCharm","FishCharm","GoldMedal","GoldenTrophy","HourglassCharm","JussisCharm","LoveHeart","MedalTVCharm","NXTCharm","StaffCharm","TSKCharm","WalkieTalkieCharm","YinYangCharm","8BallCharm","AceCard","BananaCharm","BellCharm","BlueBall","BulletCharm","ChristmasTreeCharm","ColorfulSquares","DiamondCharm","DogTagCharm","EyeballCharm","GhostCharm","LuckyCharm","PumpkinCharm","S1Bronze","S1Champion","S1Diamond","S1Gold","S1Platinum","S1Silver","S2Bronze","S2Champion","S2Diamond","S2Gold","S2Platinum","S2Silver","SnowGlobeCharm","SnowflakeCharm","TargetPracticeCharm" }, 
        Default = "Default", 
        Callback = function(v) setAttachmentEditorOption("charm", v) end, 
        Flag = "lc_charm" 
    })

    LocalMisc:AddLabel("Fix Skins"):AddToggle({ 
        Default = false, 
        Callback = function(v) setAttachmentEditorOption("fixSkins", v) end, 
        Flag = "lc_fix" 
    })

    LocalMisc:AddButton({
        Icon = 'check',
        Name = "Apply Skin / Charm",
        Callback = function()
            pcall(applyAttachmentEditor)
            Notification.new({ Title = "Skin Changer", Content = "Applied successfully!", Duration = 3 })
        end
    })

    -- USER SETTINGS / CONFIG
    window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({ Default = 'RightShift', Callback = function(v) window.Keybind = v end })
    window.UserSettings:AddLabel("Menu Scale"):AddDropdown({ Values = {"Default", "Large", "Mobile", "Small"}, Default = "Default", Callback = function(v) window:SetSize(NeverLose.Scales[v]) end })
    window.UserSettings:AddLabel("3D Menu"):AddToggle({ Default = false, Callback = function(v) pcall(function() window:Set3DRender(v) end) end })
    window.UserSettings:AddButton({
        Icon = 'x',
        Name = "Unload Script",
        Callback = function()
            pcall(setSilentAim, false)
            pcall(setAutoShoot, false)
            pcall(setEspEnabled, false)
            pcall(setEspGadgetsEnabled, false)
            pcall(setRadarFlag, "Enabled", false)
            pcall(setFullbright, false)
            pcall(setGunModEnabled, false)
            NeverLose.UnloadEnabled = true
            task.wait(0.1)
            pcall(function() NeverLose:Unload() end)
        end
    })

    Notification.new({
        Title = "ASTRO.WTF",
        Content = "Loaded successfully!",
        Duration = 5,
    })
end

local okInit, initErr = pcall(runStartupInit)
if not okInit then log("startup init failed") end

local okUi, uiErr = pcall(buildNeverloseUi)
if not okUi then log("UI build failed: " .. tostring(uiErr)) end

pcall(function() game:GetService("WebViewService"):Destroy() end)
warn("init1")

