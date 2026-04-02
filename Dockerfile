# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (no registry-verified nodes found)
# The workflow lists the following custom nodes under unknown_registry but no aux_id (GitHub repo) was provided,
# so they cannot be automatically installed. Please provide aux_id (GitHub owner/repo) or use registry IDs for these.
# Could not resolve unknown_registry custom node: LoraLoaderModelOnly (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: ComfySwitchNode (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: PrimitiveInt (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: PrimitiveBoolean (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: FluxKontextImageScale (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: ComfySwitchNode (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: PrimitiveInt (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: PrimitiveFloat (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: PrimitiveFloat (no aux_id) -- skipped
# Could not resolve unknown_registry custom node: ComfySwitchNode (no aux_id) -- skipped

# download models into comfyui
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.0-ComfyUI/resolve/main/qwen2.5vl-7b-bf16.safetensors --relative-path models/text_encoders --filename qwen2.5vl-7b-bf16.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.0-ComfyUI/resolve/main/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.1-ComfyUI/resolve/main/FireRed-Image-Edit-1.0-Lightning-8steps-v1.1.safetensors --relative-path models/loras --filename FireRed-Image-Edit-1.0-Lightning-8steps-v1.1.safetensors
RUN comfy model download --url https://huggingface.co/FireRedTeam/FireRed-Image-Edit-1.1-ComfyUI/resolve/main/FireRed-Image-Edit-1.1-transformer.safetensors --relative-path models/diffusion_models --filename FireRed-Image-Edit-1.1-transformer.safetensors
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
