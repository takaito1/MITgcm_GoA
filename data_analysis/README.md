## README
- This folder contains scripts used for data analysis and plotting figures.

## Project objectives

## 1. Filling data gaps
- The data gap is relatively large.
- Interpolation: we may use polynomial fit to smoothly fill data gaps, but this may not work well for large gaps. 
- Seasonal decomposition: we may separate data into seasonal and inter-annual components, and use known seasonal cycle to fill data gaps (interpolating inter-annual variability only)
- Model prior: Abe model is highly skillful (r=0.8+) in predicting T and S and is moderately skilled (r=0.5) in pCO2 without any data gaps. Use this as a prior estimate, and combine model output and the mooored observation to come up with a best estimate of the pCO2 time series data

## 2. Estimating DIC and Alkalinity time series
- Mooring data does not include DIC and Alkalinity observations
- These variables are linked to pCO2 observations through carbonate chemistry (we can use PyCO2SYS package)
- $\delta pCO_2 = \alpha_T \delta T + \alpha_S \delta S + \alpha_C \delta DIC + \alpha_A \delta Alk$
- The question: Given observed T, S, and pCO2 (gap filled), obtain the best estimates of DIC and Alkalinity using our knowledge of carbonate chemistry ($\alpha_i$)
- Abe model includes all above variables in the output
- Model prior: Combine model output and existing mooored observation (T, S, pCO2) to come up with a best estimate of the DIC and Alkalinity time series data
- Once complete, you can validate your DIC and Alkalinity reconstructions against the mooring's pH data, and DIC and Alkalinity data from World Ocean Database (Taka will updated this repo with this data soon).

## 3. Final product: Attribution
- Based on the modeled and observed time series of T, S, pCO2, Alk and DIC, explain what caused the pCO2 excursions during marine heat waves of 2014, 2019 and 2023?
