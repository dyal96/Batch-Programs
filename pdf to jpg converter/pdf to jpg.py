import fitz  # PyMuPDF
import sys
import os

def pdf_to_jpg(pdf_path):
    if not os.path.exists(pdf_path):
        print(f"File not found: {pdf_path}")
        return
        
    print(f"Processing '{pdf_path}'...")
    try:
        doc = fitz.open(pdf_path)
    except Exception as e:
        print(f"Error opening pdf: {e}")
        return
    
    # Create folder with the same name as the PDF
    base_name = os.path.basename(pdf_path)
    folder_name = os.path.splitext(base_name)[0]
    
    output_dir = os.path.join(os.path.dirname(pdf_path), folder_name)
    os.makedirs(output_dir, exist_ok=True)
    
    for page_index in range(len(doc)):
        page = doc.load_page(page_index)
        # Higher DPI (e.g., 300) improves quality
        pix = page.get_pixmap(dpi=300)
        output_path = os.path.join(output_dir, f"page_{page_index + 1}.jpg")
        pix.save(output_path)
    doc.close()
    print(f"Successfully converted {len(doc)} pages into '{output_dir}'.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        # Loop through all files if multiple files are dragged and dropped
        for pdf_file in sys.argv[1:]:
            pdf_to_jpg(pdf_file)
    else:
        print("Please drag and drop a PDF file.")
