{m=0}
match($0,/cloned-mac-address=([0-9A-F][0-9A-F]):([0-9A-F][0-9A-F]):([0-9A-F][0-9A-F]):([0-9A-F][0-9A-F]):([0-9A-F][0-9A-F]):([0-9A-F][0-9A-F])/, ai) { 
  for (i = 6; i > 0; i--) mac[i-1]=ai[i];
  IncMac(mac)
  print "cloned-mac-address=" mac[0] ":" mac[1] ":" mac[2] ":" mac[3] ":" mac[4] ":" mac[5]
  m=1
}
m==0

BEGIN { 
  for(i=0;i<10;i++) { decv[i]=i; hexv[i]=i }
  decv["a"]=10;decv["b"]=11;decv["c"]=12;decv["d"]=13;
  decv["e"]=14;decv["f"]=15;
  decv["A"]=10;decv["B"]=11;decv["C"]=12;decv["D"]=13;
  decv["E"]=14;decv["F"]=15
  hexv[10]="A";hexv[11]="B";hexv[12]="C";
  hexv[13]="D";hexv[14]="E";hexv[15]="F";
  hexv[16]="0";

  # Test IncHex2
  #print "inc 24: " IncHex2("24") ", Ff: " IncHex2("Ff") ", 1a: " IncHex2("1a") ", 10: " IncHex2("10")

  # Test IncMac
  #mac[0]="30";mac[1]="24";mac[2]="32";mac[3]="98";mac[4]="24";mac[5]="fF"
  #IncMac(mac)
  #print "mac 30:24:32:98:24:fF: " mac[0] ":" mac[1] ":" mac[2] ":" mac[3] ":" mac[4] ":" mac[5] 
}

function IncMac(mac)
{
  for (i = 5; i >= 0; i--) {
    mac[i] = IncHex2(mac[i])
    if (mac[i] != "00") break
  }
}

function IncHex2(a) {
  if (a == "FF") return "00"

  ld = substr(a,2,1)
  hd = substr(a,1,1)

  ldi = IncHex(ld)
  if (ldi == "0") {
    return IncHex(hd) ldi
  } else return hd ldi
}

function IncHex(h) {
  return hexv[decv[h] + 1];
}

