FROM runpod/worker-comfyui:5.5.1-base

RUN comfy node install pysssss/ComfyUI-Custom-Scripts
# Switch Nodes -> ComfyUI-Logic
RUN comfy node install AInseven/ComfyUI-Logic
# LoraLoaderModelOnly -> ComfyUI-Essentials (or core update)
RUN comfy node install pysssss/ComfyUI-Essentials
# Flux Specific Nodes -> ComfyUI-Flux-Utils
RUN comfy node install Gourieff/ComfyUI-Flux-Utils
# download models into comfyui
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.0-ComfyUI/resolve/main/qwen2.5vl-7b-bf16.safetensors --relative-path models/text_encoders --filename qwen2.5vl-7b-bf16.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.0-ComfyUI/resolve/main/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.1-ComfyUI/resolve/main/FireRed-Image-Edit-1.0-Lightning-8steps-v1.1.safetensors --relative-path models/loras --filename FireRed-Image-Edit-1.0-Lightning-8steps-v1.1.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.1-ComfyUI/resolve/main/FireRed-Image-Edit-1.1-transformer.safetensors --relative-path models/diffusion_models --filename FireRed-Image-Edit-1.1-transformer.safetensors
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
