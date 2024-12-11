# This setup is now deprecated
Follow the instructions in [UAV Toolbox support package for PX4 Autopilots](https://www.mathworks.com/help/uav/px4-spkg.html) to find the latest documentation on the PX4 integration with MATLAB & Simulink

# PX4-Setup
Toolchain setup of Embedded Coder support package for PX4 Autopilots
## Introduction
Using  [Embedded Coder support package for PX4 Autopilots](https://www.mathworks.com/hardware-support/px4-autopilots.html), you can generate ANSI/ISO C++ from Simulink® models specifically tailored for the Pixhawk FMU (flight management unit) using the PX4 Toolchain. You can customize algorithms that leverage onboard sensor data and other calculations at runtime.

## PX4 toolchain setup
PX4 toolchain setup includes the installation of different third-party utilities like GCC 7.2.1, CMake 3.x, Ninja 1.6, Git, RTPS and certain Python packages, which are required for building the PX4 Firmware. 
            
The shell scripts are modified versions of the [PX4 Devguide](https://github.com/PX4/Devguide/tree/master/build_scripts), to suit the Embedded Coder support package for PX4 Autopilots.


