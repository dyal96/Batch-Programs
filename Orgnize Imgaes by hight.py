import os
from PIL import Image
import shutil

# folder where images are stored
source_folder = os.getcwd()

for file in os.listdir(source_folder):
    if file.lower().endswith(('.png', '.jpg', '.jpeg', '.webp')):
        path = os.path.join(source_folder, file)

        try:
            with Image.open(path) as img:
                width, height = img.size

            # create folder based on height
            folder_name = f"{height}px"
            target_folder = os.path.join(source_folder, folder_name)

            os.makedirs(target_folder, exist_ok=True)

            # move file
            shutil.move(path, os.path.join(target_folder, file))

        except Exception as e:
            print(f"Error with {file}: {e}")

print("Done!")