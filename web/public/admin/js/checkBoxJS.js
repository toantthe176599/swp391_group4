$(document).ready(function () {
    $(".checkAll").on("click", function () {
        $(this)
                .closest("table")
                .find("tbody :checkbox")
                .prop("checked", this.checked)
                .closest("tr")
                .toggleClass("selected", this.checked);
    });

    $("tbody :checkbox").on("click", function () {
        // toggle selected class to the checkbox in a row
        $(this)
                .closest("tr")
                .toggleClass("selected", this.checked);

        // add selected class on check all
        $(this).closest("table")
                .find(".checkAll")
                .prop("checked",
                        $(this)
                        .closest("table")
                        .find("tbody :checkbox:checked").length ==
                        $(this)
                        .closest("table")
                        .find("tbody :checkbox").length
                        );
    });
});





// handle data box ticket to send to db

const tablePermiss = document.querySelector("[table-permission]");
if (tablePermiss) {
    const data = [];
    const btnSubmit = document.querySelector("[submit-btn]"); // submit button
    btnSubmit.addEventListener("click", () => { // click submit
        // handel data
        const row = document.querySelectorAll("[data-name]");
        row.forEach(item => {


            const inputs = item.querySelector("input");
            const inputcheck = inputs.checked;
            if (inputcheck) {
                data.push(item.getAttribute("data-name"));
            }


        }

        );
        //end

        const formSubmit = document.querySelector("[form-permisson]");
        const inputPermission = formSubmit.querySelector("input[name=permissionlist]");
        inputPermission.value = data.join(" ");
        formSubmit.submit();

    });
}

//end

console.log("oke")

//handle set default value
const allData = document.querySelector("[all-data]");
if (allData) {
    const tablePermission = document.querySelector("[table-permission]");
    const permissionList = allData.getAttribute("all-data").trim();

    if (permissionList != "") {
        const arrayPermission = permissionList.split(" ");
        arrayPermission.forEach(item => {
            const temp = "[" + item + "]";
            const row = document.querySelector(`[data-name=${item}]`);
            const box = row.querySelector("input");
            box.checked = true;

        });
    }
}

//end