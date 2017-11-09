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
    const button = e.target;
    const input = document.querySelectorAll(".favorite-input")[0];
    console.log(input.value);
    const li = document.createElement("li");
    const text = document.createTextNode(`${input.value}`);
    li.appendChild(text);
    const ul = document.querySelectorAll("#sf-places")[0];
    ul.appendChild(li);
  };

  document.querySelectorAll(".favorite-submit").forEach((button) => {
    button.addEventListener("click", addLi);
  });

  // adding new photos





});
