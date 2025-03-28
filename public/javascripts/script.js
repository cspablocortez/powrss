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

// Add URI scheme

function addScheme() {
  const input = document.querySelector("#feed_url");
  let url = input.value.trim();

  if (!url.match(/^[a-zA-Z][a-zA-Z\d+\-.]*:\/\//)) {
    url = "https://" + url;
  }

  // Add .com if no TLD is detected (basic check for domain structure)
  const domainPattern = /^(https?:\/\/)?([a-zA-Z0-9.-]+)$/;
  const pathPattern = /^(https?:\/\/)?([a-zA-Z0-9.-]+)(\/.*)?$/;

  if (domainPattern.test(url) && !url.match(/\.[a-zA-Z]{2,}$/)) {
    url = url.replace(pathPattern, "$1$2.com$3");
  }

  input.value = url;
  return true; // Proceed with form submission
}
