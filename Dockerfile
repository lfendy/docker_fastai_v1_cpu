FROM continuumio/miniconda3:4.6.14

RUN mkdir /code

WORKDIR /code

COPY ./environment-cpu.yml /code/environment-cpu.yml

RUN conda env create -f /code/environment-cpu.yml && \
    conda clean --all --yes

RUN conda init bash
RUN conda install -n fastai-cpu -y scikit-learn=0.21.3
RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0
RUN pip install opencv-python

RUN echo "conda activate fastai-cpu" >> ~/.bashrc
CMD bash -c "source /root/.bashrc && jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root"
