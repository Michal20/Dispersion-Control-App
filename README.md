# MATLAB Dispersion Control App

This MATLAB application enables users to manage and control dispersion effectively in optical systems.

## Table of Contents

* [Overview](#overview)
* [Features](#features)

  * [Setup](#setup)
  * [Dispersion Calculation](#dispersion-calculation)
  * [Dispersion Control](#dispersion-control)
* [Usage](#usage)
* [Reference](#reference)

---

## Overview

The app consists of three main sections:

1. **Setup**: Define system components and materials.
2. **Dispersion Calculation**: Compute and visualize the system's spectral phase and dispersion.
3. **Dispersion Control**: Compensate for dispersion using various techniques.

---

## Features

### Setup

* **Materials Management**:

  * Add materials specifying their lengths.
  * Choose from a built-in library or manually input refractive index as a function of frequency or wavelength.
* **Visualization**:

  * Plot refractive index, group delay dispersion (GDD), or third-order dispersion (TOD).

### Dispersion Calculation

* **Spectral Phase Visualization**:

  * Visualize the spectral phase of your system.
  * Adjust the displayed dispersion order.
* **Adjustable Parameters**:

  * Set free-space wavelength and wavelength range.
  * View dispersion parameters (GDD, TOD, etc.).
* **Component Selection**:

  * Show dispersion for all or specific components.

### Dispersion Control

Select among four dispersion compensation methods:

#### Dispersive Mirror

* **File Input**:

  * Upload a two-column file:

    * Column 1: Frequency or wavelength.
    * Column 2: Group delay or group delay dispersion.
* **Visualization**:

  * Plot GDD or TOD for the dispersive mirror alone.

#### Window

* **Material Selection**:

  * Select predefined or manually entered materials.
* **Length Calculation**:

  * Compute window length for GDD=0.
  * Input custom length to calculate resulting dispersion.

#### Prism Pair

* **Material Selection**:

  * Choose prism material as in Setup.
* **GDD and Higher-order Dispersion**:

  * Determine prism separation (R) as a function of insertion depth (H) for GDD=0.
  * Optionally specify TOD=0 or FOD=0 constraints.
  * Manually input R and H to calculate resulting dispersion.

#### Grating Pair

* **Parameters**:

  * Three adjustable parameters:

    * Distance between gratings (L).
    * Angle of incidence.
    * Grating density.
  * Compute dispersion or find missing parameter for GDD=0.

### Visualization

For each dispersion control method:

* **Component-Specific Graph**:

  * Plot GDD or TOD for the dispersion-compensation component only.
* **System Spectral Phase**:

  * Show overall spectral phase including compensation.
  * Customize dispersion order, wavelength range, and free-space wavelength.

---

## Usage

1. Open the MATLAB application.
2. Begin at the **Setup** tab to define your optical system.
3. Move to the **Dispersion Calculation** tab to analyze dispersion.
4. Use the **Dispersion Control** tab to apply the chosen compensation method.

---

## Reference

Dispersion calculations for the prism pair method are based on:

* **Yaakov Shaked, Shai Yefet, Avi Pe’er**. *Dispersion Compensation using a Prism-pair*. (2016) [arXiv:1411.0232v3](https://arxiv.org/abs/1411.0232v3).
