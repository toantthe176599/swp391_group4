
// handle delete button
const deleteBtn = document.querySelectorAll("[delete-btn-role]");
console.log("oke");
if (deleteBtn) {
    deleteBtn.forEach((item) => {
        item.addEventListener("click", () => {
            const role = item.getAttribute("role")
            const isConfirm = confirm(`Bạn có chắc muốn xóa vai trò ${role}?`);
            if (isConfirm) {
                window.location.href = `/admin/role/delete/${role}`;
            }
        });

    })
}

//end


// handle permission 



//end