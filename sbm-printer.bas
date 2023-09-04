 8110 data 480
 8114 data 960
 8118 data 960
 8122 data 1920
 8127 data 640
 8131 data 0
 8133 data 720
 8137 clr
 8139 dimk(1920)
 8148 dimz(6)
 8155 open4,4,7
 8160 cmd4,;
 8162 printchr$(27);
 8165 printchr$(65);
 8169 print#4,chr$(8)
 8172 gosub8815
 8175 input"filename";fi$
 8189 open8,8,8,fi$
 8195 i=1
 8197 fori=ito6
 8201 get#8,a$
 8205 id$=(id$+a$)
 8209 next
 8210 if(left$(id$,3)<>"gfx")then:print"Invalid Bitmap":close8:end
 8240 get#8,a$
 8244 get#8,b$
 8248 wi=(asc((a$+chr$(0)))+(asc((b$+chr$(0)))*256))
 8264 n1=asc((a$+chr$(0)))
 8270 n2=asc((b$+chr$(0)))
 8276 get#8,a$
 8280 li=asc((a$+chr$(0)))
 8286 print"{clr}{down}File = {gry3}";
 8299 printfi$
 8301 print"{lblu}Width={gry3}";
 8312 printwi;
 8314 print"{lblu}dots"
 8321 print"{lblu}Lines={gry3}";
 8332 printli
 8334 get#8,a$
 8338 if(asc(a$)<>13)then:print"{lred}Invalid":end
 8356 gosub8956
 8359 print
 8360 gosub8506
 8363 print"{rvon}{pur}PRINTING"
 8376 w2=0
 8378 w1=wi
 8380 if(rl(va)=>wi)then8413
 8388 w2=(wi-rl(va))
 8394 w1=rl(va)
 8398 n2=int((w1/256))
 8405 n1=(w1-(n2*256))
 8413 i=1
 8415 fori=itoli
 8419 cmd4,;
 8421 printchr$(27);
 8424 printchr$(42);
 8428 printchr$(va);
 8431 printchr$(n1);
 8434 printchr$(n2);
 8437 print#4,;
 8438 j=1
 8440 forj=jtow1
 8444 get#8,k$
 8448 k(j)=asc((k$+chr$(0)))
 8456 next
 8457 j=1
 8459 forj=jtow1
 8463 cmd4,;
 8465 printchr$(k(j));
 8470 print#4,;
 8471 next
 8472 cmd4,;
 8474 printchr$(13);
 8477 print#4,;
 8478 if(w2>0)then:l=0:forl=ltow2:get#8,a$:next
 8494 next
 8495 close8
 8497 cmd4,;
 8499 print#4,""
 8501 close4
 8503 goto8763
 8506 print"{clr}{lblu}{down}{down}{down}{down}   I hope you enjoy this SuperBitMap!"
 8552 print"Look for more at the {red}*{lred}FlagShip{red}*{lblu} on GEnie"
 8599 printtab(13)
 8601 print"{down} Mike Hooper"
 8617 printtab(14)
 8619 print" GRAFIX.M"
 8631 print"{down}{down}Copyright 1987 by Michael Hooper"
 8668 print"{down}Permission granted for redistribution"
 8709 print"on any non-commercial telecommunication"
 8751 print"system.{down}"
 8762 return
 8763 print"{up}{rvon}";
 8767 print"{yel}Print Another? (Y/N)"
 8791 geta$
 8793 if(a$="")then8791
 8799 if((a$="y")or(a$="Y"))then:restore:goto8155
 8814 end
 8815 print"{clr}";
 8818 poke53280,0
 8826 poke53281,0
 8834 printchr$(14);
 8837 print"{down}{lgrn}SuperBitMap Print"
 8859 print"{down}";
 8862 print"{lblu}Be sure your interface is set to pass"
 8903 print"all characters with {yel}NO{lblu} translation.{down}"
 8944 i=0
 8946 fori=ito6
 8950 readrl(i)
 8954 next
 8955 return
 8956 print
 8957 print"{yel}Default is printer mode {wht}4{yel}."
 8989 print"Do you want to change this?"
 9019 poke198,0
 9023 va=4
 9025 geta$
 9027 if(a$="")then9025
 9033 if((a$="n")or(a$="N"))thenreturn
 9043 if((a$="y")or(a$="Y"))then9058
 9055 goto8956
 9058 gosub9225
 9061 input"{lgrn}{down}New Value (0-6 except 5)";va
 9094 if((va<0)or(va>6))then9061
 9104 if(va=5)then9061
 9110 if(rl(va)=>wi)thenreturn
 9116 print"{down}{rvon}{red}WARNING"
 9129 print"{lred}Resolution selected will result in"
 9167 print"skipping part of the bitmap"
 9197 input"Continue?";a$
 9212 if((a$="n")or(a$="N"))then9058
 9224 return
 9225 print"{down}{lgrn}Printer Resolutions"
 9249 print
 9250 print"{lgrn}0{grn}={lgrn} 480{grn} dots/8 inch line"
 9280 print"{lgrn}1{grn}={lgrn} 960 {grn}dots/8 inch line (1/2 speed)"
 9322 print"{lgrn}2{grn}={lgrn} 960{grn} dots/8 inch line"
 9352 print"{lgrn}3{grn}={lgrn}1920{grn} dots/8 inch line"
 9382 print"{lgrn}4{grn}={lgrn} 640 {grn}dots/8 inch line"
 9412 print"{lgrn}6{grn}={lgrn} 720{grn} dots/8 inch line"
 9442 return
 9443 end
