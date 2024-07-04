const deleteBtn = document.querySelectorAll("[remove-button]")
if (deleteBtn) {
    deleteBtn.forEach((item) => {
        item.addEventListener("click", () => {
            const idEvent = item.getAttribute("idCategory");
            const isConfirm = confirm("Bạn có chắc muốn xóa loại sự kiện này (Loại sự kiện sẽ không thể xóa nếu có sự kiện đang ở thể loại này)");
            if (isConfirm) {
                window.location.href = "/admin/category/delete/" + idEvent;
            }
        });
    });
}