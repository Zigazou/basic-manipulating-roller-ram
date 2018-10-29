5 def fnbank(address)=fix(address/16384)+4
6 def fnmodulo(value,modulo)=value-modulo*fix(value/modulo)
10 roller.size=512:scr.size=720*256/8
20 roller.base=round((himem-scr.size-roller.size)/512)*512
30 scr.size=720*256/8
40 scr.base=roller.base+roller.size
50 memory roller.base - 1
60 print "Free memory:";fre(0);"bytes"
70 print "Initialiasing new roller RAM"; 
80 gosub 10000
90 print:print "Make the video controller use the new roller RAM"
100 gosub 20000
110 for i=scr.base to scr.base+scr.size-1
120 poke i,&hff
130 next
140 out &hf5,&h5b
150 end
10000 REM INITIALIZE ROLLER RAM
10010 for i=0 to 255
10020     address=scr.base+fix(i/8)*720+i mod 8
10030     inbank=address-fix(address/16384)*16384
10040     pointer=fnbank(address)*8192+fix(inbank/16)*8+inbank mod 8
10050     poke roller.base+i*2+1, fix(pointer/256)
10060     poke roller.base+i*2, fnmodulo(pointer, 256)
10070     print ".";
10080 next
10090 return
20000 REM SET ROLLER RAM ADDRESS
20010 bank=fnbank(roller.base)
20020 address=roller.base-fix(roller.base/16384)*16384
20030 out &hf5, bank*32+fix(address/512)
20040 return

