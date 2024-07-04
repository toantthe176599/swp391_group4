

const submitBtn = document.querySelector("[submit-btn]");
const formSubmit = document.querySelector("[form-permisson]")
if (submitBtn) {
    submitBtn.addEventListener("click", () => {
        if (formSubmit) {
            formSubmit.submit();
        }
    });
}

