---
title: Real-Time Latent Consistency Model Image-to-Image ControlNet
emoji: 🖼️🖼️
colorFrom: gray
colorTo: indigo
sdk: docker
pinned: false
suggested_hardware: a10g-small
---

# Real-Time Latent Consistency Model

# I've made several changes to the main branch for this Repo.

1) I've added a Desktop Capture feature for Img2Img ControlNet/Canny.
2) I've added several Windows Bat scripts to get you started more easily.

This demo showcases [Latent Consistency Model (LCM)](https://huggingface.co/SimianLuo/LCM_Dreamshaper_v7) using [Diffusers](https://github.com/huggingface/diffusers/tree/main/examples/community#latent-consistency-pipeline) with a MJPEG stream server.


## Running Locally

You need CUDA and Python 3.10, Mac with an M1/M2/M3 chip or Intel Arc GPU

`TIMEOUT`: limit user session timeout  
`SAFETY_CHECKER`: disabled if you want NSFW filter off  (Currently Disabled for Img2Img ControlNet/Canny).
`MAX_QUEUE_SIZE`: limit number of users on current app instance  
`TORCH_COMPILE`: enable if you want to use torch compile for faster inference works well on A100 GPUs


## Install

```bash
python -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```
OR

Run included "_Step_1_Install.bat"

If you're running locally and want to test it on Mobile Safari, the webserver needs to be served over HTTPS.

```bash
openssl req -newkey rsa:4096 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
uvicorn "app-img2img:app" --host 0.0.0.0 --port 7860 --reload --log-level info --ssl-certfile=certificate.pem --ssl-keyfile=key.pem
```
OR

Run included "_Step_2_Optional_Create_SSL_Needed_for_Remote_access.bat"


# LCM
### Image to Image ControlNet Canny

Based pipeline from [taabata](https://github.com/taabata/LCM_Inpaint_Outpaint_Comfy)

```bash
uvicorn "app-controlnet:app" --host 0.0.0.0 --port 7860 --reload
```
OR
Run "_Step_3a_Start_RTLCM-With_SSL_ControlNet.bat" if you are using an SSL Cert.

Run "_Step_3b_Start_RTLCM-Without_SSL_ControlNet.bat" if you are not using an SSL Cert.

Img2Img w/ ControlNet is the only mode I've updated with "Capture Desktop" option. 


### Image to Image

```bash
uvicorn "app-img2img:app" --host 0.0.0.0 --port 7860 --reload
```

### Text to Image

```bash
uvicorn "app-txt2img:app" --host 0.0.0.0 --port 7860 --reload
```

# LCM + LoRa

Using LCM-LoRA, giving it the super power of doing inference in as little as 4 steps. [Learn more here](https://huggingface.co/blog/lcm_lora) or [technical report](https://huggingface.co/papers/2311.05556)



### Image to Image ControlNet Canny LoRa


```bash
uvicorn "app-controlnetlora:app" --host 0.0.0.0 --port 7860 --reload
```

### Text to Image

```bash
uvicorn "app-txt2imglora:app" --host 0.0.0.0 --port 7860 --reload
```


### Setting environment variables

```bash
TIMEOUT=120 SAFETY_CHECKER=True MAX_QUEUE_SIZE=4 uvicorn "app-img2img:app" --host 0.0.0.0 --port 7860 --reload
```


## Docker

You need NVIDIA Container Toolkit for Docker

```bash
docker build -t lcm-live .
docker run -ti -p 7860:7860 --gpus all lcm-live
```

or with environment variables

```bash
docker run -ti -e TIMEOUT=0 -e SAFETY_CHECKER=False -p 7860:7860 --gpus all lcm-live
```

# Demo on Hugging Face

https://huggingface.co/spaces/radames/Real-Time-Latent-Consistency-Model

https://github.com/radames/Real-Time-Latent-Consistency-Model/assets/102277/c4003ac5-e7ff-44c0-97d3-464bb659de70
