// const cb = function () {
//   alert('HAMMERTIME');
// };

// window.setTimeout(cb, 5000);

const hammerTime = function (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`)
  }, 5000);
};
