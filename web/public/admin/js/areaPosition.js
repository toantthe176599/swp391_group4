




//handle date input
const today = new Date();
today.setDate(today.getDate() + 3); // Trừ đi 3 ngày từ hôm nay
const minDate = today.toISOString().split('T')[0];

const timeInput = document.getElementById('start_date');
if (timeInput) {
    timeInput.setAttribute('min', minDate);
}

//end



// handle ticket type

const productTable = document.getElementById('table');
const inputQuantity = document.querySelector('input[name=area_quantity]');

let quantity = 1;
let tr = document.createElement('tr');
createTd(`name_area_1`, tr, "area", "Tên khu vực");
createTd(`price_1`, tr, "area", "Giá vé tại khu vực");
createTd(`quantity_1`, tr, "area", "Số lượng vé");
createTdWithRemoveBtn(productTable, tr);
productTable.appendChild(tr);

const numberArea = document.querySelector("[number-area]");

if (numberArea) {

    numberArea.addEventListener('input', () => {
        productTable.innerHTML = '';
        quantity = parseInt(numberArea.value);

        if (quantity == NaN || quantity > 100) {
            alert("Số khu vực phải là dạng số và lớn hơn 0 nhỏ hơn 100");
            quantity = 1;
        }

        for (let i = 1; i <= quantity; i++) {

            let tr = document.createElement('tr');
            createTd(`name_area_${i}`, tr, "area", "Tên khu vực");
            createTd(`price_${i}`, tr, "area", "Giá vé tại khu vực");
            createTd(`quantity_${i}`, tr, "area", "Số lượng vé");

            createTdWithRemoveBtn(productTable, tr);
            productTable.appendChild(tr);
        }
        const childQuantity = productTable.childElementCount;
        inputQuantity.value = childQuantity;
    });
}










function createTd(text, tr, className, title) {

    let td = document.createElement('td');
    let inp = document.createElement('input');
    inp.placeholder = title;
    inp.name = text;
    if (title != 'Tên khu vực') {
        inp.type = "number";
        inp.min = 1;
    } else {
        inp.type = "text";
    }
    inp.required = true;
    inp.step = 1
    td.appendChild(inp);

    tr.appendChild(td);

    if (className) {
        td.classList.add(className);
    }

//    setTdEditable(table, tr, td, editable);

}

function createTdWithRemoveBtn(table, tr) {

    let td = document.createElement('td');
    tr.appendChild(td);

    let btn = document.createElement('button');
    btn.innerHTML = 'Xóa';
    btn.classList.add("btn-danger")
    td.appendChild(btn);

    btn.addEventListener('click', () => {
        table.removeChild(tr);

        const childQuantity = productTable.childElementCount;

        if (inputQuantity) {
            inputQuantity.value = childQuantity;
        }



    });
}

//end





// handle duplicate element in productable

const checkDuplicate = (areaData) => {
    let result = [];
    if (areaData) {
        for (let i of areaData) {
            if (i.name.startsWith('name_area')) {


                result.push(i.value.trim().toLowerCase());
            }
        }
    }

    let temp = [... new Set(result)];

    if (temp.length != result.length) {
        return true;
    }
    return false;
};


const submitBtn = document.querySelector("[submitBtn]");
const submitForm = document.querySelector("[formCreate]");
if (submitBtn) {
    submitBtn.addEventListener("click", () => {
        const areaData = productTable.querySelectorAll("input");
        if (checkDuplicate(areaData)) {
            alert("Bạn đã nhập trùng tên khu vực vui lòng chọn tên khác nhau");
        } else {
            if (submitForm) {
                submitBtn.type = "submit";
            }
        }
    });
}

//end


// cancelBtn
const cancelBtnCreateEvent = document.querySelector("[cancelBtn]")
if (cancelBtnCreateEvent) {
    cancelBtnCreateEvent.addEventListener("click", () => {
        const isConfirm = confirm("Bạn có chắc muốn hủy không?");
        if (isConfirm) {
            window.location.href = "/admin/event";
        }
    }
    )
}

//end

