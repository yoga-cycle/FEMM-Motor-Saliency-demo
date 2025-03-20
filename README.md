# FEMM-Motor-Saliency-demo
FEMM simulation that shows the saliency present in I-PMSM (Interior Permanent Magnet Synchronous Motor).

In this project, FEMM is used to demonstrate the saliency present in I-PMSM. Saliency is observed by estimating the inductance as seen by a phase winding at different rotor positions. We estimate the inductance by first measuring the flux through the winding with no current in the winding. This flux is due to the magnet. Then, some current is passed through the winding and the flux is measured again. The difference in the flux measured divided by the current is an approximation for the inductance.

![alt text](/resources/inductance-vs-angle.gif)

Saliency in motors allow the motor controller to operate without sensors even at low speeds and in standstill conditions. The motor controller exploits the rotor dependent inductance to extract the rotor angle. 

# Run the demo

To run the demo, 
- download the resources folder.
- Open HFI.FEM
- Click on File->Open Lua Script. Select the inductance.lua
- The simulation starts running and the inductance measured vs rotor angles are diplayed on the console

Values obtained in the console are plotted with MS Excel

![alt text](/resources/inductance-vs-angle-plot.png)
