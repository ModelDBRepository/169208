-----VELOCITY-----

Attached are six files related to obtaining conduction velocities.  With these,
you should be able to load our base neuron, change most of its parameters (e.g.
tighten delta, the submyelin gap size), and record the resulting conduction
velocities.

Base neuron:
 NEURON_001-130308.hoc
Algorithms:
 ALG_PARCHA-130523.hoc ("PARameter CHAnge")
 ALG_VELOCITY-130308.hoc
Batch file:
 BATCH_VELOCITY-141106_myeL_gap_1.hoc
 BATCH_VELOCITY-141106_myeL_gap_2.hoc
Other:
 ALG_PARCHA-130523.pdf (Supplementary documentation for the PARCHA algorithm)

BATCH_VELOCITY-141106_myeL_gap_1.hoc and BATCH_VELOCITY-141106_myeL_gap_2.hoc are 
the only HOC files that should be executed. They will load the base neuron, the two 
algorithms, then record the conduction velocities of 54 axons (6 different 
internode lengths X 9 different submyelin gap sizes). Each batch file simulates 
three different internode lengths.  The outputs are two DAT files each containing a 
27x3 matrix, where each of the 54 rows contain an internode length, a gap size, and 
the resulting velocity. Please note that these batch files may take a long time to 
run on some computers. If this is unacceptable, you may need to edit the batch file 
and remove some parameters.

The output of the batch files will be in the MATLAB folder.