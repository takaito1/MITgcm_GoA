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
> ln -s /glade/scratch/$USER scratch
> ln -s /glade/campaign/univ/ugit0036 project
- Next, download "miniconda Linux 64bit" from https://docs.conda.io/en/latest/miniconda.html 
- This can be done using wget command, or first download it to your computer and use the upload icon on the jupyterhub to upload the Miniconda3-pyXXXX-Linux-x86_64.sh file to your home directory
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
> conda update --all
- Next install mamba. This is a parallel version of conda. 
> conda install mamba -c conda-forge
- you will copy the env-calc.yml file from this repository. Try: 
> cd work
>
> git clone https://github.com/takaito1/MITgcm_GoA.git
> 
> cd MITgcm_GoA
- Create a new "calc" environment. (This might take a while, please be patient)
> mamba env create -f env-calc.yml
- Make the new "calc" environment accessible from jupyter notebook
> conda activate calc
> 
> python -m ipykernel install --user --name calc
- Now your python environment is ready!
