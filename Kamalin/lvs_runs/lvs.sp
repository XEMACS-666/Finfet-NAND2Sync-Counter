** Layout Netlist, pvs precompare
** 

.subckt nand2 A B Y gnd vdd 
MX11/M0 4 B gnd gnd N1SVT L=1.8e-08 nf=1 nfin=4 m=1 
MX12/M0 Y A 4 gnd N1SVT L=1.8e-08 nf=1 nfin=4 m=1 
MX13/M0 Y A vdd vdd P1SVT L=1.8e-08 nf=1 nfin=2 m=1 
MX14/M0 Y B vdd vdd P1SVT L=1.8e-08 nf=1 nfin=2 m=1 
.ends


