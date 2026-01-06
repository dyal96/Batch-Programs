
# 📂 Folder Structure Cloner (Ultra-Fast)

A lightweight automation tool for Windows to clone a directory's folder hierarchy without copying any of the files inside. Perfect for setting up identical project structures (e.g., matching a `2x1` layout to a `1x2` layout).

---

## 🚀 How to Use (The Fast Way)

1. **Drag and Drop:** Grab the folder you want to copy (the Source) and drop it directly onto the `.bat` file icon.
2. **Select Target:** A window will open. Drag and drop the folder where you want the new structure to go (the Target) into that window.
3. **Press Enter:** The script will instantly create all subfolders. It will even create the Target folder for you if it doesn't already exist.
4. **Auto-Done:** The window will show "DONE!" and close itself after 2 seconds.

---

## 🛠️ Key Features

* **File-Free Cloning:** Uses the `xcopy /T /E` command to replicate the "Tree" only. Your images/files stay put; only the folders are cloned.
* **Smart Creation:** If your destination folder doesn't exist yet, the script creates it automatically.
* **Quote Cleaning:** Automatically handles Windows file paths (even if they have spaces or double-quotes).
* **No Editing Required:** No more opening the script to change hardcoded paths.

---

## 📝 Technical Details

* **Command Used:** `xcopy [Source] [Target] /T /E /Y`
* `/T`: Creates directory structure but does not copy files.
* `/E`: Includes empty directories.
* `/Y`: Suppresses prompting to confirm you want to overwrite an existing destination.


* **Compatibility:** Works on Windows 10 and Windows 11.

---

## ⚠️ Important Notes

* Ensure you have **write permissions** for the drive/folder where you are creating the new structure.
* The script only clones the **structure**. If you add new folders to the Source later, you will need to run the script again to sync them.

---
