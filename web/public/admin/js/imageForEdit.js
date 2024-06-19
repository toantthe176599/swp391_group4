
// handle image preview
const image_event_link = document.querySelectorAll("[image_event]");
const preview = document.querySelectorAll("[preview-img]");

if (preview) {

    preview.forEach((item) => {
        item.closest("div").style.display = "block"
    })
}

if (image_event_link) {
    image_event_link.forEach((item, index) => {
        item.addEventListener("change", (e) => {

            const file = e.target.files[0];
            if (file) {
                preview[index].closest('div').style.display = "block"
                preview[index].src = URL.createObjectURL(file);

            }
        });
    })
}


//end


// handle delete image-preview
const remove_preview = document.querySelectorAll("[remove-preview]");
if (remove_preview) {
    remove_preview.forEach((item, index) => {
        item.addEventListener('click', () => {
            preview[index].src = ""
            preview[index].closest('div').style.display = "none"
            image_event_link[index].value = ''
        })
    })
}
//end








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
const inputQuantity = document.querySelector('[number-area]');

let quantity = 1;


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


// remove button
function createTdWithRemoveBtn(table, tr) {

    let td = document.createElement('td');
    tr.appendChild(td);

    let btn = document.createElement('button');
    btn.innerHTML = 'Xóa';
    btn.classList.add("btn-danger")
    btn.type = "button"
    td.appendChild(btn);

    btn.addEventListener('click', () => {
        table.removeChild(tr);

        let childSt = 0;
        const childTbody = productTable.querySelector("tbody");

        if (productTable.childElementCount - 2) {
            childSt += productTable.childElementCount;

        }

        if (childTbody) {

            childSt = childTbody.childElementCount + childSt;

        }
        if (inputQuantity) {
            inputQuantity.value = childSt;
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

//end 

const submitBtn = document.querySelector("[submitBtn]");
const submitForm = document.querySelector("[formCreate]");
if (submitBtn) {
    submitBtn.addEventListener("click", () => {
        const areaData = productTable.querySelectorAll("input");
        if (checkDuplicate(areaData)) {
            alert("Bạn đã nhập trùng tên khu vực vui lòng chọn tên khác nhau");
        } else {
            if (submitForm) {
                const isConfirm = confirm("Những thông trên sẽ được thay đổi bạn có muốn tiếp tục?")
                if (isConfirm) {
                    submitBtn.type = "submit";
                }

            }
        }
    });
}

//end


//handle cancel btn
const cancelBtn = document.querySelector("[cancelBtn]");
cancelBtn.addEventListener("click", () => {
    const isConfirm = confirm("các chi tiết bạn vừa thay đổi sẽ bị xóa bạn có muốn tiếp tục");
    if (isConfirm) {
        const eventId = cancelBtn.getAttribute("idEvent");
        window.location.href = "/admin/event/edit/form/" + eventId;
    }
})

//end

// handle delete button in edit form

const btnDeleteEdit = document.querySelectorAll("[deleteButton]");
if (btnDeleteEdit) {
    btnDeleteEdit.forEach((item) => {
        item.addEventListener("click", () => {
            const index = item.getAttribute("deleteButton");
            const child = document.querySelectorAll(`[index]`);
            let realChild;
            child.forEach((jtem) => {
                if (jtem.getAttribute("index") == index) {
                    realChild = jtem;
                }
            })


            let childSt = productTable.childElementCount + 1;
            const childTbody = productTable.querySelector("tbody");
            childTbody.removeChild(realChild)

            if (childTbody) {

                childSt = childTbody.childElementCount;


            }
            if (inputQuantity) {
                inputQuantity.value = childSt;
            }





        })
    })
}

//end 

//handle add a new area
const addNewArea = document.querySelector("[addAnewArea]");
if (addNewArea) {
    addNewArea.addEventListener("click", () => {

        let childSt = productTable.childElementCount + 1;
        const childTbody = productTable.querySelector("tbody");
        let parent;



        if (childTbody) {

            childSt = childTbody.childElementCount + 1;

            parent = childTbody;
        } else {
            parent = productTable;
        }

        let tr = document.createElement('tr');
        createTd(`name_area_${childSt}`, tr, "area", "Tên khu vực");
        createTd(`price_${childSt}`, tr, "area", "Giá vé tại khu vực");
        createTd(`quantity_${childSt}`, tr, "area", "Số lượng vé");
        createTdWithRemoveBtn(parent, tr);
        parent.appendChild(tr);
        inputQuantity.value = childSt;

    });
}

//end

// handle image change 

const imageEvent = document.querySelector("[image_event]");
if (imageEvent) {
    imageEvent.addEventListener('input', () => {
        const change = document.querySelector(`[name="image_event_change"]`);
        change.value = "true"



    })
}

const imageposition = document.querySelector("[image_position]");
if (imageposition) {
    imageposition.addEventListener('input', () => {
        const change = document.querySelector(`[name="image_potition_change"]`);
        change.value = "true"

    })
}
//end





