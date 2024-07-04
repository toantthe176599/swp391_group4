
//handle detail button
const detailBtn = document.querySelectorAll("[detailBtn]");

if (detailBtn) {
    detailBtn.forEach((item) => {
        item.addEventListener("click", () => {
            const idEvent = item.getAttribute("idEvent");
            window.location.href = "/admin/dashboard/detail/" + idEvent;
        })
    })
}
//end