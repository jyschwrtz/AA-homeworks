// document.addEventListener("DOMContentLoaded", function(){
//   const canvas = document.getElementById('mycanvas');
//   canvas.height = 500;
//   canvas.width = 500;
//   const ctx = canvas.getContext('2d');
//   ctx.fillStyle = "rgb(100,250,250)";
//   ctx.fillRect(0, 0, 500, 500);
//
//   ctx.beginPath();
//   ctx.arc(250, 250, 200, 0, 2*Math.PI);
//   ctx.strokeStyle = 'red';
//   ctx.lineWidth = 20;
//   ctx.stroke();
//
//   ctx.fillStyle = 'white';
//   ctx.fill();
//


const sun = new Image();
const moon = new Image();
const earth = new Image();

function init() {
  // sun.src = 'https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/10330321_10154533273792627_457179188170686364_n.jpg?oh=f7cd49c3107b4bca8ec035327a2f244e&oe=5AAD29C3';
   sun.src = 'https://mdn.mozillademos.org/files/1456/Canvas_sun.png';
  moon.src = 'https://mdn.mozillademos.org/files/1443/Canvas_moon.png';
  // earth.src = 'https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/940998_10207912444866554_2442482787619116175_n.jpg?oh=1435eb82ac9bd6cf828e38c16a446cee&oe=5AA8C5E3';
   earth.src = 'https://mdn.mozillademos.org/files/1429/Canvas_earth.png'
  window.requestAnimationFrame(draw);
}

function draw() {
  const canvas = document.getElementById('mycanvas');

  canvas.width = 300;
  canvas.height = 300;

  const ctx = canvas.getContext('2d');

  ctx.globalCompositeOperation = 'destination-over';
  ctx.clearRect(0, 0, 300, 300);

  ctx.fillStyle = 'rgba(0, 0, 0, 0.4)';
  ctx.strokeStyle = 'rgba(0, 153, 255, 0.4)';
  ctx.save();
  ctx.translate(150, 150);

  //Earth
  const time = new Date();
  ctx.rotate(((2 * Math.PI) / 60) * time.getSeconds() + ((2 * Math.PI) / 60000) * time.getMilliseconds());
  ctx.translate(105, 0);
  ctx.fillRect(0, -12, 50, 24);
  // ctx.drawImage(earth, -25, -25, 50, 50);
  ctx.drawImage(earth, -12, -12);

  //Moon
  ctx.save();
  ctx.rotate(((2 * Math.PI) / 6) * time.getSeconds() + ((2 * Math.PI) / 6000) * time.getMilliseconds());
  ctx.translate(0, 28.5);
  ctx.drawImage(moon, -3.5, -3.5);
  ctx.restore();

  ctx.restore();

  ctx.beginPath();
  ctx.arc(150, 150, 105, 0, Math.PI * 2, false);
  ctx.stroke();

  ctx.drawImage(sun, 0, 0);
  // ctx.drawImage(sun, 120, 120, 60, 60);

  window.requestAnimationFrame(draw);
}

init();

// });
