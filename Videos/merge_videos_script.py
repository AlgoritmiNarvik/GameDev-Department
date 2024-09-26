import moviepy.editor as mp
import moviepy.video.fx.resize as resize_fx
import numpy as np

# Patch the resize function
def patched_resizer(pic, newsize):
    from PIL import Image
    pilim = Image.fromarray(pic)
    resized_pil = pilim.resize(newsize[::-1], Image.LANCZOS)
    return np.array(resized_pil)

resize_fx.resizer = patched_resizer

# Paths to your trimmed video files
video_paths = [
    'Videos/Zombie survival - video gameplay - trimed.mp4',
    'Videos/Gamemaker scripting language, games under the hood-trimmed.mp4',
    'Videos/Gumdrop goes shopping - video gameplay - trimmed.mp4'
]

# Load the video clips
clips = [mp.VideoFileClip(path) for path in video_paths]

# Define a common resolution (width, height)
common_resolution = (720, 1280)

# Resize clips to the common resolution using a lambda function
resized_clips = [clip.resize(lambda t: common_resolution) for clip in clips]

# Concatenate the clips in the given order
final_clip = mp.concatenate_videoclips(resized_clips)

# Define the output path for the merged video
output_path = 'Videos/merged_trimmed_video.mp4'

# Write the final merged video to the output file
final_clip.write_videofile(output_path, codec="libx264")

print(f"Video merged successfully and saved to {output_path}")