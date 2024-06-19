const imgDemo = document.querySelectorAll("[img-demo]");
if (imgDemo) {
    imgDemo.forEach((item) => {
        item.addEventListener("click", () => {
            const id = item.getAttribute("idEvent");
            window.location.href = "/admin/event/detail/" + id;
        })
    })
}
