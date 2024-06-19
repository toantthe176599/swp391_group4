
// handle image preview
const image_event_link = document.querySelectorAll("[image_event]");
const preview = document.querySelectorAll("[preview-img]");

if (preview) {

    preview.forEach((item) => {
        item.closest("div").style.display = "none"
    })
}

if (image_event_link) {
    image_event_link.forEach((item, index) => {
        item.addEventListener("change", (e) => {

            const file = e.target.files[0];
            if (file) {
                preview[index].closest('div').style.display = "block"
                preview[index].src = URL.createObjectURL(file);

            }
        });
    })
}


//end


// handle delete image-preview
const remove_preview = document.querySelectorAll("[remove-preview]");
if (remove_preview) {
    remove_preview.forEach((item, index) => {
        item.addEventListener('click', () => {
            preview[index].src = ""
            preview[index].closest('div').style.display = "none"
            image_event_link[index].value = ''
        })
    })
}
//end


