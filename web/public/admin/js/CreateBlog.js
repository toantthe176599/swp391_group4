const cancelBtn = document.querySelector("[cancelBtn]");
if (cancelBtn) {
    cancelBtn.addEventListener("click", () => {
        const isConfirm = confirm("Bạn có chắc chắn muốn hủy bài viết này không");
        if (isConfirm) {
            window.location.href = "/admin/blog"
        }
    })
}