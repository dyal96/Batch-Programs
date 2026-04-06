from pdf2image import convert_from_path
import sys
import os

def pdf_to_jpg(pdf_path):
    if not os.path.exists(pdf_path):
        print(f"File not found: {pdf_path}")
        return
        
    print(f"Processing '{pdf_path}'...")
    # Create folder with the same name as the PDF
    base_name = os.path.basename(pdf_path)
    folder_name = os.path.splitext(base_name)[0]
    
    output_dir = os.path.join(os.path.dirname(pdf_path), folder_name)
    os.makedirs(output_dir, exist_ok=True)

    try:
        # Returns a list of PIL Image objects
        images = convert_from_path(pdf_path, dpi=300)
    except Exception as e:
        print(f"Error processing pdf: {e}")
        return
    
    for i, image in enumerate(images):
        output_path = os.path.join(output_dir, f"page_{i + 1}.jpg")
        image.save(output_path, 'JPEG')
        
    print(f"Successfully converted {len(images)} pages into '{output_dir}'.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        # Loop through all files if multiple files are dragged and dropped
        for pdf_file in sys.argv[1:]:
            pdf_to_jpg(pdf_file)
    else:
        print("Please drag and drop a PDF file.")
