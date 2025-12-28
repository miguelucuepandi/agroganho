function previewImage(event){
    const file = event.target.files[0];
    const previewContainer = document.getElementById('previewContainer');
    if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = e =>
            previewContainer.innerHTML = `<img src="${e.target.result}" alt ="preview">`;
        reader.readAsDataURL(file);
    }else{
        previewContainer.innerHTML = "File not supported";
    }
}