# Reliance-on-small-samples-in-a-multidimensional-space

The models (CS, NCS, fNCS models.R) simulate data for n trials and assign a choice (Risky/Safe) for each trial based on the values of kappa, epsilon (E), and frequency (f).
For implementing the CS model - please nullify the E and the f and use kappa only.
For NCS model nullify the f and use E and kappa, and for fNCS use the three variables.

The models compare between the produced results and participants' answers. To read participants' answers the code refers to RawData_states.csv file (line 60).
The simulation and the comparison are performed separately for the Rare Treasure (RT, Set1) and the Rare Disaster (RD, Set2) conditions. 
To tailor the code to a specific condition please implement changes as described in lines 30-31, 64-65 and 70.

To test the parameters on Set 3 please use the "Set3" code and csv.
