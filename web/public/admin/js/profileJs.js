
//handle update btn 
const updateBtn = document.querySelector("[updateBtn]");
if (updateBtn) {
    updateBtn.addEventListener('click', () => {
        window.location.href = "/admin/profile/update/form";
    })
}
//end