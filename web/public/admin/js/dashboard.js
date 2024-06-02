




// handle delete button account
const btnDeleteAcc = document.querySelectorAll("[delete-btn]");
if (btnDeleteAcc) {
    btnDeleteAcc.forEach((item) => {
        item.addEventListener("click", () => {
            const isConfirm = confirm("Tài khoản này sẽ bị xóa! Bạn có muốn tiếp tục hành động");
            if (isConfirm) {
                const id = item.getAttribute("id");
                window.location.href = "/admin/account/delete/" + id;
            }
        })
    })
}




// end handle delete button account
