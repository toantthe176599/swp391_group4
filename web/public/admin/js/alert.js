const show_alert = document.querySelector("[show-alert]");

if (show_alert) {

    const timeShow = show_alert.getAttribute("data-time");



    setTimeout(() => {
        show_alert.classList.add("alert-hidden");

    }, parseInt(timeShow));
    setTimeout(() => {
        show_alert.style.display = 'none';

    }, parseInt(timeShow));
}