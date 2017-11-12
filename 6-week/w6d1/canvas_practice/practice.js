document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = "rgb(100,250,250)";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 200, 0, 2*Math.PI);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 20;
  ctx.stroke();

  ctx.fillStyle = 'white';
  ctx.fill();

});
