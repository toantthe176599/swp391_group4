
// handle image preview
const image_event_link = document.querySelectorAll("[image_blog]");
const preview = document.querySelectorAll("[preview-img]");


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
            preview[index].src = "";
            preview[index].closest('div').style.display = "none";
            image_event_link[index].value = '';
            const change = document.querySelector(`[name="image_blog_change"]`);
            change.value = "false";
        })
    })
}
//end


// handle image change
const imageEvent = document.querySelector("[image_blog]");
if (imageEvent) {
    imageEvent.addEventListener('input', () => {
        const change = document.querySelector(`[name="image_blog_change"]`);
        change.value = "true";
    })
}

//end


// handle submit and cancel button
const submitBtn = document.querySelector("[submitBtn]");
if (submitBtn) {
    submitBtn.addEventListener("click", () => {
        const isConfirm = confirm("Bạn có chắc muốn thay đổi bài viết này không?");
        if (isConfirm) {
            submitBtn.type = "submit"
        }
    })
}


const cancelBtn = document.querySelector("[cancelBtn]");
if (submitBtn) {
    cancelBtn.addEventListener("click", () => {
        const isConfirm = confirm("Các thay đổi sẽ không được lưu bạn có muốn tiếp tục?");
        if (isConfirm) {
            const idBlog = cancelBtn.getAttribute("idBlog");
            window.location.href = '/admin/blog/edit/form/' + idBlog;
        }
    });
}

//end
