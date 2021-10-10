const name = document.querySelector('[name="name"]');
const address = document.querySelector('[name="address"]');
const email = document.querySelector('[name="email"]');
const phone = document.querySelector('[name="phone"]');
const comment = document.querySelector('[name="comment"]');

const form = document.querySelector(".feed-form");

document.querySelector(".erorr").innerHTML = "";

form.addEventListener("submit", (e) => {
    e.preventDefault();
    if (/@gmail.com\s*$/.test(email.value)) {
        document.querySelector(".erorr").innerHTML = "Регистрация с таким почтовым адрессом невозможна!";
    } else {
        document.querySelector(".erorr").innerHTML = "";
        console.log("ФИО: ",name.value, "Адрес: ", address.value, "Email: ", email.value, "Тел.: ", phone.value, "Комментарий: ", comment.value);
    }
});
