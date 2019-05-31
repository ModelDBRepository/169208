-----VOLTAGE-----

Attached are five files related to obtaining voltages.  With these, you should be 
able to load our base neuron, change most of its parameters (e.g. tighten delta, 
the submyelin gap size), and record the voltages of a certain region of the neuron. 
 The files with INTVOLTAGE in their names record trans-axolemmal voltages, while 
the files with EXTVOLTAGE in their names record trans-fiber voltages.

Base neuron:
 NEURON_001-130308.hoc
Algorithms:
 ALG_PARCHA-130523.hoc ("PARameter CHAnge")
 ALG_INTVOLTAGE-150108.hoc
 ALG_EXTVOLTAGE-150108.hoc
Batch file:
 BATCH_INTVOLTAGE-150108_gap.hoc
 BATCH_EXTVOLTAGE-150108_gap.hoc

BATCH_INTVOLTAGE-150108_gap.hoc and BATCH_EXTVOLTAGE-150108_gap.hoc are the only 
HOC file that should be executed.  Both will load the base neuron and the parameter 
changing algorithm.  BATCH_INTVOLTAGE-150108_gap.hoc will then load the algorithm 
for recording trans-axolemmal voltages while BATCH_EXTVOLTAGE-150108_gap.hoc will 
then load the algorithm for recording trans-fiber voltages.  Then, for each batch 
file, the voltages of two axons will be record will be recorded into two .dat 
files.  Thus, four .dat files will result: trans-axolemmal and trans-fiber voltages 
of axons with a tight and a loose sheath.  The resulting .dat files will hold a 
matrix.  The first element will be a 0, following a row of monitored positions.  
The remaining elements of the first column will be the present simulated time.  The 
remaining elements of the matrix will be the corresponding voltages.  I.e.
 0 P O S I T I O N S
 T  V O L T A G E S
 I  V O L T A G E S
 M  V O L T A G E S
 E  V O L T A G E S
 S  V O L T A G E S
In our example, the positions monitored will begin at the center of the 40th and 
end at the center of the 50th nodes.  For every node, paranode, and internode 
between these two endpoints, there will be 3, 1, and 9 points monitored, 
respectively.  Please consult the comments in ALG_INTVOLTAGE-150108.hoc or 
ALG_EXTVOLTAGE-150108.hoc for more information.

The output of the batch files will be in the MATLAB folder.
