document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addLi = (e) => {
    e.preventDefault();
    const input = document.querySelectorAll(".favorite-input")[0];
    const li = document.createElement("li");
    const text = document.createTextNode(`${input.value}`);
    li.appendChild(text);
    const ul = document.querySelectorAll("#sf-places")[0];
    ul.appendChild(li);
    input.value = "";
  };

  document.querySelectorAll(".favorite-submit").forEach((button) => {
    button.addEventListener("click", addLi);
  });

  // adding new photos

  const showForm = (e) => {
    e.preventDefault();
    const div = document.querySelectorAll(".photo-form-container")[0];
    if (div.className.includes("hidden")) {
      div.classList.remove("hidden");
    } else {
      div.classList.add("hidden");
    }
  };

  document.querySelectorAll(".photo-show-button").forEach((button) => {
    button.addEventListener("click", showForm);
  });

  const addUrl = (e) => {
    e.preventDefault();
    const img = document.createElement("img");
    const li = document.createElement("li");
    const ul = document.querySelectorAll(".dog-photos")[0];
    const input = document.querySelectorAll(".photo-url-input")[0];
    img.src = input.value;

    li.appendChild(img);
    ul.appendChild(li);
    input.value = "";
  };

  document.querySelectorAll(".photo-url-submit").forEach((button) => {
    button.addEventListener("click", addUrl);
  });


});
