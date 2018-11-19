# I've edited 8.1 only
- I've added cells for the L_AV loop, look through this code to understand what I have done, and change the plotting
code to look similar (i.e. one subplot for each value of Lamdba). You will need to change the UtilityDifference/pGamble code so it can do things for each cell.

- i've edited the loop so there is no concatenation, make sure you understand how this works and check with me
if it is unclear.

- I've changed the loss equations for the certain so it has the minus. Check the equation in the paper again.
It says -lamdba*(-Vcertain)^again. So Vcertain is already a negative number, so the extra '-' here
tells you this number should be the absolute value of Vcertain.

- Can you change the design matrices at the top so they only give sensible gambles (i.e. each is a loss/gain/mixed in the traditional sense)
I can see you've started with with VGambleLoss. Make sure you look at the Ugamble equation in the paper
and edit it like I did with Vcertain in the comment above.
