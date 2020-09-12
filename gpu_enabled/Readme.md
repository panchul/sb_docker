# nvidia-docker

This was the original source for the gpu item: https://github.com/Azure/kubeflow-labs

Updating Docker to be able to run on a gpu is described here:
https://docs.docker.com/engine/install/ubuntu/

About `nvidia-docker`: https://github.com/NVIDIA/nvidia-docker , although, to actually
make it run, I had to install `nvidia-docker2` package, that is mentioned as deprecated.


And, for Azure, it there is a page about drivers: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/n-series-driver-setup

## Building and Running

To build it:

    $ sudo docker build -t mytest:gpu -f Dockerfile.gpu .

To run, you need to have nvidia-docker. See `update_docker_ce.sh` script.

    $ sudo nvidia-docker run mytest:gpu


## Troubleshooting

If you are not sure if docker is working with gpu, try this to see proper `nvidia-smi`:

    $ sudo docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi

