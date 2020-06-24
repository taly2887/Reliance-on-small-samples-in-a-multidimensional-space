# Reliance-on-small-samples-in-a-multidimensional-space

The model simulates data for n trials and assigns a choice (Risky/Safe) for each trial based on the values of kappa, epsilon (E), and frequency (f).
For implementing the CS model - please nullify the E and the f and use kappa only.
For NCS model nullify the f and use E and kappa, and for fNCS use the three variables.

The model compares between the produced results and participants' answers. To read participants' answers it refers to the RawData_states.csv file in line 60.
The simulation and the comparison are performed separately for Rare Treasure (RT) and Rare Disaster (RD) conditions. 
To tailor the code to a specific condition please implement changes as described in lines 30-31, 64-65 and 70.
