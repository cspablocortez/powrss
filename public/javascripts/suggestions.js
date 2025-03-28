// Submit suggested links in form

const links = document.querySelectorAll("ul li a");
const form = document.querySelector("form");
const formInput = document.querySelector("#feed_url");

links.forEach((link) => {
  link.addEventListener("click", (event) => {
    event.preventDefault();
    formInput.value = link.href;
    form.submit();
  });
});
