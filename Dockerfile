FROM jupyter/minimal-notebook:54462805efcb
USER root
COPY packages packages
RUN sudo apt-get update 
RUN conda env create -f packages/root.yml
SHELL ["conda","run","-n","rootnb","/bin/bash","-c"]
RUN python -m ipykernel install --name rootnb --display-name "root"
RUN pip install scipy && \
    pip install numpy && \ 
    pip install h5py && \
    pip install matplotlib && \ 
    pip install Cython