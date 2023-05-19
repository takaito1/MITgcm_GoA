# MITgcm_GoA
MITgcm regional Gulf of Alaska configuration

## Getting started

### login and access (do this every time you access cori)
- Once you have established an account with CISL, you have access to jupyterhub on NCAR supercomputers. 
- Open your web browser on your laptop. Access the jupyterhub on cori via copying this URL https://jupyterhub.hpc.ucar.edu  
### setting up python environment (do this only once)
- Select Production from the login menu (Available NCAR resources)
- Use your login credentials
- Enter any name in "Name your server" (e.g. modeling)
- Select "Casper login"
- From the select "+" to start a new launcher, and from "other" start a "terminal" to open a command line terminal. 
- First, generate symbolic link to your "work" and "scratch" disk space
> ln -s /glade/work/$USER work
> 
> ln -s /glade/scratch/$USER scratch
> 
> ln -s /glade/campaign/univ/ugit0036 project36
- Next, download "miniconda Linux 64bit" from https://docs.conda.io/en/latest/miniconda.html
- The following version has been installed and tested. 
> wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
- Execute the shell script by typing as follows and set up base of miniconda3
> bash Miniconda3-py39_4.10.3-Linux-x86_64.sh
- Follow the prompts. It will ask for the destination to install miniconda3. I suggest you follow the prompt and use your $HOME.   
- It will ask "Do you wish the installer to initialize Miniconda3?". Answer no to this one. 
- You can manually initialize miniconda3 by typing at the command prompt as follows: 
> source $HOME/miniconda3/etc/profile.d/conda.sh
> 
> conda activate
- You should see (base) before the prompt now. Now you are in the "base" environment. First update the base environment and follow the prompts to completion. 
> conda update -n base -c conda-forge conda
- Next create a new environment (project: you can name it whatever you like)
> conda create --name project python=3.10
- Make the new "project" environment accessible from jupyter notebook
> conda install -c conda-forge ipython ipykernel
> 
> ipython kernel install --user --name=project
- Install additional packages
> mkdir -p work/project
> 
> cd work/project
> 
> git clone https://github.com/takaito1/MITgcm_GoA.git
> 
> pip install numpy scipy netCDF4 matplotlib opencv-python pyyaml pint polygon3 pandas xarray
> 
> git clone https://github.com/AntSimi/py-eddy-tracker
> 
> cd py-eddy-tracker
> 
> python setup.py install
> 
- Now your python environment is ready!

## Eddy tracking example
- Jupyterhub is the starting point. Open your browser and access the following URL: https://jupyterhub.hpc.ucar.edu
- Use the side bar to navigate yourself into work/MITgcm_GoA folder
- Double click the tutorial files to access the examples 
- Tutorial 1: eddy_detection.ipynb
- Tutorial 2: collocation.ipynb

## Model data display example
- Physical spinup from 1980-2009 is available at /glade/campaign/univ/ugit0036/runs
- Tutorial 1: display_data.ipynb
