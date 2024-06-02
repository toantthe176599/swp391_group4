
const changeStatusBtn = document.querySelectorAll("[btn-change-status]");
console.log(changeStatusBtn);
if (changeStatusBtn) {
    changeStatusBtn.forEach((item) => {
        item.addEventListener("click", () => {
            // id status
            const id = item.getAttribute("id");
            const status = item.getAttribute("status");

            const changeStatus = status === "active" ? "inactive" : "active";
            const action = `/admin/status/changeStatus/?status=${changeStatus}&id=${id}`;
      
            window.location.href = action;
        });
    });
}

