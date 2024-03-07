#!/bin/bash

pushd Triton_Inference_Server_Python_API
./build.sh --framework diffusion --build-models # Generate onnx weights + huggingface cache
popd

# Build anyscale compatible image with weights baked into the image
docker build -f Dockerfile.anyscale -t anyscale-triton-diffusion:latest . 
