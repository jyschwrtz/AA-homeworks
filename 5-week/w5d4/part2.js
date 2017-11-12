function titleize(names, callback) {
  callback(names.map(name => "Mr. " + name + " Jingleheimer Schmidt"))
}

function printCallback(arr) {
  arr.forEach(i => console.log(i))
}

// titleize(["Mary", "Brian", "Leo"], printCallback)


function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(this.name + "the elephant goes 'phrRRRRRRRRRRR!!!!!'");
}

Elephant.prototype.grow = function () {
  this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function () {
  return this.tricks[Math.floor(Math.random() * ellie.tricks.length)];
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
//
// ellie.trumpet();
// ellie.grow();
// console.log(ellie.height);
// ellie.addTrick("trick");
// console.log(ellie.tricks);
// console.log(ellie.play());


Elephant.paradeHelper = function(elephant) {
  console.log(elephant.name + " is passing by!");
}

// Elephant.paradeHelper(micah)

function parade(elephants, callback) {
  elephants.forEach( elephant => callback(elephant) )
}

// parade(herd, Elephant.paradeHelper);


function dinerBreakfast() {
  let order = "I'd like scrambled eggs and bacon please";
  console.log(order);

  return function (food) {
    order = order.slice(0, order.length - 7) + " and " + food + " please.";
    console.log(order);
  };

}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
