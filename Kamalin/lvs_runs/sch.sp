** Schematic Netlist, pvs precompare
** 

.subckt nand2 A B Y gnd vdd 
MMNM1 net1 B gnd gnd N1SVT m=1 l=1.8e-08 nfin=4 nf=1 
MMNM0 Y A net1 gnd N1SVT m=1 l=1.8e-08 nfin=4 nf=1 
MMPM1 Y B vdd vdd P1SVT m=1 l=1.8e-08 nfin=2 nf=1 
MMPM0 Y A vdd vdd P1SVT m=1 l=1.8e-08 nfin=2 nf=1 
.ends


